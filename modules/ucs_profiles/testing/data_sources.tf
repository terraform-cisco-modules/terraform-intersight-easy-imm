#__________________________________________________________
#
# Get outputs from the Intersight Pools Workspace
#__________________________________________________________

# data "terraform_remote_state" "pools" {
#   backend = "remote"
#   config = {
#     organization = var.tfc_organization
#     workspaces = {
#       name = var.ws_pools
#     }
#   }
# }


#____________________________________________________________
#
# Intersight Organization Data Source
# GUI Location: Settings > Settings > Organizations > Name
#____________________________________________________________

data "intersight_organization_organization" "org_moid" {
  for_each = local.organizations
  name     = each.value
}

