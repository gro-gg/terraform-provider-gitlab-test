terraform {
  required_providers {
    gitlab = {
      source  = "gitlabhq/gitlab"
      version = "3.14.0"
    }
  }
  required_version = ">= 1.1"
}
