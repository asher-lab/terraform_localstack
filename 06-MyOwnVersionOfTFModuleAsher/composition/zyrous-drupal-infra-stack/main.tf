
 # deploy the registry and push the image beforehand
 # module "containerinstances" {
 #   source   = "../../modules/zyr-containerinstances"
 # }

  module "containerregistry" {
    source   = "../../modules/zyr-containerregistry"
  }

#  module "blob" {
#     source   = "../../modules/zyr-blob"
#   }
  
 module "sql" {
    source   = "../../modules/zyr-mysql"
  }
 
 module "appservice" {
    source   = "../../modules/zyr-appservice"
  }

# module "ad" {
# }
# 
# module "api" {
# }
# 

# module "cdn" {
# }
# 

# 
# module "containerservices" {
# }
# 


# module "api" {
# }
# 
# module "vnet" {
# }
# 
# module "waf" {
# }
