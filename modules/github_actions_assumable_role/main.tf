/*
 * # Github Actions Assumable Role Module
 * This module creates a role that can be assumed by github actions
 */

terraform {
  required_version = ">= 0.13.0"
  required_providers {
    aws = "> 3.0, ~> 4.0"
  }
}

resource "aws_iam_role" "this" {
  name               = var.iam_role_name
  assume_role_policy = data.aws_iam_policy_document.this.json
}

data "aws_iam_policy_document" "this" {
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