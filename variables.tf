
variable "lambda" {
  description = "A map object that populates the majority of cloudfunction settings"
  type        = map(any)
  validation {
    condition     = length(keys(var.lambda)) > 0
    error_message = "variable 'lambda' must be a non-empty map with at least one key"
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
  description = "Location of the Cloud Function"
  default     = "eu"
  validation {
    condition     = length(trimspace(var.location)) > 0
    error_message = "variable 'location' must be a non-empty string"
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
