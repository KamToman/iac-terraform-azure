terraform {
  backend "local" {
    path = "./terraform.tfstate"
  }
}
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.0.0"
    }
  }
}

# Ten kawałek kodu zapewania nam, ze azure nie łaczy się z żadną subskrypcją

provider "azurerm" {
  skip_provider_registration = true
  features {}
}