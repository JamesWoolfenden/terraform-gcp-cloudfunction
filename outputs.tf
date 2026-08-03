output "function" {
  description = "The google_cloudfunctions_function resource, exposing name, https_trigger_url, and other attributes"
  value       = google_cloudfunctions_function.lambda
  sensitive   = true
}

output "bucket" {
  description = "The google_storage_bucket resource used to store the Cloud Function source archive"
  value       = google_storage_bucket.code
  sensitive   = true
}
