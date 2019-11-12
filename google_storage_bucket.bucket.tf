resource "google_storage_bucket" "bucket" {
  name = "${var.project}-lambdacode-bucket"
}
