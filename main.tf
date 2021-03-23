locals {
  project_id = data.google_project.selected.project_id
  service_account_email = var.create ? (
    length(google_service_account.lacework) > 0 ? google_service_account.lacework[0].email : ""
  ) : ""
  service_account_name = length(var.service_account_name) > 0 ? (
    var.service_account_name ) : "lwsvc-${random_id.uniq.hex}"
}

resource "random_id" "uniq" {
  byte_length = 4
}

data "google_project" "selected" {
  project_id = var.project_id
}

resource "google_service_account" "lacework" {
  count        = var.create ? 1 : 0
  project      = local.project_id
  account_id   = local.service_account_name
  display_name = local.service_account_name
}

resource "google_service_account_key" "lacework" {
  count              = var.create ? 1 : 0
  service_account_id = google_service_account.lacework[count.index].name
}
