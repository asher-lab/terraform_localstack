##########################
## LOCAL VARS
##########################
locals {
  default_tfsettings = {
    project             = "appservice"
    resource_group_name = "zyrous-drupal-rg-${terraform.workspace}"
    location            = "australiaeast"
    tags = {
      "Owner" = "zyrouscorp"
    }

  }
  tfsettings = local.default_tfsettings
}
