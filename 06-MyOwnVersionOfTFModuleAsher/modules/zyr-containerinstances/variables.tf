#################################
# AZURE CONTAINER INSTANCE VARS #
#################################

variable "resource_group_name" {
  type = string
  default = "zyrous-drupal-rg"
}

variable "database_name" {
  type = string
  default = "zyrous-mysqlserver-dev"
}


variable "location" {
  type = string
  default = "australiaeast"
}

variable "ip_address_type" {
  type = string
  default = "Public"
}

variable "container_instance_name" {
  type = string
  default = "zyrous-container-instance"
}

variable "os_type" {
  type = string
  default = "Linux"
}

variable "fqdn_dns" {
  type = string
  default = "zyrous-dev"
}


#################################
# AZURE CONTAINERS LOCAL VARS         #
#################################

locals {
  default_tfsettings = {
    project             = "aci"
    resource_group_name = "zyrous-drupal-rg-${terraform.workspace}"
    location            = "australiaeast"
    tags = {
      "Owner" = "zyrouscorp"
    }

  }
  tfsettings = local.default_tfsettings
}


#################################
# AZURE CONTAINERS LOCAL VARS SENSITIVE        #
#################################


# the variables here must be from Azure Key Vault
# variable "MYSQL_DATABASE" {
#   type = string
#   sensitive   = true
#   default = "zyr-db"
# }
# 
# variable "MYSQL_HOSTNAME" {
#   type = string
#   sensitive   = true
#   default = "zyrous-mysqlserver-dev.mysql.database.azure.com"
# }
# 
# variable "MYSQL_PORT" {
#   type = string
#   sensitive   = true
#   default = "3306"
# }
# 
# variable "MYSQL_USER" {
#   type = string
#   sensitive   = true
#   default = "mysqladminun"
# }
# 
# variable "MYSQL_PASSWORD" {
#   type = string
#   sensitive   = true
#   default = "H@Sh1CoR3!"
# }


