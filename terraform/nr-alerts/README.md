### Usage

main.tf
```terraform
module "alerts" {
  source = "./modules/nr-alerts"

  api_key               = "*****************"
  account_id            = 123456789
  region                = "Staging" # EU|US|Staging
  instance_name_pattern = "canary:v1.37.2:*" # ec2 instances name pattern
  policies_prefix       = "[pre-release] Canaries metric comparator"

  conditions = [
    {
      name          = "System / Core Count"
      metric        = "coreCount"
      sample        = "SystemSample"
      threshold     = 0
      duration      = 600
      operator      = "above"
      template_name = "./nrql_templates/generic_metric_comparator.tftpl"
    },
    {
      name          = "System / Cpu IOWait Percent"
      metric        = "cpuIOWaitPercent"
      sample        = "SystemSample"
      threshold     = 0.5 # max 0.112 in last week
      duration      = 600
      operator      = "above"
      template_name = "./nrql_templates/generic_metric_comparator.tftpl"
    },
    ...
  ]
```

Place templates in the folder used in conditions:

```shell
cat ./nrql_templates/agent_process_metrics.tftpl

SELECT abs(
filter(average(numeric(${metric})),WHERE displayName like '${displayNameCurrent}')
-
filter(average(numeric(${metric})),WHERE displayName like '${displayNamePrevious}')
)
FROM ProcessSample
WHERE commandLine = '/usr/bin/newrelic-infra'
AND displayName IN ('${displayNameCurrent}','${displayNamePrevious}')

```