variable "lambda" {
  description = "Cloud Function settings. ingress_settings defaults to ALLOW_INTERNAL_AND_GCLB and retry (event trigger failure policy) to false"
  type = object({
    available_memory_mb    = number
    entry_point            = string
    event_trigger_resource = string
    event_trigger_type     = string
    ingress_settings       = optional(string, "ALLOW_INTERNAL_AND_GCLB")
    name                   = string
    retry                  = optional(bool, false)
    runtime                = string
    service_account_email  = string
    timeout                = number
  })

  validation {
    condition     = contains(["ALLOW_INTERNAL_ONLY", "ALLOW_INTERNAL_AND_GCLB", "ALLOW_ALL"], var.lambda.ingress_settings)
    error_message = "lambda.ingress_settings must be ALLOW_INTERNAL_ONLY, ALLOW_INTERNAL_AND_GCLB or ALLOW_ALL"
  }

  validation {
    condition     = var.lambda.timeout >= 1 && var.lambda.timeout <= 540
    error_message = "lambda.timeout must be between 1 and 540 seconds"
  }

  validation {
    condition     = !can(regex("^(python3[78]|nodejs(6|8|10|12|14|16)|go1(11|13|16|18)|ruby2[67]|php7[34]|dotnet3)$", var.lambda.runtime))
    error_message = "lambda.runtime is a decommissioned Cloud Functions runtime; use a supported one (e.g. python312)"
  }

  validation {
    condition     = length(trimspace(var.lambda.service_account_email)) > 0
    error_message = "lambda.service_account_email must be set so the function does not run as the default compute service account"
  }
}

variable "project" {
  description = "GCP project"
  type        = string
  validation {
    condition     = length(trimspace(var.project)) > 0
    error_message = "variable 'project' must be a non-empty string"
  }
}

variable "region" {
  type        = string
  description = "GCP region"
  validation {
    condition     = length(trimspace(var.region)) > 0
    error_message = "variable 'region' must be a non-empty string"
  }
}

variable "sourcezippath" {
  type        = string
  description = "Full path to source zip file "
  validation {
    condition     = length(trimspace(var.sourcezippath)) > 0
    error_message = "variable 'sourcezippath' must be a non-empty string"
  }
}

variable "location" {
  type        = string
  description = "Location of the source code bucket. Defaults to var.region, because the same kms_key_name encrypts the bucket and the function and must live in both locations"
  default     = null
  validation {
    condition     = var.location == null || length(trimspace(coalesce(var.location, " "))) > 0
    error_message = "variable 'location' must be null or a non-empty string"
  }
}

variable "kms_key_name" {
  type        = string
  description = "Full resource ID of the KMS CryptoKey to use for CMEK on the source bucket and Cloud Function"
  sensitive   = true
  validation {
    condition     = length(trimspace(var.kms_key_name)) > 0
    error_message = "variable 'kms_key_name' must be a non-empty string"
  }
}

variable "logging_bucket" {
  type        = string
  description = "Name of the GCS bucket to write access logs for the source bucket"
  validation {
    condition     = length(trimspace(var.logging_bucket)) > 0
    error_message = "variable 'logging_bucket' must be a non-empty string"
  }
}

variable "invoker" {
  type        = string
  description = "IAM member to grant roles/cloudfunctions.invoker (e.g. `user:<email>` or `serviceAccount:<service-account-email>`)"
  validation {
    condition     = !contains(["allUsers", "allAuthenticatedUsers"], var.invoker)
    error_message = "invoker must not be allUsers or allAuthenticatedUsers — use a specific user or service account"
  }
}

variable "vpc_connector" {
  type        = string
  description = "Self-link or id of the Serverless VPC Access connector for egress"
  validation {
    condition     = length(trimspace(var.vpc_connector)) > 0
    error_message = "variable 'vpc_connector' must be a non-empty string"
  }
}

variable "vpc_connector_egress_settings" {
  type        = string
  description = "Egress settings for the VPC connector: ALL_TRAFFIC or PRIVATE_RANGES_ONLY"
  default     = "ALL_TRAFFIC"
  validation {
    condition     = contains(["ALL_TRAFFIC", "PRIVATE_RANGES_ONLY"], var.vpc_connector_egress_settings)
    error_message = "vpc_connector_egress_settings must be ALL_TRAFFIC or PRIVATE_RANGES_ONLY"
  }
}

variable "max_instances" {
  type        = number
  description = "Maximum number of concurrent Cloud Function instances; must be >= 1 to prevent unbounded scaling"
  default     = 100
  validation {
    condition     = var.max_instances >= 1
    error_message = "max_instances must be >= 1"
  }
}

variable "docker_repository" {
  type        = string
  description = "Artifact Registry DOCKER repository (projects/PROJECT/locations/REGION/repositories/REPO) encrypted with the same kms_key_name, used to store the function's build image. GCP requires one for CMEK functions"
  default     = null
  validation {
    condition     = var.docker_repository == null || can(regex("^projects/[^/]+/locations/[^/]+/repositories/[^/]+$", coalesce(var.docker_repository, "x")))
    error_message = "docker_repository must be null or match projects/<project>/locations/<region>/repositories/<repo>"
  }
}

variable "bucket_name" {
  type        = string
  description = "Name of the source code bucket. Defaults to PROJECT-lambdacode-bucket; set it to deploy more than one instance of this module per project"
  default     = null
  validation {
    condition     = var.bucket_name == null || can(regex("^[a-z0-9][a-z0-9._-]{1,61}[a-z0-9]$", coalesce(var.bucket_name, "x")))
    error_message = "bucket_name must be null or a valid GCS bucket name"
  }
}
