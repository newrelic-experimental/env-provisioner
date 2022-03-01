# OpenTelemetry Collector EKS

Terraform files to launch AWS EKS cluster (based on
[terraform-aws-eks examples](https://github.com/terraform-aws-modules/terraform-aws-eks/tree/v18.7.2/examples/eks_managed_node_group))

After applying terraform you should execute the commands below to configure kubectl:

```shell
aws sts get-caller-identity
aws eks update-kubeconfig --region AWS_REGION --name CLUSTER_NAME
```


## Providers

| Name | Source                                                     | Version |
|------|------------------------------------------------------------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | https://registry.terraform.io/providers/hashicorp/aws/4.3.0 | 4.3.0   |
| <a name="provider_null"></a> [null](#provider\_null) | https://registry.terraform.io/providers/hashicorp/null/3.1.0|  3.1.0  |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_eks"></a> [eks](#module\_eks) | registry.terraform.io/terraform-aws-modules/eks/aws | 18.7.2 |
| <a name="module_vpc"></a> [vpc](#module\_vpc) | registry.terraform.io/terraform-aws-modules/vpc/aws | 3.12.0 |
| <a name="module_vpc_cni_irsa"></a> [vpc\_cni\_irsa](#module\_vpc\_cni\_irsa) | registry.terraform.io/terraform-aws-modules/iam/aws//modules/iam-role-for-service-accounts-eks | ~> 4.12 |

## Resources

| Name | Type |
|------|------|
| [aws_iam_policy.node_additional](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_role_policy_attachment.additional](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_kms_key.ebs](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/kms_key) | resource |
| [aws_kms_key.eks](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/kms_key) | resource |
| [aws_security_group.additional](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
| [aws_security_group.remote_access](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
| [null_resource.patch](https://registry.terraform.io/providers/hashicorp/null/latest/docs/resources/resource) | resource |
| [aws_caller_identity.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/caller_identity) | data source |
| [aws_eks_cluster_auth.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/eks_cluster_auth) | data source |
| [aws_iam_policy_document.ebs](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cluster_name"></a> [cluster\_name](#input\_cluster\_name) | n/a | `any` | n/a | yes |
| <a name="input_cluster_version"></a> [cluster\_version](#input\_cluster\_version) | n/a | `string` | `"1.21"` | no |
| <a name="input_disk_size"></a> [disk\_size](#input\_disk\_size) | n/a | `number` | `50` | no |
| <a name="input_instance_types"></a> [instance\_types](#input\_instance\_types) | n/a | `list` | <pre>[<br>  "m6i.large"<br>]</pre> | no |
| <a name="input_region"></a> [region](#input\_region) | n/a | `string` | `"eu-west-1"` | no |
| <a name="input_ssh_key_name"></a> [ssh\_key\_name](#input\_ssh\_key\_name) | n/a | `any` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | n/a | `map(string)` | `{}` | no |

## Outputs

No outputs.
