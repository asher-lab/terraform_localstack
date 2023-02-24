data "azurerm_key_vault" "zyr-keyvault" {
  name                = "zyrous-keyvault-dev"
  resource_group_name = local.tfsettings.resource_group_name
}

data "azurerm_key_vault_secret" "MYSQLDATABASE" {
  name         = "MYSQLDATABASE1"
  key_vault_id = data.azurerm_key_vault.zyr-keyvault.id
}

data "azurerm_key_vault_secret" "MYSQLHOSTNAME" {
  name         = "MYSQLHOSTNAME"
  key_vault_id = data.azurerm_key_vault.zyr-keyvault.id
}

data "azurerm_key_vault_secret" "MYSQLPASSWORD" {
  name         = "MYSQLPASSWORD"
  key_vault_id = data.azurerm_key_vault.zyr-keyvault.id
}

data "azurerm_key_vault_secret" "MYSQLPORT" {
  name         = "MYSQLPORT"
  key_vault_id = data.azurerm_key_vault.zyr-keyvault.id
}

data "azurerm_key_vault_secret" "MYSQLUSER" {
  name         = "MYSQLUSER"
  key_vault_id = data.azurerm_key_vault.zyr-keyvault.id
}

data "azurerm_key_vault_secret" "HASHSALT" {
  name         = "HASHSALT"
  key_vault_id = data.azurerm_key_vault.zyr-keyvault.id
}

data "azurerm_key_vault_secret" "SITEDOMAIN" {
  name         = "SITEDOMAIN"
  key_vault_id = data.azurerm_key_vault.zyr-keyvault.id          
}
