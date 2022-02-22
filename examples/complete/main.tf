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
    "my-org" : { # Specify the GitHub organisation name
      role_name : "githubActions-default-role"
      allowed_branches : ["main"]
      repositories = {
        "my-repository" = {     # GitHub repository name
          role_name : "my-role" # IAM role name
        }
        "another-repository" = {}
        "third-repository" = {
          allowed_branches : ["my-branch", "my-other-branch"]
        }
        "*" = {
          role_name : "global-role"
          allowed_branches : ["feature/*"]
        }
      }
    }
  }
}