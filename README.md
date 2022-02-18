<!-- BEGIN_TF_DOCS -->
# AWS Github OIDC Provider Terraform Module

## Purpose
This module allows you to create a Github OIDC provider for your AWS account, that will help Github Actions to securely authenticate against the AWS API using an IAM role

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.13.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 3.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_github_actions_assumable_role"></a> [github\_actions\_assumable\_role](#module\_github\_actions\_assumable\_role) | ./modules/github_actions_assumable_role | n/a |

## Resources

| Name | Type |
|------|------|
| [aws_iam_openid_connect_provider.github_actions](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_openid_connect_provider) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_create_iam_roles"></a> [create\_iam\_roles](#input\_create\_iam\_roles) | Whether or not to create IAM roles. | `bool` | `true` | no |
| <a name="input_create_oidc_provider"></a> [create\_oidc\_provider](#input\_create\_oidc\_provider) | Whether or not to create the associated oidc provider. If true, variable 'oidc\_provider\_arn is required' | `bool` | `true` | no |
| <a name="input_oidc_provider_arn"></a> [oidc\_provider\_arn](#input\_oidc\_provider\_arn) | Used if create\_oidc\_provider is true | `string` | `""` | no |
| <a name="input_permissions"></a> [permissions](#input\_permissions) | Github Repositories than can assumerole | `map(any)` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_oidc_provider_arn"></a> [oidc\_provider\_arn](#output\_oidc\_provider\_arn) | OIDC provider ARN |
| <a name="output_roles_arns"></a> [roles\_arns](#output\_roles\_arns) | Roles to be assumed by github actions |
<!-- END_TF_DOCS -->