locals {
  default_project_roles = [
    "roles/viewer",
    "roles/iam.securityReviewer"
  ]
  default_organization_roles = [
    "roles/viewer",
    "roles/iam.securityReviewer",
    "roles/resourcemanager.organizationViewer"
  ]
  project_roles = var.for_compliance && var.org_integration ? [] : (
    var.create ? local.default_project_roles : []
  )
  organization_roles = var.for_compliance && var.create && var.org_integration ? (
    local.default_organization_roles
  ) : []
}

// Roles for a PROJECT level integration
resource "google_project_iam_member" "for_lacework_service_account" {
  for_each = toset(local.project_roles)
  project  = local.project_id
  role     = each.value
  member   = "serviceAccount:${local.service_account_email}"
}

// Roles for an ORGANIZATION level integration
resource "google_organization_iam_member" "for_lacework_service_account" {
  for_each = toset(local.organization_roles)
  org_id   = var.organization_id
  role     = each.value
  member   = "serviceAccount:${local.service_account_email}"
}

