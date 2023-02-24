

# Creates a random resource
resource "random_string" "random" {
  count            = local.deployment_count
  length           = 4
  special          = false
  upper            = false
}


# Module declarations
module "image" {
  source = "./image"
  image_in = var.image[terraform.workspace]
}



# Start a container
module "container" {
  source = "./container"

  
  depends_on = [null_resource.dockervol]
  count = local.deployment_count # this creates an index

  # variables
  name_in  = join("-", ["image-name", random_string.random[count.index].result, terraform.workspace])
  image_in = module.image.image_out
  internal_port_in = 1880
  external_port_in = var.ext_port[terraform.workspace][count.index]
  container_path_in = "/data"
  host_path_in = "${path.cwd}/noderedvol" 

}


resource "null_resource" "dockervol" {

 provisioner "local-exec" {
    command = "sleep 10 && mkdir noderedvol/ || true && sudo  chown -R 1000:1000 noderedvol/"
  }
 
}