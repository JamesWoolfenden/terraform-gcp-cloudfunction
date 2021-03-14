resource "google_storage_bucket" "bucket" {
  #checkov:skip=CKV_GCP_62
  name                        = "${var.project}-lambdacode-bucket"
  uniform_bucket_level_access = true
}
