variable "region" {
  default = "us-east-2"
}

variable "pvt_key" {
  validation {
    condition     = length(var.pvt_key) > 0
    error_message = "The pvt_key must be provided."
  }
}

variable "windows_password" {
  description = "windows password"
  default     = ""
  type        = string
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


variable "ssh_pub_key" {
  description = "Public key that will be added as authorized key"
  type        = string
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

variable "ec2_prefix" {
  description = "EC2 instances names prefix, it will replace the TAG_OR_UNIQUE_NAME of the default ec2_otels map"
  default = "env-provisioner"
}

variable "ec2_filters" {
  description = "EC2 instances names to deploy"
  default = []
}

variable "ec2_otels" {
  description = "List of available EC2 instances"
  type        = map(any)
  default = {
      "TAG_OR_UNIQUE_NAME-amd64:ubuntu22.04" = {
        ami             = "ami-0aeb7c931a5a61206"
        subnet          = "subnet-09b64de757828cdd4"
        security_groups = ["sg-044ef7bc34691164a"]
        key_name        = "caos-dev-arm"
        instance_type   = "t3a.small"
        username        = "ubuntu"
        python          = "/usr/bin/python3"
        platform        = "linux"
        tags            = {
          "otel_role" = "agent"
        }
      }
      "TAG_OR_UNIQUE_NAME-arm64:ubuntu22.04" = {
        ami             = "ami-0717cbd2f49a61ed0"
        subnet          = "subnet-09b64de757828cdd4"
        security_groups = ["sg-044ef7bc34691164a"]
        key_name        = "caos-dev-arm"
        instance_type   = "t4g.small"
        username        = "ubuntu"
        python          = "/usr/bin/python3"
        platform        = "linux"
        tags            = {
          "otel_role" = "agent"
        }
      }
  }
}
