variable "region" {
  default = "eu-west-1"
}

variable "cluster_name" {
  validation {
    condition     = length(var.cluster_name) > 0
    error_message = "The cluster_name must be provided."
  }
}

variable "ssh_key_name" {
  validation {
    condition     = length(var.ssh_key_name) > 0
    error_message = "The ssh key must be provided."
  }
}

variable "cluster_version" {
  default = "1.21"
}

variable "cluster_private_endpoint" {
  default = true
}

variable "cluster_public_endpoint" {
  default = true
}

variable "tags" {
  type    = map(string)
  default = {}
}

variable "ami_type" {
  default = "AL2_x86_64"
}

variable "instance_types" {
  default = ["m6i.large"]
}

variable "disk_size" {
  default = 50
}