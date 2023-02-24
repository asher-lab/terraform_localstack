##########################
## LOCAL VARS
##########################
locals {
  default_tfsettings = {
    project             = "keyvault"
    resource_group_name = "zyrous-drupal-rg-${terraform.workspace}"
    location            = "australiaeast"
    tags = {
      "Owner" = "zyrouscorp"
    }

  }
  tfsettings = local.default_tfsettings
}




variable "MYSQL_HOSTNAME_NAME" {
  type        = string
  description = "MYSQL_HOSTNAME"
  #default = "MYSQLHOSTNAME"
  default = "MYSQLHOSTNAME"
}

variable "MYSQL_HOSTNAME_SECRET" {
  type        = string
  description = "MYSQL_HOSTNAME_SECRET"
  sensitive   = true
  default = "zyrous-mysqlserver-dev.mysql.database.azure.com"
}


