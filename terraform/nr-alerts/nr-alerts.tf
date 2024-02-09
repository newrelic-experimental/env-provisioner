resource "newrelic_alert_policy" "alert_canary_v2" {
  count    = length(var.display_names)
  name     = format("%s:%s", var.display_names[count.index].previous, var.display_names[count.index].current)
}

# Iterate created policies * vars.conditions and create a single list that contains
# all conditions per policy + display names.
# We use policy name to get instance name from alerts_instances.
#
# result:
# policies_with_display_names = [
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
#     display_name_previous = "canary:v1.37.2:arm64:ubuntu18.04-previous"
#     display_name_current = "canary:v1.37.2:arm64:ubuntu18.04-current"
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
#     display_name_previous = "canary:v1.37.2:arm64:ubuntu18.04-previous"
#     display_name_current = "canary:v1.37.2:arm64:ubuntu18.04-current"
#     policy_id     = "222222"
#   },
#   ...
# ]

locals {
  policies_with_display_names = flatten([
    for idx, created_policy in newrelic_alert_policy.alert_canary_v2 :
    [
      for pol in var.conditions : {
      policy_id     = created_policy.id
      display_name_previous = var.display_names[idx].previous
      display_name_current = var.display_names[idx].current
      condition     = pol
    }
    ]
  ])
}

# Uncomment this to "debug" the generated structure
#output prueba {
#  value = local.policies_with_display_names
#}

resource "newrelic_nrql_alert_condition" "condition_nrql_canary" {
  count = length(local.policies_with_display_names)

  account_id                   = var.account_id
  policy_id                    = local.policies_with_display_names[count.index].policy_id
  name                         = local.policies_with_display_names[count.index].condition.name
  violation_time_limit_seconds = 3600

  nrql {
    query = templatefile(
      local.policies_with_display_names[count.index].condition.template_name,
      merge(
        {
          "display_name_previous" : "${local.policies_with_display_names[count.index].display_name_previous}"
          "display_name_current" : "${local.policies_with_display_names[count.index].display_name_current}",
          "function" : null,
          "wheres" : {}
        },
        local.policies_with_display_names[count.index].condition
      )
    )
  }

  critical {
    operator              = local.policies_with_display_names[count.index].condition.operator
    threshold             = local.policies_with_display_names[count.index].condition.threshold
    threshold_duration    = local.policies_with_display_names[count.index].condition.duration
    threshold_occurrences = "ALL"
  }
}

output "queries" {
  value = [newrelic_nrql_alert_condition.condition_nrql_canary.*.nrql]
}
