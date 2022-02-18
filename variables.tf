variable "permissions" {
  description = "Github Repositories than can assumerole"
  type        = map(any)
}

variable "create_oidc_provider" {
  description = "Whether or not to create the associated oidc provider. If true, variable 'oidc_provider_arn is required'"
  type        = bool
  default     = true
}

variable "oidc_provider_arn" {
  description = "Used if create_oidc_provider is true"
  type        = string
  default     = ""
}

variable "create_iam_roles" {
  description = "Whether or not to create IAM roles."
  type        = bool
  default     = true
}
