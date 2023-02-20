# NR Account ID
variable "account_id" {
  default = ""
}

# NR User Api Key
variable "api_key" {
  default = ""
}

# US/EU/Staging
variable "region" {
  default = ""
}

variable "instance_name_pattern" {
  default = "canary:v0.0.0:*"
}

variable "policies_prefix" {
  default = "[pre-release] Canaries metric comparator"
}

# conditions should follow next structure:
#[
# {
#   name          = "System / Core Count"
#   metric        = "coreCount"
#   sample        = "SystemSample"
#   threshold     = 0
#   duration      = 600
#   operator      = "above"
#   template_name = "generic_metric_comparator"
# },
# {
#   name = "System / Cpu IOWait Percent"
#   metric = "cpuIOWaitPercent"
#   sample = "SystemSample"
#   threshold = 0.5 # max 0.112 in last week
#   duration = 600
#   operator = "above"
#   template_name = "generic_metric_comparator"
# },
# ...
# ]
#
variable "conditions" {
  default = []
}