provider "aws" {
  region = "us-east-1"
}

terraform {
  required_version = ">= 0.13.0"
  required_providers {
    aws = "~> 3.0"
  }
}

data "aws_ssm_parameter" "github_actions_oidc_provider_arn" {
  name = "githubActions-oidcProviderArn-ssmParam"
}

module "aws_github_actions_oidc" {
  source               = "registry.terraform.io/SamuelBagattin/github-oidc-provider/aws"
  version              = "0.3.0"
  create_oidc_provider = false
  create_iam_roles     = true
  oidc_provider_arn    = data.aws_ssm_parameter.github_actions_oidc_provider_arn.value
  permissions = {
    "SamuelBagattin" : {
      role_name : "org_role"
      allowed_branches : ["coucou"]
      repositories = {
        (github_repository.jobs.name) = {
          role_name : "my-role"
          allowed_branches : ["*"]
        }
      }
    }
  }
}