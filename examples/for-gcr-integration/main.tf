// $ terraform init
// $ GOOGLE_CREDENTIALS=account.json GOOGLE_PROJECT=my-project terraform apply
provider "google" {}

module "lacework_gcr_svc_acc" {
  source         = "../../"
  for_gcr        = true
  for_compliance = false
}
