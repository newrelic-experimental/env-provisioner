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
      "amd64:centos7" = {
        ami             = "ami-00f8e2c955f7ffa9b"
        subnet          = "subnet-09b64de757828cdd4"
        security_groups = ["sg-044ef7bc34691164a"]
        key_name        = "caos-dev-arm"
        instance_type   = "t3a.small"
        username        = "centos"
        platform        = "linux"
        python          = "/usr/bin/python"
        tags            = {
          "otel_role" = "agent"
        }
      }
      "arm64:centos7" = {
        ami             = "ami-07f692d95b2b9c8c5"
        subnet          = "subnet-09b64de757828cdd4"
        security_groups = ["sg-044ef7bc34691164a"]
        key_name        = "caos-dev-arm"
        instance_type   = "t4g.small"
        username        = "centos"
        platform        = "linux"
        python          = "/usr/bin/python"
        tags            = {
          "otel_role" = "agent"
        }
      }
      "amd64:centos8" = {
        ami             = "ami-0ac6967966621d983"
        subnet          = "subnet-09b64de757828cdd4"
        security_groups = ["sg-044ef7bc34691164a"]
        key_name        = "caos-dev-arm"
        instance_type   = "t3a.small"
        username        = "centos"
        platform        = "linux"
        python          = "/usr/bin/python3"
        tags            = {
          "otel_role" = "agent"
        }
      }
      "arm64:centos8" = {
        ami             = "ami-035734c938e7da7af"
        subnet          = "subnet-09b64de757828cdd4"
        security_groups = ["sg-044ef7bc34691164a"]
        key_name        = "caos-dev-arm"
        instance_type   = "t4g.small"
        username        = "centos"
        platform        = "linux"
        python          = "/usr/bin/python3"
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
      "amd64:sles-12.3" = {
        ami             = "ami-05fcf0a794c3b5994"
        subnet          = "subnet-09b64de757828cdd4"
        security_groups = ["sg-044ef7bc34691164a"]
        key_name        = "caos-dev-arm"
        instance_type   = "t3a.small"
        username        = "ec2-user"
        platform        = "linux"
        python          = "/usr/bin/python"
        tags            = {
          "otel_role" = "agent"
        }
      }
      "amd64:sles-12.4" = {
        ami             = "ami-0ff9876855bed84bd"
        subnet          = "subnet-09b64de757828cdd4"
        security_groups = ["sg-044ef7bc34691164a"]
        key_name        = "caos-dev-arm"
        instance_type   = "t3a.small"
        username        = "ec2-user"
        platform        = "linux"
        python          = "/usr/bin/python"
        tags            = {
          "otel_role" = "agent"
        }
      }
      "amd64:sles-12.5" = {
        ami             = "ami-0199192e7fdbb9b62"
        subnet          = "subnet-09b64de757828cdd4"
        security_groups = ["sg-044ef7bc34691164a"]
        key_name        = "caos-dev-arm"
        instance_type   = "t3a.small"
        username        = "ec2-user"
        platform        = "linux"
        python          = "/usr/bin/python"
        tags            = {
          "otel_role" = "agent"
        }
      }
      "amd64:sles-15.1" = {
        ami             = "ami-08441b51466d3bb43"
        subnet          = "subnet-09b64de757828cdd4"
        security_groups = ["sg-044ef7bc34691164a"]
        key_name        = "caos-dev-arm"
        instance_type   = "t3a.small"
        username        = "ec2-user"
        platform        = "linux"
        python          = "/usr/bin/python3"
        tags            = {
          "otel_role" = "agent"
        }
      }
      "amd64:sles-15.2" = {
        ami             = "ami-0e44499c443e91acd"
        subnet          = "subnet-09b64de757828cdd4"
        security_groups = ["sg-044ef7bc34691164a"]
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
        ami             = "ami-0446c700e1dc61753"
        subnet          = "subnet-09b64de757828cdd4"
        security_groups = ["sg-044ef7bc34691164a"]
        key_name        = "caos-dev-arm"
        instance_type   = "t3a.small"
        username        = "ec2-user"
        platform        = "linux"
        python          = "/usr/bin/python3"
        tags            = {
          "otel_role" = "agent"
        }
      }
      "arm64:sles-15.3" = {
        ami             = "ami-0194f07e3eedf8118"
        subnet          = "subnet-09b64de757828cdd4"
        security_groups = ["sg-044ef7bc34691164a"]
        key_name        = "caos-dev-arm"
        instance_type   = "t4g.small"
        username        = "ec2-user"
        platform        = "linux"
        python          = "/usr/bin/python3"
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
      "amd64:redhat-7.9" = {
        ami             = "ami-0680f7cf1ea8cb793"
        subnet          = "subnet-09b64de757828cdd4"
        security_groups = ["sg-044ef7bc34691164a"]
        key_name        = "caos-dev-arm"
        instance_type   = "t3a.small"
        username        = "ec2-user"
        platform        = "linux"
        python          = "/usr/bin/python"
        tags            = {
          "otel_role" = "agent"
        }
      }
      "arm64:redhat-7.6" = {
        ami             = "ami-0302c1ecc74930ba5"
        subnet          = "subnet-09b64de757828cdd4"
        security_groups = ["sg-044ef7bc34691164a"]
        key_name        = "caos-dev-arm"
        instance_type   = "t4g.small"
        username        = "ec2-user"
        platform        = "linux"
        python          = "/usr/bin/python"
        tags            = {
          "otel_role" = "agent"
        }
      }
      "amd64:redhat-8.4" = {
        ami             = "ami-0ba62214afa52bec7"
        subnet          = "subnet-09b64de757828cdd4"
        security_groups = ["sg-044ef7bc34691164a"]
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
      "amd64:debian-buster" = {
        ami             = "ami-0f42acddbf04bd1b6"
        subnet          = "subnet-09b64de757828cdd4"
        security_groups = ["sg-044ef7bc34691164a"]
        key_name        = "caos-dev-arm"
        instance_type   = "t3a.small"
        username        = "admin"
        platform        = "linux"
        python          = "/usr/bin/python3"
        tags            = {
          "otel_role" = "agent"
        }
      }
      "arm64:debian-buster" = {
        ami             = "ami-07d2054a4befc97f7"
        subnet          = "subnet-09b64de757828cdd4"
        security_groups = ["sg-044ef7bc34691164a"]
        key_name        = "caos-dev-arm"
        instance_type   = "t4g.small"
        username        = "admin"
        platform        = "linux"
        python          = "/usr/bin/python3"
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
      "amd64:windows_2012" = {
        ami             = "ami-0c5d73971003d1ab0"
        subnet          = "subnet-09b64de757828cdd4"
        security_groups = ["sg-044ef7bc34691164a"]
        key_name        = "caos-dev-arm"
        instance_type   = "t3a.small"
        username        = "ansible"
        platform        = "windows"
        python          = ""
        tags            = {
          "otel_role" = "agent"
        }
      }
      "amd64:windows_2016" = {
        ami             = "ami-03d46abfa414238dd"
        subnet          = "subnet-09b64de757828cdd4"
        security_groups = ["sg-044ef7bc34691164a"]
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
        ami             = "ami-077e49a076b7e3847"
        subnet          = "subnet-09b64de757828cdd4"
        security_groups = ["sg-044ef7bc34691164a"]
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
        ami             = "ami-0780c2aa3485f2088"
        subnet          = "subnet-09b64de757828cdd4"
        security_groups = ["sg-044ef7bc34691164a"]
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
