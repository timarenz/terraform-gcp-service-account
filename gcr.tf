locals {
  default_gcr_roles = [
    "roles/storage.objectViewer"
  ]
  required_gcr_apis = {
    containerregistry = "containerregistry.googleapis.com"
  }
  gcr_roles = var.create && var.for_gcr ? local.default_gcr_roles : []
  gcr_apis  = var.create && var.for_gcr ? local.required_gcr_apis : {}
}

resource "google_project_service" "required_apis_for_gcr_integration" {
  for_each = local.gcr_apis
  project  = local.project_id
  service  = each.value

  disable_on_destroy = false
}

// Role(s) for a GCR integration
resource "google_project_iam_member" "for_gcr_integration" {
  for_each = toset(local.gcr_roles)
  project  = local.project_id
  role     = each.value
  member   = "serviceAccount:${local.service_account_email}"
}
