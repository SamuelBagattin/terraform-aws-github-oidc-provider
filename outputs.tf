output "role_arn" {
  description = "Role to be assumed by github actions"
  value = aws_iam_role.github_actions.arn
}