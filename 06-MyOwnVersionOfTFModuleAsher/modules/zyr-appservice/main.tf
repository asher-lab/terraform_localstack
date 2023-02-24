resource "azurerm_service_plan" "this" {
  name                = "zyrous-serviceplan"
  resource_group_name = local.tfsettings.resource_group_name
  location            = local.tfsettings.location
  os_type             = "Linux"
  sku_name            = "P1v2"
}

resource "azurerm_linux_web_app" "this" {
  name                = "zyrous-${local.tfsettings.project}-${terraform.workspace}"
  resource_group_name = local.tfsettings.resource_group_name
  location            = local.tfsettings.location
  service_plan_id     = azurerm_service_plan.this.id

  site_config {
    application_stack {
    docker_image = "zyrousacrdev.azurecr.io/zyrous/drupal"
    docker_image_tag = "latest"
    }
  }


    app_settings = {
      MYSQL_DATABASE= data.azurerm_key_vault_secret.MYSQLDATABASE.value
      MYSQL_HOSTNAME= data.azurerm_key_vault_secret.MYSQLHOSTNAME.value
      MYSQL_PORT= data.azurerm_key_vault_secret.MYSQLPORT.value
      MYSQL_USER= data.azurerm_key_vault_secret.MYSQLUSER.value
      MYSQL_PASSWORD= data.azurerm_key_vault_secret.MYSQLPASSWORD.value
      HASH_SALT= data.azurerm_key_vault_secret.HASHSALT.value
      SITE_DOMAIN= data.azurerm_key_vault_secret.SITEDOMAIN.value
      DOCKER_REGISTRY_SERVER_PASSWORD           = "OhI103JytAd9GYQKfAN/0fymkeJjPtuD"
      DOCKER_REGISTRY_SERVER_URL                = "zyrousacrdev.azurecr.io"
      DOCKER_REGISTRY_SERVER_USERNAME           = "zyrousacrdev"
      WEBSITES_CONTAINER_START_TIME_LIMIT = 1800
      DRUPAL_PASSWORD = "admin_pass"
  }





}
