module "ec2-instance" {
  source  = "registry.terraform.io/terraform-aws-modules/ec2-instance/aws"
  version = "3.4.0"

  name                   = var.name
  ami                    = var.ami
  instance_type          = var.instance_type
  key_name               = var.key_name
  subnet_id              = var.subnet
  vpc_security_group_ids = var.security_groups
  user_data              = local.user_data
  tags                   = var.tags

}

resource "null_resource" "wait" {
  provisioner "remote-exec" {
    connection {
      type        = "ssh"
      user        = "caos"
      host        = module.ec2-instance.private_ip
      private_key = file(var.pvt_key)
    }

    inline = [
      "cloud-init status --wait"
    ]
  }
}

module "ansible" {
  depends_on = [null_resource.wait]

  source  = "registry.terraform.io/cloudposse/ansible/null"
  version = "0.6.0"

  arguments = [
    "--user=${var.username}",
    "--private-key ${var.pvt_key}",
    "-e otlp_endpoint=${var.otlp_endpoint}",
    "-e nr_license_key=${var.nr_license_key}",
    "-e otel_config_tpl=otel-config-single-ec2.yaml.j2",
    "--ssh-common-args='-o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null'",
    "-i ${module.ec2-instance.private_ip},",
  ]

  playbook = "playbook-single-ec2.yml"
  dry_run  = false
}
