provider "azurerm" {
  skip_provider_registration = "false"
  features {
    resource_group {
       prevent_deletion_if_contains_resources = false
     }
  }
}


terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.0.2"
    }
  }
    backend "azurerm" {
        resource_group_name  = "zyrous-drupal-rg-dev"
        storage_account_name = "zyroustfstatedev"
        container_name       = "tfstate"
        key                  = "terraform.tfstate"
    }

}