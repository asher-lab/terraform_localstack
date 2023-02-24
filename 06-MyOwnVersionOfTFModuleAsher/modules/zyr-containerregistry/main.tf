resource "azurerm_container_registry" "zyr-acr" {
  name                = "${var.container_registry_name}${terraform.workspace}"
  resource_group_name = "${data.azurerm_resource_group.zyr-rg.name}"
  location            = "${data.azurerm_resource_group.zyr-rg.location}"
  sku                 = "Basic"
  admin_enabled       = true
  
}