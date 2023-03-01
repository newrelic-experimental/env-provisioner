#############################################
# EC2 Instances
#############################################

### Fetch Canary EC2 Instances IDs by TAG.
data "aws_instances" "canary_instances" {
  filter {
    name   = "tag:Name"
    values = [var.instance_name_pattern]
  }
}

### Fetch EC2 Instances by IDs.
data "aws_instance" "canary_instance" {
  count       = length(data.aws_instances.canary_instances.ids)
  instance_id = data.aws_instances.canary_instances.ids[count.index]
}

#############################################
# Alerts
#############################################


# Prepare alerts name <-> instance name relationship.
locals {
  alerts_instances = {
    for ins in data.aws_instance.canary_instance :
    ins.tags.Name => can(regex(".+:.+:.+:.+", ins.tags.Name)) ?
    (join(" / ", [
      var.policies_prefix,
      split(":", ins.tags.Name)[3],
      split(":", ins.tags.Name)[2]
    ])) :
    (ins.tags.Name)
  }
}

# Create alerts policies for Canary EC2 instance.
resource "newrelic_alert_policy" "alert_canary" {
  for_each = local.alerts_instances
  name     = each.value
}

# Iterate created policies * conditions and create a single list that contains
# all conditions per policy + instance name.
# We use policy name to get instance name from alerts_instances.
#
# result:
# policies_with_instances = [
#   {
#     condition = {
#       duration      = 600
#       metric        = "coreCount"
#       name          = "System / Core Count"
#       operator      = "above"
#       sample        = "SystemSample"
#       template_name = "generic_metric_comparator"
#       threshold     = 0
#     }
#     instance_name = "canary:v1.37.2:arm64:ubuntu18.04"
#     policy_id     = "111111"
#   },
#   {
#     condition = {
#       duration      = 600
#       metric        = "cpuIOWaitPercent"
#       name          = "System / Cpu IOWait Percent"
#       operator      = "above"
#       sample        = "SystemSample"
#       template_name = "generic_metric_comparator"
#       threshold     = 0.5
#     }
#     instance_name = "canary:v1.37.2:arm64:ubuntu22.04"
#     policy_id     = "222222"
#   },
#   ...
# ]

locals {
  policies_with_instances = flatten([
    for created_policy in newrelic_alert_policy.alert_canary :
    [
      for pol in var.conditions : {
      policy_id     = created_policy.id
      instance_name = keys(local.alerts_instances)[index(values(local.alerts_instances), created_policy.name)]
      condition     = pol
    }
    ]
  ])
}

# Uncomment this to "debug" the generated structure
#output prueba {
#  value = local.policies_with_instances
#}

resource "newrelic_nrql_alert_condition" "condition_nrql_canary" {

  count = length(local.policies_with_instances)

  account_id                   = var.account_id
  policy_id                    = local.policies_with_instances[count.index].policy_id
  name                         = local.policies_with_instances[count.index].condition.name
  violation_time_limit_seconds = 3600

  nrql {
    query = templatefile(
      local.policies_with_instances[count.index].condition.template_name,
      merge(
        {
          "display_name_previous" : "${local.policies_with_instances[count.index].instance_name}-docker-previous"
          "display_name_current" : "${local.policies_with_instances[count.index].instance_name}-docker-current",
          "function" : null,
          "wheres" : {}
        },
        local.policies_with_instances[count.index].condition
      )
    )
  }

  critical {
    operator              = local.policies_with_instances[count.index].condition.operator
    threshold             = local.policies_with_instances[count.index].condition.threshold
    threshold_duration    = local.policies_with_instances[count.index].condition.duration
    threshold_occurrences = "ALL"
  }

}

output "queries" {
  value = [newrelic_nrql_alert_condition.condition_nrql_canary.*.nrql]
}
