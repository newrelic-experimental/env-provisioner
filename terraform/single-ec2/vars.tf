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

variable "ami" {
  description = "AWS AMI ID"
  type        = string
}

variable "subnet" {
  description = "subnet id"
  type        = string
}

variable "security_groups" {
  description = "List of security groups to apply"
  type        = list(string)
}

variable "key_name" {
  description = "EC2 Key name"
  type        = string
}

variable "instance_type" {
  description = "Instance type"
  type        = string
}

variable "name" {
  description = "Instance name"
  type        = string
}

variable "username" {
  description = "EC2 username"
  type        = string
}

variable "ssh_pub_key" {
  description = "Public key that will be added as authorized key"
  type        = string
}

variable "tags" {
  description = "EC2 Instance tags"
  type        = map(string)
  default     = {}
}

locals {
  user_data = <<EOF
#!/bin/bash
apt update
apt install python3 -y

adduser --disabled-password  --gecos "" caos
usermod -a -G sudo caos
sudo -u caos mkdir /home/caos/.ssh
echo "ssh-rsa ${var.ssh_pub_key}" >> /home/caos/.ssh/authorized_keys
chown caos:caos /home/caos/.ssh/authorized_keys
echo "caos ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/91-cloud-init-caos
chmod 440 /etc/sudoers.d/91-cloud-init-caos

EOF

}
