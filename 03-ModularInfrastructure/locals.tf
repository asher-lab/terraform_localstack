# locals {
#   service_name = "forum"
#   owner        = "Community Team"
# }

# locals {
#   # Common tags to be assigned to all resources
#   common_tags = {
#     Service = local.service_name
#     Owner   = local.owner
#   }
# }


// Max is 4
// local.deployment_count
locals {
    deployment_count = 4
}