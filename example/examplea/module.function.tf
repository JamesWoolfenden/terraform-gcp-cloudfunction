resource "google_project_service" "vpcaccess" {
  project            = var.project
  service            = "vpcaccess.googleapis.com"
  disable_on_destroy = false
}

data "google_vpc_access_connector" "cloudfunction" {
  project = var.project
  name    = "cloudfunction-connector"
  region  = var.region

  depends_on = [google_project_service.vpcaccess]
}

# holden:ignore:HLD_TF_026 — examples intentionally use ../../ to reference the local module root
module "function" {
  source                        = "../../"
  lambda                        = var.lambda
  project                       = var.project
  region                        = var.region
  sourcezippath                 = var.sourcezippath
  invoker                       = "user:jameswoolfenden@gmail.com"
  kms_key_name                  = google_kms_crypto_key.cloudfunction.id
  logging_bucket                = google_storage_bucket.trigger_logs.name
  vpc_connector                 = data.google_vpc_access_connector.cloudfunction.id
  vpc_connector_egress_settings = "ALL_TRAFFIC"
  max_instances                 = 100
}
