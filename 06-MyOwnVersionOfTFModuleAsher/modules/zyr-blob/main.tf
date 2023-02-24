

resource "azurerm_storage_account" "zyr-blob" {
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
}



resource "azurerm_storage_container" "pmsblobstore" {
  name                  = "pmsblobstore${terraform.workspace}"
  storage_account_name  = azurerm_storage_account.zyr-blob.name
  container_access_type = "private"
}
resource "azurerm_storage_container" "tenantblobstore" {
  name                  = "tenantblobstore${terraform.workspace}"
  storage_account_name  = azurerm_storage_account.zyr-blob.name
  container_access_type = "private"
}
resource "azurerm_storage_container" "maintenanceblobstore" {
  name                  = "maintenanceblobstore${terraform.workspace}"
  storage_account_name  = azurerm_storage_account.zyr-blob.name
  container_access_type = "private"
}