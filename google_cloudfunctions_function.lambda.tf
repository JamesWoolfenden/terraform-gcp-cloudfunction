resource "google_cloudfunctions_function" "lambda" {

  available_memory_mb   = var.lambda["available_memory_mb"]
  entry_point           = var.lambda["entry_point"]
  environment_variables = {}

  source_archive_bucket = google_storage_bucket.bucket.name
  source_archive_object = google_storage_bucket_object.archive.name

  labels = {
    "deployment-tool" = "console-cloud"
  }

  max_instances         = 0
  name                  = var.lambda["name"]
  project               = var.project
  region                = var.region
  runtime               = var.lambda["runtime"]
  service_account_email = var.lambda["service_account_email"]
  timeout               = var.lambda["timeout"]

  event_trigger {
    event_type = var.lambda["event_trigger_type"]
    resource   = var.lambda["event_trigger_resource"]
    failure_policy {
      retry = false
    }
  }

  timeouts {}
}
