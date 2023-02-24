output "IPandPort" {
 value = flatten(module.container[*].IPandPort)
}

output "container_name" {
  value = module.container[*].container_name
  description = "container name"
}
 