# terraform-gcp-cloudfunction

[![Build Status](https://github.com/JamesWoolfenden/terraform-gcp-cloudfunction/workflows/Verify%20and%20Bump/badge.svg?branch=master)](https://github.com/JamesWoolfenden/terraform-gcp-cloudfunction/actions)
[![Latest Release](https://img.shields.io/github/release/JamesWoolfenden/terraform-gcp-cloudfunction.svg)](https://github.com/JamesWoolfenden/terraform-gcp-cloudfunction/releases/latest)
[![GitHub tag (latest SemVer)](https://img.shields.io/github/tag/JamesWoolfenden/terraform-gcp-cloudfunction.svg?label=latest)](https://github.com/JamesWoolfenden/terraform-gcp-cloudfunction/releases/latest)
![Terraform Version](https://img.shields.io/badge/tf-%3E%3D0.14.0-blue.svg)
[![Infrastructure Tests](https://www.bridgecrew.cloud/badges/github/JamesWoolfenden/terraform-gcp-cloudfunction/cis_aws)](https://www.bridgecrew.cloud/link/badge?vcs=github&fullRepo=JamesWoolfenden%2Fterraform-gcp-cloudfunction&benchmark=CIS+AWS+V1.2)
[![pre-commit](https://img.shields.io/badge/pre--commit-enabled-brightgreen?logo=pre-commit&logoColor=white)](https://github.com/pre-commit/pre-commit)
[![checkov](https://img.shields.io/badge/checkov-verified-brightgreen)](https://www.checkov.io/)
[![Infrastructure Tests](https://www.bridgecrew.cloud/badges/github/jameswoolfenden/terraform-gcp-cloudfunction/general)](https://www.bridgecrew.cloud/link/badge?vcs=github&fullRepo=JamesWoolfenden%2Fterraform-gcp-cloudfunction&benchmark=INFRASTRUCTURE+SECURITY)
[![Infrastructure Tests](https://www.bridgecrew.cloud/badges/github/jameswoolfenden/terraform-gcp-cloudfunction/cis_gcp)](https://www.bridgecrew.cloud/link/badge?vcs=github&fullRepo=JamesWoolfenden%2Fterraform-gcp-cloudfunction&benchmark=CIS+GCP+V1.1)

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


<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

Check out these related projects.

- [terraform-aws-codecommit](https://github.com/jameswoolfenden/terraform-aws-codebuild) - Storing ones code

## Help

**Got a question?**

File a GitHub [issue](https://github.com/jameswoolfenden/terraform-gcp-cloudfunction/issues).

## Contributing

### Bug Reports & Feature Requests

Please use the [issue tracker](https://github.com/jameswoolfenden/terraform-gcp-cloudfunction/issues) to report any bugs or file feature requests.

## Copyrights

Copyright © 2019-2021 James Woolfenden

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
[github]: https://github.com/jameswoolfenden
[linkedin]: https://www.linkedin.com/in/jameswoolfenden/
[twitter]: https://twitter.com/JimWoolfenden
[share_twitter]: https://twitter.com/intent/tweet/?text=terraform-gcp-cloudfunction&url=https://github.com/jameswoolfenden/terraform-gcp-cloudfunction
[share_linkedin]: https://www.linkedin.com/shareArticle?mini=true&title=terraform-gcp-cloudfunction&url=https://github.com/jameswoolfenden/terraform-gcp-cloudfunction
[share_reddit]: https://reddit.com/submit/?url=https://github.com/jameswoolfenden/terraform-gcp-cloudfunction
[share_facebook]: https://facebook.com/sharer/sharer.php?u=https://github.com/jameswoolfenden/terraform-gcp-cloudfunction
[share_email]: mailto:?subject=terraform-gcp-cloudfunction&body=https://github.com/jameswoolfenden/terraform-gcp-cloudfunction
