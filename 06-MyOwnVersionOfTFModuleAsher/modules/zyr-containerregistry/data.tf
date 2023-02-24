data "azurerm_resource_group" "zyr-rg" {
  name = "zyrous-drupal-rg-${terraform.workspace}"
}
