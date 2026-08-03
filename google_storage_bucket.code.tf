# holden:ignore:HLD_GCP_019 — labels applied via provider default_labels
resource "google_storage_bucket" "code" {
  #checkov:skip=CKV_GCP_62
  name                        = "${var.project}-lambdacode-bucket"
  location                    = var.location
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

  lifecycle_rule {
    action {
      type = "Delete"
    }
    condition {
      age = 90
    }
  }

  soft_delete_policy {
    retention_duration_seconds = 604800
  }
}
