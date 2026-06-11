data "google_project" "this" {
  project_id = var.project
}

resource "google_kms_crypto_key_iam_member" "cloudfunction_encrypter_decrypter" {
  role          = "roles/cloudkms.cryptoKeyEncrypterDecrypter"
  member        = "serviceAccount:service-${data.google_project.this.number}@gcf-admin-robot.iam.gserviceaccount.com"
  crypto_key_id = google_kms_crypto_key.cloudfunction.id
}

resource "google_kms_crypto_key_iam_member" "gcs_encrypter_decrypter" {
  role          = "roles/cloudkms.cryptoKeyEncrypterDecrypter"
  member        = "serviceAccount:service-${data.google_project.this.number}@gs-project-accounts.iam.gserviceaccount.com"
  crypto_key_id = google_kms_crypto_key.cloudfunction.id
}
