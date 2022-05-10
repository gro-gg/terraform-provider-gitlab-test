variable "gitlab_token" {
}

provider "gitlab" {
  token = var.gitlab_token
}

data "gitlab_group" "root" {
  group_id = 7018091
}

resource "gitlab_group" "parent_1" {
  name                    = "gitlab-parent-1"
  path                    = "gitlab-parent-1"
  parent_id               = data.gitlab_group.root.id

  lifecycle {
    ignore_changes = [subgroup_creation_level, share_with_group_lock]
  }
}

resource "gitlab_group" "parent_2" {
  name                    = "gitlab-parent-2"
  path                    = "gitlab-parent-2"
  parent_id               = data.gitlab_group.root.id

  lifecycle {
    ignore_changes = [share_with_group_lock, subgroup_creation_level]
  }
}

resource "gitlab_group" "child" {
  name      = "child-12344321"
  path      = "child-12344321"
  parent_id = gitlab_group.parent_1.id // <----------- change this

  lifecycle {
    ignore_changes = [share_with_group_lock, subgroup_creation_level]
  }
}

