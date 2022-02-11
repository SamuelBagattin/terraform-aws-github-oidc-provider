output "roles_arns" {
  description = "Roles to be assumed by github actions"
  value       = module.github_actions_assumable_role
}
