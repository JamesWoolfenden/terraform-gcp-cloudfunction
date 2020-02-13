resource "google_storage_bucket" "bucket" {
  name = "${var.project}-lambdacode-bucket"
  encryption {
    default_kms_key_name = ""
  }
}
