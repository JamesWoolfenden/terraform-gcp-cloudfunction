resource "google_storage_bucket" "trigger" {
  #checkov:skip=CKV_GCP_62
  name                        = "examplea-function-1"
  uniform_bucket_level_access = true
  location                    = "eu"
  versioning {
    enabled = true
  }
}
