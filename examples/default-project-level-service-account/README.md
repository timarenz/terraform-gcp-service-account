# Create Service Account With Default Settings

This example shows how to create a service account to provide Lacework
read-only access to a Google Cloud Project.

## Example

Code inside a `main.tf` file:

```hcl
provider "google" {}

module "lacework_svc_account" {
  source  = "lacework/audit-log/gcp"
  version = "~> 0.1.0"
}
```

Run Terraform:
```
$ terraform init
$ GOOGLE_CREDENTIALS=account.json GOOGLE_PROJECT=my-project terraform apply
```
