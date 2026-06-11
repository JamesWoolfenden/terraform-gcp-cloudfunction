output "function" {
  description = "The Cloud Function name or identifier returned by the function module."
  value       = module.function.function
}

output "bucket" {
  description = "The Cloud Storage bucket name created or used by the function module."
  value       = module.function.bucket
}
