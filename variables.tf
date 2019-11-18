variable "common_tags" {
  description = "This is to help you add tags to your cloud objects"
  type        = map
}

variable "lambda" {
  description = "A map object that populates the majority of cloudfunction settings"
  type        = map
}

variable "project" {
  description = "GCP project"
  type        = string
}

variable "region" {
  type        = string
  description = "GCP region"
}

variable "sourcezippath" {
  type        = string
  description = "Full path to source zip file "
}
