resource "github_issue" "tf_issues" {
  repository = github_repository.my-terraform-created-repo-actions.name
  title = "New Issue"
  body = "There are fresh issues created from Terraform"
}