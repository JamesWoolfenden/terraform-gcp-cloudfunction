common_tags = {
  createdby = "Terraform"
module = "terraform-gcp-cloudfunction" }


lambda = {
  available_memory_mb    = 256
  name                   = "cloud_storage_function-3"
  entry_point            = "cloud_storage_function_3"
  runtime                = "python37"
  timeout                = 60
  event_trigger_type     = "google.storage.object.finalize"
  event_trigger_resource = "projects/_/buckets/examplea-function-1"
  service_account_email  = "examplea@appspot.gserviceaccount.com"
}
