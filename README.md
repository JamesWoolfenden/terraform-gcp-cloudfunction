# terraform-gcp-cloudfunction

[![Build Status](https://github.com/JamesWoolfenden/terraform-gcp-cloudfunction/workflows/Verify/badge.svg?branch=master)](https://github.com/JamesWoolfenden/terraform-gcp-cloudfunction/actions)
[![Latest Release](https://img.shields.io/github/release/JamesWoolfenden/terraform-gcp-cloudfunction.svg)](https://github.com/JamesWoolfenden/terraform-gcp-cloudfunction/releases/latest)
[![GitHub tag (latest SemVer)](https://img.shields.io/github/tag/JamesWoolfenden/terraform-gcp-cloudfunction.svg?label=latest)](https://github.com/JamesWoolfenden/terraform-gcp-cloudfunction/releases/latest)
![Terraform Version](https://img.shields.io/badge/tf-%3E%3D0.14.0-blue.svg)
[![pre-commit](https://img.shields.io/badge/pre--commit-enabled-brightgreen?logo=pre-commit&logoColor=white)](https://github.com/pre-commit/pre-commit)
[![checkov](https://img.shields.io/badge/checkov-verified-brightgreen)](https://www.checkov.io/)

The working cloudfunction module and example.

## Usage

Add **module.cloudfunction.tf** to your code:-

```terraform
module cloudfunction {
    source        ="jameswoolfenden/cloudfunction/gcp"
    version       = "0.0.4"
    common_tags   = var.common_tags
    lambda        = var.lambda
    project       = var.project
    region        = var.region
    sourcezippath = var.sourcezippath
}
```

See **examplea.auto.tfvars** for the data to drive the module.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

No requirements.

## Providers

| Name | Version |
| ---- | ------- |
| <a name="provider_google"></a> [google](#provider\_google) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
| ---- | ---- |
| [google_cloudfunctions_function.lambda](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/cloudfunctions_function) | resource |
| [google_cloudfunctions_function_iam_member.invoker](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/cloudfunctions_function_iam_member) | resource |
| [google_storage_bucket.code](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/storage_bucket) | resource |
| [google_storage_bucket_object.archive](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/storage_bucket_object) | resource |

## Inputs

| Name | Description | Type | Default | Required |
| ---- | ----------- | ---- | ------- | :------: |
| <a name="input_invoker"></a> [invoker](#input\_invoker) | IAM member to grant roles/cloudfunctions.invoker (e.g. user:alice@example.com or serviceAccount:sa@project.iam.gserviceaccount.com) | `string` | n/a | yes |
| <a name="input_kms_key_name"></a> [kms\_key\_name](#input\_kms\_key\_name) | Full resource ID of the KMS CryptoKey to use for CMEK on the source bucket and Cloud Function | `string` | n/a | yes |
| <a name="input_lambda"></a> [lambda](#input\_lambda) | A map object that populates the majority of cloudfunction settings | `map(any)` | n/a | yes |
| <a name="input_location"></a> [location](#input\_location) | Location of the Cloud Function | `string` | `"eu"` | no |
| <a name="input_logging_bucket"></a> [logging\_bucket](#input\_logging\_bucket) | Name of the GCS bucket to write access logs for the source bucket | `string` | n/a | yes |
| <a name="input_max_instances"></a> [max\_instances](#input\_max\_instances) | Maximum number of concurrent Cloud Function instances; must be >= 1 to prevent unbounded scaling | `number` | `100` | no |
| <a name="input_project"></a> [project](#input\_project) | GCP project | `string` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | GCP region | `string` | n/a | yes |
| <a name="input_sourcezippath"></a> [sourcezippath](#input\_sourcezippath) | Full path to source zip file | `string` | n/a | yes |
| <a name="input_vpc_connector"></a> [vpc\_connector](#input\_vpc\_connector) | Self-link or id of the Serverless VPC Access connector for egress | `string` | n/a | yes |
| <a name="input_vpc_connector_egress_settings"></a> [vpc\_connector\_egress\_settings](#input\_vpc\_connector\_egress\_settings) | Egress settings for the VPC connector: ALL\_TRAFFIC or PRIVATE\_RANGES\_ONLY | `string` | `"ALL_TRAFFIC"` | no |

## Outputs

| Name | Description |
| ---- | ----------- |
| <a name="output_bucket"></a> [bucket](#output\_bucket) | The google\_storage\_bucket resource used to store the Cloud Function source archive |
| <a name="output_function"></a> [function](#output\_function) | The google\_cloudfunctions\_function resource, exposing name, https\_trigger\_url, and other attributes |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Role and Permissions

<!-- BEGINNING OF PRE-COMMIT-PIKE DOCS HOOK -->
The Terraform resource required is:

```golang

resource "google_project_iam_custom_role" "terraform_pike" {
  project     = "pike-477416"
  role_id     = "terraform_pike"
  title       = "terraform_pike"
  description = "A user with least privileges"
  permissions = [
    "cloudfunctions.functions.create",
    "cloudfunctions.functions.delete",
    "cloudfunctions.functions.get",
    "cloudfunctions.functions.getIamPolicy",
    "cloudfunctions.functions.setIamPolicy",
    "cloudfunctions.functions.update",
    "cloudfunctions.operations.get",
    "storage.buckets.create",
    "storage.buckets.delete",
    "storage.buckets.get",
    "storage.buckets.update",
    "storage.objects.create",
    "storage.objects.delete",
    "storage.objects.get",
    "storage.objects.list"
  ]
}


```
<!-- END OF PRE-COMMIT-PIKE DOCS HOOK -->

## Related Projects

Check out these related projects.

- [terraform-aws-codecommit](https://github.com/jameswoolfenden/terraform-aws-codebuild) - Storing ones code

## Help

**Got a question?**

File a GitHub [issue](https://github.com/jameswoolfenden/terraform-gcp-cloudfunction/issues).

## Contributing

### Bug Reports & Feature Requests

Please use the [issue tracker](https://github.com/jameswoolfenden/terraform-gcp-cloudfunction/issues) to report any bugs or file feature requests.

## Copyrights

Copyright © 2019-2026 James Woolfenden

## License

[![License](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](https://opensource.org/licenses/Apache-2.0)

See [LICENSE](LICENSE) for full details.

Licensed to the Apache Software Foundation (ASF) under one
or more contributor license agreements. See the NOTICE file
distributed with this work for additional information
regarding copyright ownership. The ASF licenses this file
to you under the Apache License, Version 2.0 (the
"License"); you may not use this file except in compliance
with the License. You may obtain a copy of the License at

<https://www.apache.org/licenses/LICENSE-2.0>

Unless required by applicable law or agreed to in writing,
software distributed under the License is distributed on an
"AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
KIND, either express or implied. See the License for the
specific language governing permissions and limitations
under the License.

### Contributors

[![James Woolfenden][jameswoolfenden_avatar]][jameswoolfenden_homepage]<br/>[James Woolfenden][jameswoolfenden_homepage]

[jameswoolfenden_homepage]: https://github.com/jameswoolfenden
[jameswoolfenden_avatar]: https://github.com/jameswoolfenden.png?size=150
