import {
  id = "infrastructure"
  to = github_repository.infrastructure
}

import {
  id = "infrastructure/GH_TOKEN"
  to = github_actions_secret.gh_token
}

import {
  id = "infrastructure/PRIVATE_KEY"
  to = github_actions_secret.private_key
}

import {
  id = "infrastructure:main"
  to = github_branch_protection.infrastructure
}
