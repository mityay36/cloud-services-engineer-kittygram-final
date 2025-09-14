output "vm_ip" {
  description = "External IP address of the VM"
  value       = yandex_compute_instance.kittygram_vm.network_interface.0.nat_ip_address
}

output "vm_internal_ip" {
  description = "Internal IP address of the VM"
  value       = yandex_compute_instance.kittygram_vm.network_interface.0.ip_address
}

output "bucket_name" {
  description = "S3 bucket name"
  value       = yandex_storage_bucket.kittygram_static.bucket
}
