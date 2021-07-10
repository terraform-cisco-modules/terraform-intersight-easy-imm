#____________________________________________________________
#
# Terraform Remote State for Global Variables
#____________________________________________________________

data "terraform_remote_state" "global" {
  backend = "local"
  config = {
    path = "../global_vars/terraform.tfstate"
  }
}

data "terraform_remote_state" "domain" {
  backend = "local"
  config = {
    path = "../domain/terraform.tfstate"
  }
}

#____________________________________________________________
#
# Intersight Organization Data Source
# GUI Location: User Drop Down > Account {Name} > Account ID
#____________________________________________________________

data "intersight_organization_organization" "org_moid" {
  depends_on = [
    data.terraform_remote_state.global
  ]
  name = yamldecode(data.terraform_remote_state.global.outputs.organization)
}
