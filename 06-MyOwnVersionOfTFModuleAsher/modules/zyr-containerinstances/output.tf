output "app-fqdn" {
  value       = azurerm_container_group.zyr-aci.fqdn
  description = "The fqdn of the app instance."
}
