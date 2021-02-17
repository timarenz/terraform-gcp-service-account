<a href="https://lacework.com"><img src="https://techally-content.s3-us-west-1.amazonaws.com/public-content/lacework_logo_full.png" width="600"></a>

# terraform-gcp-service-account

[![GitHub release](https://img.shields.io/github/release/lacework/terraform-gcp-service-account.svg)](https://github.com/lacework/terraform-gcp-service-account/releases/)
[![CircleCI status](https://circleci.com/gh/lacework/terraform-gcp-service-account.svg?style=shield)](https://circleci.com/gh/lacework/terraform-gcp-service-account)

Terraform module that creates a service account to provide Lacework read-only access to Google Cloud Platform Organizations and Projects.

## Simple Usage

### For Compliance Integration

```hcl
provider "google" {}

module "lacework_svc_account" {
  source  = "lacework/service-account/gcp"
  version = "~> 0.1.3"
}
```

### For GCR Integration

```hcl
provider "google" {}

module "lacework_gcr_svc_account" {
  source         = "lacework/service-account/gcp"
  version        = "~> 0.1.3"
  for_gcr        = true
  for_compliance = false
}
```
