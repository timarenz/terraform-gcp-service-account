# Create Service Account For GCR Integration

This example shows how to create a service account to integrate
Google Container Registry (GCR) with Lacework.

## Example

Copy and paste the following code into a `main.tf` file:

```hcl
terraform {
  required_providers {
    lacework = {
      source = "lacework/lacework"
    }
  }
}

provider "google" {}

module "lacework_gcr_svc_account" {
  source         = "lacework/service-account/gcp"
  version        = "~> 0.1.3"
  for_gcr        = true
  for_compliance = false
}
```

Run Terraform:
```
$ terraform init
$ GOOGLE_CREDENTIALS=account.json GOOGLE_PROJECT=my-project terraform apply
```

For detailed information on integrating Lacework with Google Cloud see [GCP Compliance and Audit Trail Integration - Terraform From Any Supported Host](https://support.lacework.com/hc/en-us/articles/360057065094-GCP-Compliance-and-Audit-Trail-Integration-Terraform-From-Any-Supported-Host)
