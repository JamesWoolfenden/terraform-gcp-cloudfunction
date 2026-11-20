resource "google_storage_bucket_object" "archive" {
  # The content hash in the name changes source_archive_object when the zip changes,
  # which is what makes Cloud Functions redeploy the new code.
  name         = "${filemd5(var.sourcezippath)}-${basename(var.sourcezippath)}"
  bucket       = google_storage_bucket.code.name
  source       = var.sourcezippath
  kms_key_name = var.kms_key_name
}
