terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.22.00"
    }
  }
  backend "azurerm" {
    resource_group_name = var.bkstrgrg
    key = var.bkstrgkey
  }
}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "vnet_rg" {
  name     = var.resourcegroup_name
  location = var.location
}

resource "azurerm_app_service_plan" "app_service_plan" {
  name                = "Teffaform-appservice-plan"
  location            = azurerm_resource_group.resource_group.location
  resource_group_name = azurerm_resource_group.resource_group.name
  kind = "Windows"
  reserved = false

  sku {
    tier = "Standard"
    size = "S1"
  }
}

resource "azurerm_app_service" "app_service" {
  name                = "Terraform-webapp"
  location            = azurerm_resource_group.resource_group.location
  resource_group_name = azurerm_resource_group.resource_group.name
  app_service_plan_id = azurerm_app_service_plan.app_service_plan.id

  site_config {
    dotnet_framework_version = "v4.0"
  }

}


 
