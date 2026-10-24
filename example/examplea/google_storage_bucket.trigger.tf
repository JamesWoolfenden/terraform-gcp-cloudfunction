# holden:ignore:HLD_GCP_019 — labels applied via provider default_labels
resource "google_storage_bucket" "trigger" {
  name                        = "examplea-function-1"
  uniform_bucket_level_access = true
  location                    = "eu"
  public_access_prevention    = "enforced"

  lifecycle_rule {
    action {
      type = "Delete"
    }
    condition {
      age = 30
    }
  }

  soft_delete_policy {
    retention_duration_seconds = 604800
  }

  encryption {
    default_kms_key_name = google_kms_crypto_key.cloudfunction.id
  }

  logging {
    log_bucket        = google_storage_bucket.trigger_logs.name
    log_object_prefix = "trigger-logs"
  }

  versioning {
    enabled = true
  }

  depends_on = [google_kms_crypto_key_iam_member.cloudfunction_encrypter_decrypter,
  google_kms_crypto_key_iam_member.gcs_encrypter_decrypter]
}

# holden:ignore:HLD_GCP_003
resource "google_storage_bucket" "trigger_logs" {
  name                        = "examplea-function-1-logs"
  uniform_bucket_level_access = true
  location                    = "eu"
  public_access_prevention    = "enforced"

  lifecycle_rule {
    action {
      type = "Delete"
    }

    condition {
      age = 30
    }
  }

  soft_delete_policy {
    retention_duration_seconds = 604800
  }

  versioning {
    enabled = true
  }

  encryption {
    default_kms_key_name = google_kms_crypto_key.cloudfunction.id
  }


  depends_on = [
    google_kms_crypto_key_iam_member.cloudfunction_encrypter_decrypter,
  google_kms_crypto_key_iam_member.gcs_encrypter_decrypter]
}
