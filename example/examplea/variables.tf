variable "common_tags" {
  description = "This is to help you add tags to your cloud objects"
  type        = map(any)
}


variable "lambda" {
  type = map(any)
}
variable "project" {
  type    = string
  default = "pike-361314"
}

variable "region" {
  default = "us-central1"
}


variable "sourcezippath" {
  type        = string
  description = "Full path to source zip file "
  default     = "./code/index.zip"
}
