
resource "azurerm_resource_group" "zyr-rg" {
  name     = local.tfsettings.resource_group_name
  location = local.tfsettings.location
  tags     = local.tfsettings.tags
  lifecycle {
    prevent_destroy = false
  }
}

resource "azurerm_storage_account" "main" {
  name                     = "zyrous${local.tfsettings.project}${terraform.workspace}"
  resource_group_name      = local.tfsettings.resource_group_name
  location                 = local.tfsettings.location
  account_tier             = "Standard"
  account_replication_type = "GRS"
  shared_access_key_enabled = "true"
  tags                     = local.tfsettings.tags
  blob_properties {
    change_feed_enabled = true
    versioning_enabled  = true
    delete_retention_policy {
      days = 7
    }
    container_delete_retention_policy {
      days = 7
    }
  }
  depends_on = [azurerm_resource_group.zyr-rg]
}


resource "azurerm_storage_container" "main" {
  name                  = "tfstate"
  storage_account_name  = azurerm_storage_account.main.name
  container_access_type = "private"
}


##########################
## LOCAL VARS
##########################
locals {
  default_tfsettings = {
    project             = "tfstate"
    resource_group_name = "zyrous-drupal-rg-${terraform.workspace}"
    location            = "australiaeast"
    tags = {
      "Owner" = "zyrouscorp"
    }

  }
  tfsettings = local.default_tfsettings
}

