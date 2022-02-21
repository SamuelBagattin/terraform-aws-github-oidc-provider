provider "aws" {
  region = "us-east-1"
}

terraform {
  required_version = ">= 0.13.0"
  required_providers {
    aws = "~> 3.0"
  }
}


module "aws_github_actions_oidc" {
  source  = "registry.terraform.io/SamuelBagattin/github-oidc-provider/aws"
  version = "0.3.0"
  permissions = {
    "my-org" : {
      repositories = {
        "my-repository" = {
          role_name : "githubActions-role"
          allowed_branches : ["*"]
        }
      }
    }
  }
}