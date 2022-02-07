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

resource "aws_iam_role" "github_actions" {
  name               = var.role_name
  assume_role_policy = data.aws_iam_policy_document.github_actions_assumerole.json
}

data "aws_iam_policy_document" "github_actions_assumerole" {
  statement {
    effect = "Allow"
    principals {
      identifiers = ["token.actions.githubusercontent.com"]
      type        = "Federated"
    }
    actions = ["sts:AssumeRole"]
    condition {
      test     = "StringLike"
      values   = local.github_subs
      variable = "token.actions.githubusercontent.com:sub"
    }
  }
}

resource "aws_iam_role_policy_attachment" "github_actions" {
  for_each   = { for v in var.policies_arns : v => v }
  policy_arn = each.value
  role       = aws_iam_role.github_actions.arn
}