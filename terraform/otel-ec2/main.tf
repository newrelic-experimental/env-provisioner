locals {
    // filter EC2 instances to launch
    filtered_ec2_agents = length(var.ec2_filters) == 0 ? var.ec2_otels : {
    for k, v in var.ec2_otels : k => v if anytrue([for f in var.ec2_filters :
        strcontains(k, f)]) }

    // Append ec2_prefix to ec2 instances name
    assembled_ec2 = var.ec2_prefix == "" ? local.filtered_ec2_agents : { for k, v in local.filtered_ec2_agents : format("%s:%s", var.ec2_prefix, k) => v }
}

module "otels" {
  source  = "registry.terraform.io/terraform-aws-modules/ec2-instance/aws"
  version = "3.4.0"

  for_each               = local.assembled_ec2
  name                   = each.key
  ami                    = each.value.ami
  instance_type          = each.value.instance_type
  key_name               = each.value.key_name
  subnet_id              = each.value.subnet
  vpc_security_group_ids = each.value.security_groups
  tags                   = each.value.tags

}

resource "null_resource" "wait_linux" {

  for_each = {for key, val in local.assembled_ec2:
              key => val if val.platform == "linux"}

  provisioner "remote-exec" {
    connection {
      type        = "ssh"
      user        = each.value.username
      host        = module.otels[each.key].private_ip
      private_key = file(var.pvt_key)
    }

    inline = [
      "echo 'connected'"
    ]
  }
}

resource "null_resource" "wait_windows" {

  for_each = {for key, val in local.assembled_ec2:
              key => val if val.platform == "windows"}

  provisioner "remote-exec" {
    connection {
      type        = "winrm"
      user        = each.value.username
      host        = module.otels[each.key].private_ip
      password    = "${var.windows_password}"
      insecure    = true
      https       = true
    }

    inline = [
      "echo 'connected'"
    ]
  }
}

resource "local_file" "AnsibleInventory" {
  depends_on = [null_resource.wait_linux, null_resource.wait_windows]

  content = templatefile(var.inventory_template,
    {
      gateway-ids        = [for k, p in module.otels : p.id if p.tags_all["otel_role"] == "gateway"],
      gateway-user       = [for k, p in module.otels : local.assembled_ec2[k].username if p.tags_all["otel_role"] == "gateway"],
      gateway-private-ip = [for k, p in module.otels : p.private_ip if p.tags_all["otel_role"] == "gateway"],
      agent-ids          = [for k, p in module.otels : k],
      agent-python       = [for k, p in module.otels : local.assembled_ec2[k].python],
      agent-user         = [for k, p in module.otels : local.assembled_ec2[k].username if p.tags_all["otel_role"] == "agent"],
      agent-private-ip   = [for k, p in module.otels : p.private_ip if p.tags_all["otel_role"] == "agent"],
      instance-id        = [for k, p in module.otels : p.id],
      platform           = [for k, p in module.otels : local.assembled_ec2[k].platform],
      windows_password   = var.windows_password
    }
  )
  filename = var.inventory_output
}

resource "null_resource" "ansible" {
  depends_on = [local_file.AnsibleInventory]

  provisioner "local-exec" {
    command = "ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -i ${var.inventory_output} -e collector_otlp_endpoint=${var.otlp_endpoint} -e collector_nr_license_key=${var.nr_license_key} --private-key ${var.pvt_key} ${var.ansible_playbook}"
  }
}
