resource "google_storage_bucket_object" "archive" {
  name         = basename(var.sourcezippath)
  bucket       = google_storage_bucket.code.name
  source       = var.sourcezippath
  kms_key_name = var.kms_key_name
}
