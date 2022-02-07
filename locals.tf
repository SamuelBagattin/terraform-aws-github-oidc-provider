locals {
  org_defaults = {
    allow_all_repositories = true
    repositories = {
      "*" = {}
    }
  }
  repositories_defaults = {
    allowed_branches = ["master"]
  }

  repositories = {
    for org_name, org_data in {
      for org_name, org_data in var.repositories : org_name => merge(local.org_defaults, org_data)
      } : org_name => {
      allow_all_repositories = org_data["allow_all_repositories"]
      repositories : {
        for repo_name, repo_data in org_data["repositories"] : repo_name => merge(local.repositories_defaults, repo_data)
      }
    }
  }

  github_subs = flatten([for org_name, org_data in local.repositories : [
    for repo_name, repo_data in org_data["repositories"] : [
      for branch in repo_data["allowed_branches"] : "repo:${org_name}/${repo_name}:ref:refs/heads/${branch}"
    ]
  ]])
}
