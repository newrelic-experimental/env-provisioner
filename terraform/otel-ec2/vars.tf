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

variable "ec2_filters" {
  description = "EC2 instances names to deploy"
  default = []
}

variable "ec2_otels" {
  description = "List of available EC2 instances"
  type        = map(any)
  default = {
     "amd64:ubuntu22.04" = {
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
      "arm64:ubuntu22.04" = {
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
      "amd64:centos-stream" = {
        ami             = "ami-013f9ee48907190f5"
        subnet          = "subnet-09b64de757828cdd4"
        security_groups = ["sg-044ef7bc34691164a"]
        key_name        = "caos-dev-arm"
        instance_type   = "t3a.small"
        username        = "centos"
        python          = "/usr/bin/python3"
        platform        = "linux"
        tags            = {
          "otel_role" = "agent"
        }
      }
      "arm64:centos-stream" = {
        ami             = "ami-0dce27ea07b1afb8f"
        subnet          = "subnet-09b64de757828cdd4"
        security_groups = ["sg-044ef7bc34691164a"]
        key_name        = "caos-dev-arm"
        instance_type   = "t4g.small"
        username        = "cloud-user"
        python          = "/usr/bin/python3"
        platform        = "linux"
        tags            = {
          "otel_role" = "agent"
        }
      }
      "amd64:sles-15.4" = {
        ami             = "ami-0ca19ecee2be612fc"
        subnet          = "subnet-09b64de757828cdd4"
        security_groups = ["sg-044ef7bc34691164a"]
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
        ami             = "ami-0885abe5302e6fee0"
        subnet          = "subnet-09b64de757828cdd4"
        security_groups = ["sg-044ef7bc34691164a"]
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
        ami             = "ami-0e03a27c1453107db"
        subnet          = "subnet-09b64de757828cdd4"
        security_groups = ["sg-044ef7bc34691164a"]
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
        ami             = "ami-046216af2ce255621"
        subnet          = "subnet-09b64de757828cdd4"
        security_groups = ["sg-044ef7bc34691164a"]
        key_name        = "caos-dev-arm"
        instance_type   = "t4g.small"
        username        = "ec2-user"
        python          = "/usr/bin/python3"
        platform        = "linux"
        tags            = {
          "otel_role" = "agent"
        }
      }
      "amd64:redhat-9.0" = {
        ami             = "ami-078cbc4c2d057c244"
        subnet          = "subnet-09b64de757828cdd4"
        security_groups = ["sg-044ef7bc34691164a"]
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
        subnet          = "subnet-09b64de757828cdd4"
        security_groups = ["sg-044ef7bc34691164a"]
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
        subnet          = "subnet-09b64de757828cdd4"
        security_groups = ["sg-044ef7bc34691164a"]
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
        subnet          = "subnet-09b64de757828cdd4"
        security_groups = ["sg-044ef7bc34691164a"]
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
        subnet          = "subnet-09b64de757828cdd4"
        security_groups = ["sg-044ef7bc34691164a"]
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
        subnet          = "subnet-09b64de757828cdd4"
        security_groups = ["sg-044ef7bc34691164a"]
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
        subnet          = "subnet-09b64de757828cdd4"
        security_groups = ["sg-044ef7bc34691164a"]
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
        subnet          = "subnet-09b64de757828cdd4"
        security_groups = ["sg-044ef7bc34691164a"]
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
        subnet          = "subnet-09b64de757828cdd4"
        security_groups = ["sg-044ef7bc34691164a"]
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
        subnet          = "subnet-09b64de757828cdd4"
        security_groups = ["sg-044ef7bc34691164a"]
        key_name        = "caos-dev-arm"
        instance_type   = "t4g.small"
        username        = "ec2-user"
        python          = "/usr/bin/python3"
        platform        = "linux"
        tags            = {
          "otel_role" = "agent"
        }
      }
  }
}
