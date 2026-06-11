resource "google_kms_crypto_key" "cloudfunction" {
  name            = "cloudfunction-key"
  key_ring        = google_kms_key_ring.cloudfunction.id
  rotation_period = "7776000s"
  lifecycle {
    prevent_destroy = true
  }
}
