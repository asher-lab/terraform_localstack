# variable ext_port {
#      type = number
  
# }

# variable "ext_port" {
#   type= list(number)
# }

variable ext_port {
  type=map
  description = "external ports based on env"
  default = {
    dev = [1880, 1881, 1882, 1883]
    uat =   [1884, 1885, 1886, 1887]
    prod =  [1888, 1889, 1890, 1891]
  }
}


# variable "env" {
#   type=string
#   default = "dev"
#   description = "env to deploy to"
# }

# variable "image" {
#   type=map
#   description = "image based on env"
#   default = {
#     dev = "nodered/node-red:latest"
#     uat = "nodered/node-red:latest-16"
#     prod = "nodered/node-red:3.0.1-1-18-minimal"
#   }
# }

variable "image" {
  type=map
  description = "image based on env"
}
