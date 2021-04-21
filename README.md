<a href="https://lacework.com"><img src="https://techally-content.s3-us-west-1.amazonaws.com/public-content/lacework_logo_full.png" width="600"></a>

# terraform-gcp-service-account

[![GitHub release](https://img.shields.io/github/release/lacework/terraform-gcp-service-account.svg)](https://github.com/lacework/terraform-gcp-service-account/releases/)
[![Codefresh build status]( https://g.codefresh.io/api/badges/pipeline/lacework/terraform-modules%2Ftest-compatibility?type=cf-1&key=eyJhbGciOiJIUzI1NiJ9.NWVmNTAxOGU4Y2FjOGQzYTkxYjg3ZDEx.RJ3DEzWmBXrJX7m38iExJ_ntGv4_Ip8VTa-an8gBwBo)]( https://g.codefresh.io/pipelines/edit/new/builds?id=607e25e6728f5a6fba30431b&pipeline=test-compatibility&projects=terraform-modules&projectId=607db54b728f5a5f8930405d)

Terraform module that creates service account with no roles 
on a Google Cloud Platform Project to be used in conjunction with 
other Lacework GCP modules.


## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|----------|
|project_id|A project ID different from the default defined inside the provider|string|""|false|
|service_account_name|The Service Account name|string|""|false|
|create|Set to false to prevent the module from creating any resources|bool|false|false|


## Outputs

| Name | Description |
|------|-------------|
|created|Was the Service Account created|
|name|The Service Account name|
|private_key|The private key in JSON format, base64 encoded|
|project_id|The Project ID|
