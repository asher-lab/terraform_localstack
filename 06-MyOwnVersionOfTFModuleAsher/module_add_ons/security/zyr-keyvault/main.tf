resource "azurerm_key_vault" "zyr-keyvault" {
  name                        = "zyrous-${local.tfsettings.project}-${terraform.workspace}"
  location                    = local.tfsettings.location
  resource_group_name         = local.tfsettings.resource_group_name
  enabled_for_disk_encryption = false
  tenant_id                   = data.azurerm_client_config.current.tenant_id
  soft_delete_retention_days  = 7
  purge_protection_enabled    = false

  sku_name = "standard"

  access_policy {
    tenant_id = data.azurerm_client_config.current.tenant_id
    object_id = data.azurerm_client_config.current.object_id

    key_permissions = [
      "Get",
    ]

    secret_permissions = [
      "Get",
      "List",
      "Set",
      "Delete"
    ]

    storage_permissions = [
      "Get",
    ]
  }

}




# resource "azurerm_key_vault_secret" "MYSQL_HOSTNAME" {
#   name         = var.MYSQL_HOSTNAME_NAME
#   value        = var.MYSQL_HOSTNAME_SECRET
#   key_vault_id = azurerm_key_vault.zyr-keyvault.id
# }

