output "function" {
  value = google_cloudfunctions_function.lambda
}

output "bucket" {
  value = google_storage_bucket.bucket
}
