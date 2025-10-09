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
  description = "EC2 instances names prefix, it will appended to the ec2_otels map key"
  default = ""
}

variable "ec2_delimiter" {
  description = "Delimiter used for the EC2 instance name between the EC2 instances names prefix and the ec2_otels map key"
  default = ":"
}

variable "ec2_filters" {
  description = "EC2 instances names to deploy"
  default = []
}

variable "is_A2Q" {
  description = "Flag to determine if A2Q is true"
  type        = bool
  default     = false
}

variable "ec2_A2Q" {
  description = "List of available EC2 for A2Q canaries"
  type        = map(any)
  default = {
     "A2Q_config1_amd64:ubuntu24.04" = {
        ami             = "ami-09040d770ffe2224f"
        subnet          = "subnet-0c2046d7a0595aa2c"
        security_groups = ["sg-075f379cc5612e984"]
        key_name        = "caos-dev-arm"
        instance_type   = "t3a.small"
        username        = "ubuntu"
        python          = "/usr/bin/python3"
        platform        = "linux"
        tags            = {
          "otel_role" = "agent"
        }
      }
     "A2Q_config2_amd64:ubuntu24.04" = {
        ami             = "ami-09040d770ffe2224f"
        subnet          = "subnet-0c2046d7a0595aa2c"
        security_groups = ["sg-075f379cc5612e984"]
        key_name        = "caos-dev-arm"
        instance_type   = "t3a.small"
        username        = "ubuntu"
        python          = "/usr/bin/python3"
        platform        = "linux"
        tags            = {
          "otel_role" = "agent"
        }
      }
      "A2Q_config3_amd64:ubuntu24.04" = {
        ami             = "ami-09040d770ffe2224f"
        subnet          = "subnet-0c2046d7a0595aa2c"
        security_groups = ["sg-075f379cc5612e984"]
        key_name        = "caos-dev-arm"
        instance_type   = "t3a.small"
        username        = "ubuntu"
        python          = "/usr/bin/python3"
        platform        = "linux"
        tags            = {
          "otel_role" = "agent"
        }
      }
      "A2Q_config4_amd64:ubuntu24.04" = {
        ami             = "ami-09040d770ffe2224f"
        subnet          = "subnet-0c2046d7a0595aa2c"
        security_groups = ["sg-075f379cc5612e984"]
        key_name        = "caos-dev-arm"
        instance_type   = "t3a.small"
        username        = "ubuntu"
        python          = "/usr/bin/python3"
        platform        = "linux"
        tags            = {
          "otel_role" = "agent"
        }
      }
      "A2Q_config5_amd64:ubuntu24.04" = {
        ami             = "ami-09040d770ffe2224f"
        subnet          = "subnet-0c2046d7a0595aa2c"
        security_groups = ["sg-075f379cc5612e984"]
        key_name        = "caos-dev-arm"
        instance_type   = "t3a.small"
        username        = "ubuntu"
        python          = "/usr/bin/python3"
        platform        = "linux"
        tags            = {
          "otel_role" = "agent"
        }
      }
      "A2Q_config6_amd64:windows_2025" = {
        ami             = "ami-059a9049ae7e40d51"
        subnet          = "subnet-0c2046d7a0595aa2c"
        security_groups = ["sg-075f379cc5612e984"]
        key_name        = "caos-dev-arm"
        instance_type   = "t3a.small"
        username        = "ansible"
        platform        = "windows"
        python          = ""
        tags            = {
          "otel_role" = "agent"
        }
      }
  }
}

variable "ec2_otels" {
  description = "List of available EC2 instances"
  type        = map(any)
  default = {
      "amd64:debian-bullseye" = {
        ami             = "ami-08a0dab67e025361b"
        subnet          = "subnet-0c2046d7a0595aa2c"
        security_groups = ["sg-075f379cc5612e984"]
        key_name        = "caos-dev-arm"
        instance_type   = "t3a.small"
        username        = "admin"
        python          = "/usr/bin/python3"
        platform        = "linux"
        tags            = {
          "otel_role" = "agent"
        }
      }
      "arm64:debian-bullseye" = {
        ami             = "ami-03cabbbc935f5826f"
        subnet          = "subnet-0c2046d7a0595aa2c"
        security_groups = ["sg-075f379cc5612e984"]
        key_name        = "caos-dev-arm"
        instance_type   = "t4g.small"
        username        = "admin"
        python          = "/usr/bin/python3"
        platform        = "linux"
        tags            = {
          "otel_role" = "agent"
        }
      }
      "amd64:debian-bookworm" = {
        ami             = "ami-02e9e442f629e6834"
        subnet          = "subnet-0c2046d7a0595aa2c"
        security_groups = ["sg-075f379cc5612e984"]
        key_name        = "caos-dev-arm"
        instance_type   = "t3a.small"
        username        = "admin"
        python          = "/usr/bin/python3"
        platform        = "linux"
        tags            = {
          "otel_role" = "agent"
        }
      }
      "arm64:debian-bookworm" = {
        ami             = "ami-05f312273b2ebaf0b"
        subnet          = "subnet-0c2046d7a0595aa2c"
        security_groups = ["sg-075f379cc5612e984"]
        key_name        = "caos-dev-arm"
        instance_type   = "t4g.small"
        username        = "admin"
        python          = "/usr/bin/python3"
        platform        = "linux"
        tags            = {
          "otel_role" = "agent"
        }
      }
      "amd64:debian-trixie" = {
        ami             = "ami-0bb7d855677353076"
        subnet          = "subnet-0c2046d7a0595aa2c"
        security_groups = ["sg-075f379cc5612e984"]
        key_name        = "caos-dev-arm"
        instance_type   = "t3a.small"
        username        = "admin"
        python          = "/usr/bin/python3"
        platform        = "linux"
        tags            = {
          "otel_role" = "agent"
        }
      }
      "arm64:debian-trixie" = {
        ami             = "ami-06329a2d246a44575"
        subnet          = "subnet-0c2046d7a0595aa2c"
        security_groups = ["sg-075f379cc5612e984"]
        key_name        = "caos-dev-arm"
        instance_type   = "t4g.small"
        username        = "admin"
        python          = "/usr/bin/python3"
        platform        = "linux"
        tags            = {
          "otel_role" = "agent"
        }
      }
  }
}
