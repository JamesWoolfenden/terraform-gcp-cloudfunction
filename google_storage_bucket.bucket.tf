resource "google_storage_bucket" "bucket" {
  #checkov:skip=CKV_GCP_62
  name                        = "${var.project}-lambdacode-bucket"
  location                    = var.location
  uniform_bucket_level_access = true
  versioning {
    enabled = true
  }
}
