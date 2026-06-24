variable "lambda" {
  description = "Configuration map for the Cloud Function (keys/values as required by the module)."
  type        = map(any)

  validation {
    condition     = length(var.lambda) > 0
    error_message = "The lambda variable must be a non-empty map with configuration for the function."
  }
}

variable "project" {
  description = "GCP project ID where resources will be created"
  type        = string
  default     = "pike-477416"

  validation {
    condition     = length(trimspace(var.project)) > 0
    error_message = "The project variable must be a non-empty string."
  }
}

variable "region" {
  type        = string
  default     = "us-central1"
  description = "GCP region where resources will be created (for example: \"us-central1\")."

  validation {
    condition     = length(trimspace(var.region)) > 0
    error_message = "The region variable must be a non-empty string."
  }
}


variable "sourcezippath" {
  type        = string
  description = "Full path to source zip file "
  default     = "./code/index.zip"

  validation {
    condition     = length(trimspace(var.sourcezippath)) > 0
    error_message = "The sourcezippath variable must be a non-empty string (for example: \"./code/index.zip\")."
  }
}
