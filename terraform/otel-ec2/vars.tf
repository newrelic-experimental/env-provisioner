variable "region" {
  default = "us-east-2"
}

variable "pvt_key" {
  validation {
    condition     = length(var.pvt_key) > 0
    error_message = "The pvt_key must be provided."
  }
}

variable "otlp_endpoint" {
  validation {
    condition     = length(var.otlp_endpoint) > 0
    error_message = "The otlp_endpoint must be provided."
  }
}

variable "nr_license_key" {
  validation {
    condition     = length(var.nr_license_key) > 0
    error_message = "The nr_license_key must be provided."
  }
}

# CrowdStrike vars
variable "crowdstrike_client_id" {
  validation {
    condition     = length(var.crowdstrike_client_id) > 0
    error_message = "The crowdstrike_client_id must be provided."
  }
}

variable "crowdstrike_client_secret" {
  validation {
    condition     = length(var.crowdstrike_client_secret) > 0
    error_message = "The crowdstrike_client_secret must be provided."
  }
}

variable "crowdstrike_customer_id" {
  validation {
    condition     = length(var.crowdstrike_customer_id) > 0
    error_message = "The crowdstrike_customer_id must be provided."
  }
}

variable "ssh_pub_key" {
  description = "Public key that will be added as authorized key"
  type        = string
}

variable "ec2_otels" {
  description = "List of EC2 Open Telemetry Collectors to deploy"
  type        = map(any)
}

variable "inventory_template" {
  default = "inventory.tmpl"
}

variable "inventory_output" {
  default = "inventory"
}

variable "ansible_playbook" {
  default = "../../ansible/install-otelcol.yml"
}
