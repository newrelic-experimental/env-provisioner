module "otels" {
  source  = "registry.terraform.io/terraform-aws-modules/ec2-instance/aws"
  version = "3.4.0"

  for_each               = var.ec2_otels
  name                   = each.key
  ami                    = each.value.ami
  instance_type          = each.value.instance_type
  key_name               = each.value.key_name
  subnet_id              = each.value.subnet
  vpc_security_group_ids = each.value.security_groups
  tags                   = each.value.tags

}

resource "null_resource" "wait" {
  for_each = var.ec2_otels
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

resource "local_file" "AnsibleInventory" {
  depends_on = [null_resource.wait]

  content = templatefile(var.inventory_template,
    {
      gateway-ids        = [for k, p in module.otels : p.id if p.tags_all["otel_role"] == "gateway"],
      gateway-user       = [for k, p in module.otels : var.ec2_otels[k].username if p.tags_all["otel_role"] == "gateway"],
      gateway-private-ip = [for k, p in module.otels : p.private_ip if p.tags_all["otel_role"] == "gateway"],
      agent-ids          = [for k, p in module.otels : k],
      agent-python       = [for k, p in module.otels : var.ec2_otels[k].python],
      agent-user         = [for k, p in module.otels : var.ec2_otels[k].username if p.tags_all["otel_role"] == "agent"],
      agent-private-ip   = [for k, p in module.otels : p.private_ip if p.tags_all["otel_role"] == "agent"],
    }
  )
  filename = var.inventory_output
}

resource "null_resource" "ansible" {
  depends_on = [local_file.AnsibleInventory]

  provisioner "local-exec" {
    command = "ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -i ${var.inventory_output} -e collector_otlp_endpoint=${var.otlp_endpoint} -e collector_nr_license_key=${var.nr_license_key} -e crowdstrike_client_id=$CROWDSTRIKE_CLIENT_ID -e crowdstrike_client_secret=$CROWDSTRIKE_CLIENT_SECRET -e crowdstrike_customer_id=$CROWDSTRIKE_CUSTOMER_ID --private-key ${var.pvt_key} ${var.ansible_playbook}"
  }
}
