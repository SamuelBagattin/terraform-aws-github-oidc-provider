/*
 * # Github Actions Assumable Role Module
 * This module creates a role and many policies attachments
 */

terraform {
  required_version = ">= 0.13.0"
  required_providers {
    aws = "~> 3.0"
  }
}

resource "aws_iam_role" "github_actions" {
  name               = var.iam_role_name
  assume_role_policy = data.aws_iam_policy_document.github_actions_assumerole.json
}

data "aws_iam_policy_document" "github_actions_assumerole" {
  statement {
    effect = "Allow"
    principals {
      identifiers = [var.oidc_provider_arn]
      type        = "Federated"
    }
    actions = ["sts:AssumeRoleWithWebIdentity"]
    condition {
      test     = "StringLike"
      values   = var.github_subs
      variable = "token.actions.githubusercontent.com:sub"
    }
  }
}

resource "aws_iam_role_policy_attachment" "this" {
  for_each = toset(compact(distinct(var.policies_arns)))

  policy_arn = each.value
  role       = aws_iam_role.github_actions.name
}