// This template assumes the default configuration coming from the following
// environment variables 'GOOGLE_CREDENTIALS' and 'GOOGLE_PROJECT'
//
// Example of how to run this code:
//
// $ terraform init
// $ GOOGLE_CREDENTIALS=account.json GOOGLE_PROJECT=my-project terraform apply
//
// Additionally, you could add the credentials and project configuration inside
// the google provider, to do so, look at the following instructions:
// => https://registry.terraform.io/providers/hashicorp/google/latest/docs
provider "google" {}

module "lacework_svc_account" {
  source               = "../../"
  project_id           = "a-different-project-id"
  service_account_name = "lacework-custom-svc-account"
}
