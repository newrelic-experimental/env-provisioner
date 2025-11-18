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
     "amd64:ubuntu24.04" = {
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
      "arm64:ubuntu24.04" = {
        ami             = "ami-0acb327475c6fd498"
        subnet          = "subnet-0c2046d7a0595aa2c"
        security_groups = ["sg-075f379cc5612e984"]
        key_name        = "caos-dev-arm"
        instance_type   = "t4g.small"
        username        = "ubuntu"
        python          = "/usr/bin/python3"
        platform        = "linux"
        tags            = {
          "otel_role" = "agent"
        }
      }
     "amd64:ubuntu22.04" = {
        ami             = "ami-0aeb7c931a5a61206"
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
      "arm64:ubuntu22.04" = {
        ami             = "ami-0717cbd2f49a61ed0"
        subnet          = "subnet-0c2046d7a0595aa2c"
        security_groups = ["sg-075f379cc5612e984"]
        key_name        = "caos-dev-arm"
        instance_type   = "t4g.small"
        username        = "ubuntu"
        python          = "/usr/bin/python3"
        platform        = "linux"
        tags            = {
          "otel_role" = "agent"
        }
      }
      "amd64:centos-stream" = {
        ami             = "ami-003dd9987cb4c368d"
        subnet          = "subnet-0c2046d7a0595aa2c"
        security_groups = ["sg-075f379cc5612e984"]
        key_name        = "caos-dev-arm"
        instance_type   = "t3a.small"
        username        = "ec2-user"
        python          = "/usr/bin/python3"
        platform        = "linux"
        tags            = {
          "otel_role" = "agent"
        }
      }
      "arm64:centos-stream" = {
        ami             = "ami-033cf81c815abfe13"
        subnet          = "subnet-0c2046d7a0595aa2c"
        security_groups = ["sg-075f379cc5612e984"]
        key_name        = "caos-dev-arm"
        instance_type   = "t4g.small"
        username        = "ec2-user"
        python          = "/usr/bin/python3"
        platform        = "linux"
        tags            = {
          "otel_role" = "agent"
        }
      }
      "amd64:sles-12.5" = {
        ami             = "ami-0314425a95f19ff16"
        subnet          = "subnet-0c2046d7a0595aa2c"
        security_groups = ["sg-075f379cc5612e984"]
        key_name        = "caos-dev-arm"
        instance_type   = "t3a.small"
        username        = "ec2-user"
        platform        = "linux"
        python          = "/usr/bin/python"
        tags            = {
          "otel_role" = "agent"
        }
      }
      "amd64:sles-15.2" = {
        ami             = "ami-0e44499c443e91acd"
        subnet          = "subnet-0c2046d7a0595aa2c"
        security_groups = ["sg-075f379cc5612e984"]
        key_name        = "caos-dev-arm"
        instance_type   = "t3a.small"
        username        = "ec2-user"
        platform        = "linux"
        python          = "/usr/bin/python3"
        tags            = {
          "otel_role" = "agent"
        }
      }
      "amd64:sles-15.3" = {
        ami             = "ami-0b7b425050b12e3f9"
        subnet          = "subnet-0c2046d7a0595aa2c"
        security_groups = ["sg-075f379cc5612e984"]
        key_name        = "caos-dev-arm"
        instance_type   = "t3a.small"
        username        = "ec2-user"
        platform        = "linux"
        python          = "/usr/bin/python3"
        tags            = {
          "otel_role" = "agent"
        }
      }
      "amd64:sles-15.4" = {
        ami             = "ami-0043039fa4a2d71c8"
        subnet          = "subnet-0c2046d7a0595aa2c"
        security_groups = ["sg-075f379cc5612e984"]
        key_name        = "caos-dev-arm"
        instance_type   = "t3a.small"
        username        = "ec2-user"
        python          = "/usr/bin/python3"
        platform        = "linux"
        tags            = {
          "otel_role" = "agent"
        }
      }
      "arm64:sles-15.4" = {
        ami             = "ami-095cd0b4ebd0cd85b"
        subnet          = "subnet-0c2046d7a0595aa2c"
        security_groups = ["sg-075f379cc5612e984"]
        key_name        = "caos-dev-arm"
        instance_type   = "t4g.small"
        username        = "ec2-user"
        python          = "/usr/bin/python3"
        platform        = "linux"
        tags            = {
          "otel_role" = "agent"
        }
      }
      "amd64:sles-15.5" = {
        ami             = "ami-04504b468e262a288"
        subnet          = "subnet-0c2046d7a0595aa2c"
        security_groups = ["sg-075f379cc5612e984"]
        key_name        = "caos-dev-arm"
        instance_type   = "t3a.small"
        username        = "ec2-user"
        python          = "/usr/bin/python3"
        platform        = "linux"
        tags            = {
          "otel_role" = "agent"
        }
      }
      "amd64:sles-15.6" = {
        ami             = "ami-0a752653199c4fce6"
        subnet          = "subnet-0c2046d7a0595aa2c"
        security_groups = ["sg-075f379cc5612e984"]
        key_name        = "caos-dev-arm"
        instance_type   = "t3a.small"
        username        = "ec2-user"
        python          = "/usr/bin/python3"
        platform        = "linux"
        tags            = {
          "otel_role" = "agent"
        }
      }
      "amd64:sles-15.7" = {
        ami             = "ami-01de4781572fa1285"
        subnet          = "subnet-0c2046d7a0595aa2c"
        security_groups = ["sg-075f379cc5612e984"]
        key_name        = "caos-dev-arm"
        instance_type   = "t3a.small"
        username        = "ec2-user"
        python          = "/usr/bin/python3"
        platform        = "linux"
        tags            = {
          "otel_role" = "agent"
        }
      }
      "arm64:sles-15.5" = {
        ami             = "ami-012bb28fd7e331024"
        subnet          = "subnet-0c2046d7a0595aa2c"
        security_groups = ["sg-075f379cc5612e984"]
        key_name        = "caos-dev-arm"
        instance_type   = "t4g.small"
        username        = "ec2-user"
        python          = "/usr/bin/python3"
        platform        = "linux"
        tags            = {
          "otel_role" = "agent"
        }
      }
      "arm64:sles-15.6" = {
        ami             = "ami-0bce4f43ac4014da1"
        subnet          = "subnet-0c2046d7a0595aa2c"
        security_groups = ["sg-075f379cc5612e984"]
        key_name        = "caos-dev-arm"
        instance_type   = "t4g.small"
        username        = "ec2-user"
        python          = "/usr/bin/python3"
        platform        = "linux"
        tags            = {
          "otel_role" = "agent"
        }
      }
      "arm64:sles-15.7" = {
        ami             = "ami-0f26b0e0d5d3b6777"
        subnet          = "subnet-0c2046d7a0595aa2c"
        security_groups = ["sg-075f379cc5612e984"]
        key_name        = "caos-dev-arm"
        instance_type   = "t4g.small"
        username        = "ec2-user"
        python          = "/usr/bin/python3"
        platform        = "linux"
        tags            = {
          "otel_role" = "agent"
        }
      }
      "amd64:redhat-8.4" = {
        ami             = "ami-0ba62214afa52bec7"
        subnet          = "subnet-0c2046d7a0595aa2c"
        security_groups = ["sg-075f379cc5612e984"]
        key_name        = "caos-dev-arm"
        instance_type   = "t3a.small"
        username        = "ec2-user"
        platform        = "linux"
        python          = "/usr/bin/python3"
        tags            = {
          "otel_role" = "agent"
        }
      }
      "amd64:redhat-9.0" = {
        ami             = "ami-078cbc4c2d057c244"
        subnet          = "subnet-0c2046d7a0595aa2c"
        security_groups = ["sg-075f379cc5612e984"]
        key_name        = "caos-dev-arm"
        instance_type   = "t3a.small"
        username        = "ec2-user"
        python          = "/usr/bin/python3"
        platform        = "linux"
        tags            = {
          "otel_role" = "agent"
        }
      }
      "arm64:redhat-9.0" = {
        ami             = "ami-01089181b0aa3be51"
        subnet          = "subnet-0c2046d7a0595aa2c"
        security_groups = ["sg-075f379cc5612e984"]
        key_name        = "caos-dev-arm"
        instance_type   = "t4g.small"
        username        = "ec2-user"
        python          = "/usr/bin/python"
        platform        = "linux"
        tags            = {
          "otel_role" = "agent"
        }
      }

      "amd64:redhat-10.0" = {
        ami             = "ami-068d5d5ed1eeea07c"
        subnet          = "subnet-0c2046d7a0595aa2c"
        security_groups = ["sg-075f379cc5612e984"]
        key_name        = "caos-dev-arm"
        instance_type   = "t3a.small"
        username        = "ec2-user"
        python          = "/usr/bin/python3"
        platform        = "linux"
        tags            = {
          "otel_role" = "agent"
        }
      }
      "arm64:redhat-10.0" = {
        ami             = "ami-07b21932ee4cac8c0"
        subnet          = "subnet-0c2046d7a0595aa2c"
        security_groups = ["sg-075f379cc5612e984"]
        key_name        = "caos-dev-arm"
        instance_type   = "t4g.small"
        username        = "ec2-user"
        python          = "/usr/bin/python"
        platform        = "linux"
        tags            = {
          "otel_role" = "agent"
        }
      }
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
      "amd64:al-2" = {
        ami             = "ami-077e31c4939f6a2f3"
        subnet          = "subnet-0c2046d7a0595aa2c"
        security_groups = ["sg-075f379cc5612e984"]
        key_name        = "caos-dev-arm"
        instance_type   = "t3a.small"
        username        = "ec2-user"
        python          = "/usr/bin/python"
        platform        = "linux"
        tags            = {
          "otel_role" = "agent"
        }
      }
      "arm64:al-2" = {
        ami             = "ami-07a3e3eda401f8caa"
        subnet          = "subnet-0c2046d7a0595aa2c"
        security_groups = ["sg-075f379cc5612e984"]
        key_name        = "caos-dev-arm"
        instance_type   = "t4g.small"
        username        = "ec2-user"
        python          = "/usr/bin/python"
        platform        = "linux"
        tags            = {
          "otel_role" = "agent"
        }
      }
      "amd64:al-2023" = {
        ami             = "ami-0103f211a154d64a6"
        subnet          = "subnet-0c2046d7a0595aa2c"
        security_groups = ["sg-075f379cc5612e984"]
        key_name        = "caos-dev-arm"
        instance_type   = "t3a.small"
        username        = "ec2-user"
        python          = "/usr/bin/python3"
        platform        = "linux"
        tags            = {
          "otel_role" = "agent"
        }
      }
      "amd64:al-2023-fips" = {
        ami             = "ami-0ec24135690b4ad82"
        subnet          = "subnet-0c2046d7a0595aa2c"
        security_groups = ["sg-075f379cc5612e984"]
        key_name        = "caos-dev-arm"
        instance_type   = "t3a.small"
        username        = "ec2-user"
        python          = "/usr/bin/python3"
        platform        = "linux"
        tags            = {
          "otel_role" = "agent"
        }
      }
      "arm64:al-2023" = {
        ami             = "ami-07d16074c2fdf3a19"
        subnet          = "subnet-0c2046d7a0595aa2c"
        security_groups = ["sg-075f379cc5612e984"]
        key_name        = "caos-dev-arm"
        instance_type   = "t4g.small"
        username        = "ec2-user"
        python          = "/usr/bin/python3"
        platform        = "linux"
        tags            = {
          "otel_role" = "agent"
        }
      }
      "arm64:al-2023-fips" = {
        ami             = "ami-0edddf62c25da5c5e"
        subnet          = "subnet-0c2046d7a0595aa2c"
        security_groups = ["sg-075f379cc5612e984"]
        key_name        = "caos-dev-arm"
        instance_type   = "t4g.small"
        username        = "ec2-user"
        python          = "/usr/bin/python3"
        platform        = "linux"
        tags            = {
          "otel_role" = "agent"
        }
      }
      "amd64:windows_2016" = {
        ami             = "ami-0c465d57affbebd78"
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
      "amd64:windows_2019" = {
        ami             = "ami-08b20395242518494"
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
      "amd64:windows_2022" = {
        ami             = "ami-0feb3a0caad202bce"
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
      "amd64:windows_2025" = {
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