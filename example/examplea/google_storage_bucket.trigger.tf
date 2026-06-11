# holden:ignore:HLD_GCP_019 — labels applied via provider default_labels
resource "google_storage_bucket" "trigger" {
  #checkov:skip=CKV_GCP_62
  name                        = "examplea-function-1"
  uniform_bucket_level_access = true
  location                    = "eu"
  public_access_prevention    = "enforced"

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
}

# holden:ignore:HLD_GCP_003
resource "google_storage_bucket" "trigger_logs" {
  #checkov:skip=CKV_GCP_62:logging buckets do not log themselves
  name                        = "examplea-function-1-logs"
  uniform_bucket_level_access = true
  location                    = "eu"
  public_access_prevention    = "enforced"

  versioning {
    enabled = true
  }

  encryption {
    default_kms_key_name = google_kms_crypto_key.cloudfunction.id
  }
}
