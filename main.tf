terraform {
  required_providers {
    github = {
      source  = "integrations/github"
      version = "~> 5.0"
    }
  }
}

# Configure the GitHub Provider
provider "github" {
  owner = "CounterStrikeSharp"
  token = var.GITHUB_TOKEN
}

resource "github_repository" "infrastructure" {
  name       = "infrastructure"
  visibility = "public"

  allow_auto_merge       = true
  allow_merge_commit     = false
  allow_rebase_merge     = false
  delete_branch_on_merge = true

  description = "Terraform for CounterStrikeSharp related resources"

  has_issues = true

  squash_merge_commit_message = "BLANK"
  squash_merge_commit_title   = "PR_TITLE"
}

resource "github_branch_protection" "infrastructure" {
  repository_id        = github_repository.infrastructure.id
  pattern              = "main"
  force_push_bypassers = ["/roflmuffin"]
  push_restrictions    = []

  required_pull_request_reviews {
    dismiss_stale_reviews           = true
    dismissal_restrictions          = []
    pull_request_bypassers          = []
    require_code_owner_reviews      = true
    require_last_push_approval      = false
    required_approving_review_count = 1
    restrict_dismissals             = false
  }
}

resource "github_actions_secret" "gh_token" {
  repository  = "infrastructure"
  secret_name = "GH_TOKEN"
}