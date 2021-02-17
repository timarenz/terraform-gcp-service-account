# Create Service Account With Custom Settings

This example shows how to create a service account to provide Lacework
read-only access to a Google Cloud Organization and customizing the account
with a few inputs.

## Example

Code inside a `main.tf` file:

```hcl
provider "google" {}

module "lacework_svc_account" {
  source               = "lacework/service-account/gcp"
  version              = "~> 0.1.0"
  org_integration      = true
  organization_id      = "my-organization-id"
  project_id           = "my-project"
  service_account_name = "lacework-custom-svc-account"
}
```

Run Terraform:
```
$ terraform init
$ GOOGLE_CREDENTIALS=account.json terraform apply
```
