resource "github_repository" "my-terraform-created-repo-with-actions" {
  name        = "my-terraform-created-repo-with-actions"
  description = "Terraform created repo"

  visibility = "public"
  auto_init = true
  has_issues = true

}

resource "github_branch" "development" {
    repository = github_repository.my-terraform-created-repo-with-actions.name
    branch = "development"
    source_branch = "main"
}

resource "github_branch_default" "default" {
    repository = github_repository.my-terraform-created-repo-with-actions.name
    branch = github_branch.development.source_branch
}

# resource "github_branch_protection" "branch_enterprise" {
#     repository_id = github_repository.my-terraform-created-repo-actions.node_id

#     pattern = github_branch.development.branch
#     enforce_admins = true

#     required_pull_request_reviews {
#       dismiss_stale_reviews = true
#       restrict_dismissals = true
#     }
# }