// This example shows how another Terraform module could pass the
// 'create' input to prevent creating a service account
//
// Example of how to run this code:
//
// $ terraform init
// $ GOOGLE_CREDENTIALS=account.json GOOGLE_PROJECT=my-project terraform apply
provider "google" {}

module "lacework_svc_account" {
  source = "../../"
  create = false
}
