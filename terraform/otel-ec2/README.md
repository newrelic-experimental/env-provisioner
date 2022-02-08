# Open Telemetry Collector EC2

Terraform files to launch one or multiple AWS EC2 instances and populate an Ansible inventory file.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_local"></a> [local](#provider\_local) | 2.1.0 |
| <a name="provider_null"></a> [null](#provider\_null) | 3.1.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_otels"></a> [otels](#module\_otels) | registry.terraform.io/terraform-aws-modules/ec2-instance/aws | 3.4.0 |

## Resources

| Name | Type |
|------|------|
| [local_file.AnsibleInventory](https://registry.terraform.io/providers/hashicorp/local/latest/docs/resources/file) | resource |
| [null_resource.wait](https://registry.terraform.io/providers/hashicorp/null/latest/docs/resources/resource) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_ec2_otels"></a> [ec2\_otels](#input\_ec2\_otels) | List of EC2 Open Telemetry Collectors to deploy | `map(any)` | n/a | yes |
| <a name="input_nr_license_key"></a> [nr\_license\_key](#input\_nr\_license\_key) | n/a | `any` | n/a | yes |
| <a name="input_otlp_endpoint"></a> [otlp\_endpoint](#input\_otlp\_endpoint) | n/a | `any` | n/a | yes |
| <a name="input_pvt_key"></a> [pvt\_key](#input\_pvt\_key) | n/a | `any` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | n/a | `string` | `"us-east-2"` | no |
| <a name="input_ssh_pub_key"></a> [ssh\_pub\_key](#input\_ssh\_pub\_key) | Public key that will be added as authorized key | `string` | n/a | yes |

## Configuration

The input variables can be populated using Terraform file vars, the repository provides the file `caos.auto.tfvars.dist` as example.

Rename the variables file:

```
mv caos.auto.tfvars.dist caos.auto.tfvars
```

Customize the variables values inside `caos.auto.tfvars`. The `ec2_otels` variable defines the instances to launch, it is a map where each key corresponds to the instance name and 
the following fields must be provided for each instance:

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| ami | AWS AMI id | `string` | n/a | yes |
| subnet | Subnet id | `string` | n/a | yes |
| security_groups | List of security groups | `list(string)` | n/a | yes |
| key_name | AWS Keyname | `string` | n/a | yes |
| intance_type | Instance type | `string` | n/a | yes |
| username | Default ami username | `string` | n/a | yes |
| tags | Instance tags | `map(string)` | n/a | yes |

### Gateway/Agent

Instance tag `otel_role` will be used to differentiate if the Otel collector will run as a `gateway` or `agent`. Example of one instance running as `gateway` and another as `agent`:

```yaml
ec2_otels = {
  "caos-ubuntu18.04-otel" = {
    ami             = "ami-0600b1bef20a0c212"
    subnet          = "subnet-123"
    security_groups = ["sg-123"]
    key_name        = "dev-arm"
    instance_type   = "t3a.small"
    username        = "ubuntu"
    tags = {
      "otel_role" = "agent"
    }
  }
  "caos-centosstream-otel" = {
    ami             = "ami-0d97ef13c06b05a19"
    subnet          = "subnet-123"
    security_groups = ["sg-123"]
    key_name        = "dev-arm"
    instance_type   = "t3a.small"
    username        = "centos"
    tags = {
      "otel_role" = "gateway"
    }
  }
}
```

## Output

The auto generated Ansible inventory file will have the following format:

```yaml
[gateway]
i-0179e732980e11111 ansible_host=10.10.0.155

[agents]
i-0ae5aef38ff911111 ansible_host=10.10.0.193
i-0ae5aef38ff911112 ansible_host=10.10.0.194
i-0ae5aef38ff911113 ansible_host=10.10.0.195
```
