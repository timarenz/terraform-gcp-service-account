output "created" {
  value       = var.create
  description = "Was the Service Account created"
}

output "name" {
  value = length(var.service_account_name) > 0 ? (
  var.service_account_name) : google_service_account.lacework[0].account_id
  description = "The Service Account name"
}

output "project_id" {
  value       = local.project_id
  description = "The Project ID"
}

output "private_key" {
  value       = var.create ? google_service_account_key.lacework[0].private_key : ""
  description = "The private key in JSON format, base64 encoded"
  sensitive   = true
}
