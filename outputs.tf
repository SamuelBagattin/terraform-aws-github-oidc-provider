output "roles_arns" {
  description = "Roles to be assumed by github actions"
  value       = module.github_actions_assumable_role
}

output "oidc_provider_arn" {
  description = "OIDC provider ARN"
  value       = var.create_oidc_provider ? aws_iam_openid_connect_provider.github_actions[0].arn : var.oidc_provider_arn
}