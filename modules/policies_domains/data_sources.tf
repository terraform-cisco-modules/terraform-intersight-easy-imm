#____________________________________________________________
#
# Terraform Remote State for Global Variables
#____________________________________________________________

data "terraform_remote_state" "domain" {
  backend = "remote"
  config = {
    organization = var.tfc_organization
    workspaces = {
      name = var.domain_workspace
    }
  }
}

#____________________________________________________________
#
# Intersight Organization Data Source
# GUI Location: User Drop Down > Account {Name} > Account ID
#____________________________________________________________

data "intersight_organization_organization" "org_moid" {
  name = var.organization
}
