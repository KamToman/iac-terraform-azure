variable "resource_group_name" {
  default = "any_name"
}
variable "resource_group_location" {
  default = "West Europe"
}
variable "azurerm_storage_account_name" {
  default = "storageaccountname"
}
variable "azurerm_storage_account_account_tier" {
  default = "Standard"
}
variable "azurerm_storage_account_replication_type" {
  default = "GRS"
}
variable "environment_tag" {
  default = "staging"
}
variable "azurerm_service_plan_name" {
  default = "example-service-plan"
}
variable "azurerm_service_plan_os_type" {
  default = "Linux"
}
variable "azurerm_service_plan_sku_name" {
  default = "S1"
}
variable "azurerm_linux_function_app_name" {
  default = "example-function-app"
}
variable "python_version" {
  default = "3.9"
}
variable "azurerm_function_app_function_name" {
  default = "example-function-app-function"
}
variable "azurerm_function_app_function_language" {
  default = "Python"
}
variable "test_data" {
  default = <<EOF
  {
    "name" = "Azure"
  }
EOF
}
variable "config_json" {
  default = <<EOF
  {
    "bindings" = [
      {
        "authLevel" = "function"
        "direction" = "in"
        "methods" = [
          "get",
          "post",
        ]
        "name" = "req"
        "type" = "httpTrigger"
      },
      {
        "direction" = "out"
        "name"      = "$return"
        "type"      = "http"
      },
    ]
  }
EOF
}
