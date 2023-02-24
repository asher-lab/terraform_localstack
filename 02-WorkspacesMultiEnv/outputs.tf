output "IPandPort" {
 value = [for i in docker_container.nodered_container[*]: join(":", flatten([i.network_data[*].ip_address, i.ports[*].external]))]

}

output "container_name" {
  value = docker_container.nodered_container[*].name
  description = "container name"
}
 