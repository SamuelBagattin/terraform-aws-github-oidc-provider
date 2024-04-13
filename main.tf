/**
 * # AWS Github OIDC Provider Terraform Module
 *
 * ## Purpose
 * This module allows you to create a Github OIDC provider for your AWS account, that will help Github Actions to securely authenticate against the AWS API using an IAM role
 *
  */
resource "aws_iam_openid_connect_provider" "github_actions" {
  count = var.create_oidc_provider ? 1 : 0
  client_id_list = [
    "sts.amazonaws.com",
  ]
  thumbprint_list = [
    data.tls_certificate.this.certificates[0].sha1_fingerprint
  ]
  url = "https://token.actions.githubusercontent.com"
}

data "tls_certificate" "this" {
  url = "https://token.actions.githubusercontent.com"
}

module "github_actions_assumable_role" {
  source   = "./modules/github_actions_assumable_role"
  for_each = var.create_iam_roles ? local.github_subs_by_role : {}

  github_subs       = each.value
  iam_role_name     = each.key
  oidc_provider_arn = var.create_oidc_provider ? aws_iam_openid_connect_provider.github_actions[0].arn : var.oidc_provider_arn
}
