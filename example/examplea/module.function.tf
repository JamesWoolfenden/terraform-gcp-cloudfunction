# holden:ignore:HLD_TF_026 — examples intentionally use ../../ to reference the local module root
module "function" {
  source        = "../../"
  common_tags   = var.common_tags
  lambda        = var.lambda
  project       = var.project
  region        = var.region
  sourcezippath = var.sourcezippath
  invoker       = "user:jameswoolfenden@gmail.com"
}
