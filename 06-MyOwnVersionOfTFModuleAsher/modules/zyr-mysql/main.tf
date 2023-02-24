resource "azurerm_mysql_server" "zyr-mysql" {
  name                     = "zyrous-${local.tfsettings.project}-${terraform.workspace}"
  resource_group_name      = local.tfsettings.resource_group_name
  location                 = local.tfsettings.location

  administrator_login          = "mysqladminun"
  administrator_login_password = "H@Sh1CoR3!"

  sku_name   = "B_Gen5_1"
  storage_mb = 5120
  version    = "8.0" 

  auto_grow_enabled                 = true
  backup_retention_days             = 7
  geo_redundant_backup_enabled      = false
  infrastructure_encryption_enabled = false
  public_network_access_enabled     = true
  ssl_enforcement_enabled           = false
  ssl_minimal_tls_version_enforced  = "TLSEnforcementDisabled"
}


# resource "azurerm_mysql_database" "mysql-db" {
#   name                = "zyrous-financial-db"
#   resource_group_name = local.tfsettings.resource_group_name
#   server_name         = azurerm_mysql_server.zyr-mysql.name
#   charset             = "utf8"
#   collation           = "utf8_unicode_ci"
# }
# 
# resource "azurerm_mysql_database" "mysql-db2" {
#   name                = "demo-zyrous-financial-db"
#   resource_group_name = local.tfsettings.resource_group_name
#   server_name         = azurerm_mysql_server.zyr-mysql.name
#   charset             = "utf8"
#   collation           = "utf8_unicode_ci"
# }



resource "azurerm_mysql_firewall_rule" "mysql-fw-rule" {
  name                = "ZyrousCorpFW"
  resource_group_name = local.tfsettings.resource_group_name
  server_name         = azurerm_mysql_server.zyr-mysql.name
  start_ip_address    = "0.0.0.0"
  end_ip_address      = "225.225.225.225"
}

