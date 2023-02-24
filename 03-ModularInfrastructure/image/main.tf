# Pulls the image
resource "docker_image" "nodered_image" {
  # name = lookup(var.image, var.env)
  name = var.image_in
}
