

# Creates a random resource
resource "random_string" "random" {
  count            = 4
  length           = 4
  special          = false
  upper            = false
}


# Pulls the image
resource "docker_image" "nodered_image" {
  # name = lookup(var.image, var.env)
  name = var.image[terraform.workspace]
}





# Start a container
resource "docker_container" "nodered_container" {
  count = 4 # this creates an index
  name  = join("-", ["nodered", random_string.random[count.index].result, terraform.workspace])
  image = docker_image.nodered_image.image_id

  ports {
    internal = 1880
    # this is working tfvars 
    # external = tonumber(element(var.ext_port, count.index))

    # using map, verify via tfconsole
    external = var.ext_port[terraform.workspace][count.index]
  }

  volumes {
    container_path = "/data"
    host_path = "${path.cwd}/noderedvol" 
  }
}


resource "null_resource" "dockervol" {

 provisioner "local-exec" {
    command = "mkdir noderedvol/ || true && sudo  chown -R 1000:1000 noderedvol/"
  }
 
}