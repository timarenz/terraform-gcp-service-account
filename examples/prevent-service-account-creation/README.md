# Prevent Creating Service Account

This example shows how another Terraform module could pass the
`create` input to prevent creating a service account. (useful
when a user wants to use an existing service account)

## Example

Code inside a `main.tf` file:
```hcl
terraform {
  required_providers {
    lacework = {
      source = "lacework/lacework"
    }
  }
}

provider "google" {}

provider "lacework" {}

module "lacework_svc_account" {
  source  = "lacework/service-account/gcp"
  version = "~> 0.1.0"
  create  = false
}
```

Run Terraform:
```
$ terraform init
$ GOOGLE_CREDENTIALS=account.json GOOGLE_PROJECT=my-project terraform apply
```

For detailed information on integrating Lacework with Google Cloud see [GCP Compliance and Audit Trail Integration - Terraform From Any Supported Host](https://support.lacework.com/hc/en-us/articles/360057065094-GCP-Compliance-and-Audit-Trail-Integration-Terraform-From-Any-Supported-Host)
