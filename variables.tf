variable "repositories" {
  description = "Github Repositories than can assumerole"
  type        = map(map(any))
}

variable "policies_arns" {
  type        = set(string)
  default     = []
  description = "List of AWS IAM policies to attach to the role"
}

variable "role_name" {
  type        = string
  default     = "githubActions-iamRole"
  description = "Name of the IAM role that can be assumed by Github Actions"
}

