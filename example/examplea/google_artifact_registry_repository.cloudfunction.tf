# CMEK functions must build into an Artifact Registry repository encrypted with the same key
# holden:ignore:HLD_GCP_168: Cloud Functions re-pushes the function's image tags on every deploy, so immutable tags would break redeploys
resource "google_artifact_registry_repository" "cloudfunction" {
  project       = var.project
  location      = var.region
  repository_id = "cloudfunction"
  description   = "Build images for the examplea Cloud Function"
  format        = "DOCKER"
  kms_key_name  = google_kms_crypto_key.cloudfunction.id

  cleanup_policy_dry_run = false

  cleanup_policies {
    id     = "keep-recent"
    action = "KEEP"
    most_recent_versions {
      keep_count = 5
    }
  }

  cleanup_policies {
    id     = "delete-old"
    action = "DELETE"
    condition {
      older_than = "2592000s"
    }
  }

  depends_on = [google_kms_crypto_key_iam_member.artifactregistry_encrypter_decrypter]
}
