resource "google_kms_key_ring" "cloudfunction" {
  name     = "cloudfunction"
  project  = var.project
  location = var.region
}
