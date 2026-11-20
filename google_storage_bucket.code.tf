# holden:ignore:HLD_GCP_019 — labels applied via provider default_labels
resource "google_storage_bucket" "code" {
  name                        = coalesce(var.bucket_name, "${var.project}-lambdacode-bucket")
  location                    = coalesce(var.location, var.region)
  uniform_bucket_level_access = true
  public_access_prevention    = "enforced"

  encryption {
    default_kms_key_name = var.kms_key_name
  }

  logging {
    log_bucket        = var.logging_bucket
    log_object_prefix = "gcs-logs"
  }

  versioning {
    enabled = true
  }

  # Expire only superseded archives; the live archive the function deploys from is kept.
  lifecycle_rule {
    action {
      type = "Delete"
    }
    condition {
      days_since_noncurrent_time = 30
    }
  }

  soft_delete_policy {
    retention_duration_seconds = 604800
  }
}
