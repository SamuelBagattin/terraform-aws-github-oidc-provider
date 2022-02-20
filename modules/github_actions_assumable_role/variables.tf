variable "oidc_provider_arn" {
  description = "ARN of the github actions AWS oidc provider"
  type        = string
}

variable "iam_role_name" {
  description = "Name of the IAM role"
  type        = string
}

variable "github_subs" {
  description = "Values of the 'sub' field that will authorize OIDC users to assume the role"
  type        = set(string)
}