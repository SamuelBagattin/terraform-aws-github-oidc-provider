/**
 * # AWS Github OIDC Provider Terraform Module
 *
 * ## Purpose
 * This module allows you to create a Github OIDC provider for your AWS account, that will help Github Actions to securely authenticate against the AWS API using an IAM role
 *
  */
resource "aws_iam_openid_connect_provider" "github_actions" {
  client_id_list = [
    "sts.amazonaws.com",
  ]
  thumbprint_list = [
    "6938fd4d98bab03faadb97b34396831e3780aea1"
  ]
  url = "https://token.actions.githubusercontent.com"
}

module "github_actions_assumable_role" {
  source   = "./modules/github_actions_assumable_role"
  for_each = local.github_subs_by_role

  github_subs       = each.value["github_subs"]
  iam_role_name     = each.key
  oidc_provider_arn = aws_iam_openid_connect_provider.github_actions.arn
  policies_arns     = each.value["policies_arns"]
}
