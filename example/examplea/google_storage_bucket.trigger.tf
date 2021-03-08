resource "google_storage_bucket" "trigger" {
  #checkov:skip=CKV_GCP_29: "Ensure that Cloud Storage buckets have uniform bucket-level access enabled"
  #checkov:skip=CKV_GCP_62
  name = "examplea-function-1"
  encryption {
    default_kms_key_name = ""
  }
}
