# holden:ignore:HLD_GCP_019 — labels applied via provider default_labels
resource "google_cloudfunctions_function" "lambda" {

  available_memory_mb   = var.lambda["available_memory_mb"]
  entry_point           = var.lambda["entry_point"]
  environment_variables = {}

  source_archive_bucket = google_storage_bucket.code.name
  source_archive_object = google_storage_bucket_object.archive.name

  https_trigger_security_level  = "SECURE_ALWAYS"
  ingress_settings              = try(var.lambda["ingress_settings"], "ALLOW_INTERNAL_AND_GCLB")
  kms_key_name                  = var.kms_key_name
  max_instances                 = var.max_instances
  name                          = var.lambda["name"]
  project                       = var.project
  region                        = var.region
  runtime                       = var.lambda["runtime"]
  service_account_email         = var.lambda["service_account_email"]
  timeout                       = var.lambda["timeout"]
  vpc_connector                 = var.vpc_connector
  vpc_connector_egress_settings = var.vpc_connector_egress_settings

  event_trigger {
    event_type = var.lambda["event_trigger_type"]
    resource   = var.lambda["event_trigger_resource"]
    failure_policy {
      retry = false
    }
  }

  timeouts {}
}
