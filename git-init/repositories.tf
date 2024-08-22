resource "github_repository" "my-terraform-created-repo" {
  name        = "my-terraform-created-repo-with-actions"
  description = "Terraform created repo"

  visibility = "public"
  auto_init = true
  has_issues = true

}

resource "github_branch" "development" {
    repository = github_repository.my-terraform-created-repo.name
    branch = "development"
}

resource "github_branch_default" "default" {
    repository = github_repository.my-terraform-created-repo.name
    branch = github_branch.development.branch
}

resource "github_branch_protection" "branch_enterprise" {
    repository_id = github_repository.my-terraform-created-repo.node_id

    pattern = github_branch.development.branch
    enforce_admins = true

    required_pull_request_reviews {
      dismiss_stale_reviews = true
      restrict_dismissals = true
    }
}