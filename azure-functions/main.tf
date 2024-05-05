

resource "azurerm_resource_group" "example" {
  name     = var.resource_group_name
  location = var.resource_group_location
}

resource "azurerm_storage_account" "example" {
  name                     = var.azurerm_storage_account_name
  resource_group_name      = azurerm_resource_group.example.name
  location                 = azurerm_resource_group.example.location
  account_tier             = var.azurerm_storage_account_account_tier
  account_replication_type = var.azurerm_storage_account_replication_type

  tags = {
    environment = var.environment_tag
  }
}

resource "azurerm_service_plan" "example" {
  name                = var.azurerm_service_plan_name
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
  os_type             = var.azurerm_service_plan_os_type
  sku_name            = var.azurerm_service_plan_sku_name
}

resource "azurerm_linux_function_app" "example" {
  name                = var.azurerm_linux_function_app_name
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
  service_plan_id     = azurerm_service_plan.example.id

  storage_account_name       = azurerm_storage_account.example.name
  storage_account_access_key = azurerm_storage_account.example.primary_access_key

  site_config {
    application_stack {
      python_version = var.python_version
    }
  }
}

resource "azurerm_function_app_function" "example" {
  name            = var.azurerm_function_app_function_name
  function_app_id = azurerm_linux_function_app.example.id
  language        = var.azurerm_function_app_function_language
  test_data = var.test_data
  config_json = jsonencode({
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
  })

  #Tried to make a var with json function nested like for test_data, but with error
}