terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0.0"
    }
  }
}

provider "docker" {
}

# Creates a random resource
resource "random_string" "random" {
  count            = 2
  length           = 4
  special          = false
  upper            = false
}



# Pulls the image
resource "docker_image" "nodered_image" {
  name = "nodered/node-red:latest"
}

# Start a container
resource "docker_container" "nodered_container" {
  count = 2
  name  = join("-", ["nodered", random_string.random[count.index].result])
  image = docker_image.nodered_image.image_id

  ports {
    internal = 1880
    external = 1880 + count.index
  }
}



# output "IP_address" {
#   value = docker_container.nodered_container[*].network_data[0].ip_address
#   description = "IP address of nodered container"
# }

# output "IPandPort" {
#   value = join(":", [docker_container.nodered_container[*].network_data[*].ip_address,  docker_container.nodered_container[*].ports[*].external])
#   description = "IP address and Port of Container"
# }



output "container_name" {
  value = docker_container.nodered_container[*].name
  description = "container name"
}

# output "IP_address2" {
#   value = docker_container.nodered_container[1].network_data[0].ip_address
#   description = "IP address of nodered container"
# }

# output "IPandPort2" {
#   value = join(":", [docker_container.nodered_container[1].network_data[0].ip_address,  docker_container.nodered_container[1].ports[0].external])
#   description = "IP address and Port of Container"
# }