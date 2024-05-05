output "storage_blob_url" {
  description = "The URL of the Azure Storage Blob."
  value       = azurerm_storage_blob.example.url
}