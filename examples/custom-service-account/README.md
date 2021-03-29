# Create Service Account With Custom Settings

This example shows how to create a service account with no roles
on a Google Cloud Platform Project to be used in conjunction with
other Lacework GCP modules, customizing the account with a few inputs.

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
  source               = "lacework/service-account/gcp"
  version              = "~> 1.0"
  project_id           = "my-project"
  service_account_name = "lacework-custom-svc-account"
}
```

Run Terraform:
```
$ terraform init
$ GOOGLE_CREDENTIALS=account.json terraform apply
```

For detailed information on integrating Lacework with Google Cloud see [GCP Compliance and Audit Trail Integration - Terraform From Any Supported Host](https://support.lacework.com/hc/en-us/articles/360057065094-GCP-Compliance-and-Audit-Trail-Integration-Terraform-From-Any-Supported-Host)
