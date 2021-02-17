locals {
  project_id = data.google_project.selected.project_id
  service_account_email = var.create ? (
    length(google_service_account.lacework) > 0 ? google_service_account.lacework[0].email : ""
  ) : ""
}

data "google_project" "selected" {
  project_id = var.project_id
}

resource "google_project_service" "required_apis" {
  for_each = var.required_apis
  project  = local.project_id
  service  = each.value

  disable_on_destroy = false
}

resource "google_service_account" "lacework" {
  count        = var.create ? 1 : 0
  project      = local.project_id
  account_id   = var.service_account_name
  display_name = var.service_account_name
  depends_on   = [google_project_service.required_apis]
}

resource "google_service_account_key" "lacework" {
  count              = var.create ? 1 : 0
  service_account_id = google_service_account.lacework[count.index].name
  depends_on = [
    google_organization_iam_member.for_lacework_service_account,
    google_project_iam_member.for_lacework_service_account
  ]
}
