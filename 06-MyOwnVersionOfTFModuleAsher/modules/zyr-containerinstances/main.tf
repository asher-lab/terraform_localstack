
resource "azurerm_container_group" "zyr-aci" {
  name = "zyrous-${local.tfsettings.project}-${terraform.workspace}"
  location = local.tfsettings.location
  resource_group_name = local.tfsettings.resource_group_name
  ip_address_type = var.ip_address_type
  dns_name_label = "${var.fqdn_dns}-dns"
  os_type = var.os_type

  container {
    name   = "deployment-app"
    image  = "zyrousacrdev.azurecr.io/zyrous/drupal:latest"
    cpu    = "1"
    memory = "1.5"

  
    ports {
      port     = 80
      protocol = "TCP"
    }

    # secure_environment_variables = {
   #   MYSQL_DATABASE= var.MYSQL_DATABASE
   #   MYSQL_HOSTNAME= var.MYSQL_HOSTNAME
   #   MYSQL_PORT= var.MYSQL_PORT
   #   MYSQL_USER= var.MYSQL_USER
   #   MYSQL_PASSWORD= var.MYSQL_PASSWORD
   # }
       

    secure_environment_variables = {
      MYSQL_DATABASE= data.azurerm_key_vault_secret.MYSQLDATABASE.value
      MYSQL_HOSTNAME= data.azurerm_key_vault_secret.MYSQLHOSTNAME.value
      MYSQL_PORT= data.azurerm_key_vault_secret.MYSQLPORT.value
      MYSQL_USER= data.azurerm_key_vault_secret.MYSQLUSER.value
      MYSQL_PASSWORD= data.azurerm_key_vault_secret.MYSQLPASSWORD.value
      HASH_SALT= data.azurerm_key_vault_secret.HASHSALT.value
      SITE_DOMAIN= data.azurerm_key_vault_secret.SITEDOMAIN.value
    }
  }


# Call the creds from azure registry to get data.
  image_registry_credential {
    username = "zyrousacrdev"
    password = "OhI103JytAd9GYQKfAN/0fymkeJjPtuD"
    server   = "zyrousacrdev.azurecr.io"
  }  

  
}



