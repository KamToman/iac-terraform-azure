variable "resource_group_name" {
  default = "example-resources"
}
variable "resource_group_location" {
  default = "West Europe"
}
variable "storage_account_name" {
  default = "examplestoracc"
}
variable "storage_account_tier" {
  default = "Standard"
}
variable "storage_account_replication_type" {
  default = "LRS"
}
variable "storage_container_name" {
  default = "content"
}
variable "storage_container_access_type" {
  default = "private"
}
variable "storage_blob_name" {
  default = "my-awesome-content.zip"
}
variable "storage_blob_type" {
  default = "Block"
}
variable "storage_blob_source" {
  default = "some-local-file.zip"
}