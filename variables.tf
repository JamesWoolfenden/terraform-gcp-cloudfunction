variable "common_tags" {
  description = "This is to help you add tags to your cloud objects"
  type        = map
}

variable "lambda" {
  type = map
}

variable "project" {
  type    = string
  default = "examplea"
}

variable "region" {
  type        = string
  description = "GCP region"
  default     = "us-central1"
}

variable "sourcezippath" {
  type        = string
  description = "Full path to source zip file "
}
