resource "google_storage_bucket" "trigger" {
  name = "examplea-function-1"
  encryption {
    default_kms_key_name = ""
  }
}
