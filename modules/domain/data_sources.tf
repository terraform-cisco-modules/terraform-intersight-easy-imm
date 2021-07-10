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

#____________________________________________________________
#
# Intersight Organization Data Source
# GUI Location: User Drop Down > Account {Name} > Account ID
#____________________________________________________________

data "intersight_organization_organization" "org_moid" {
  depends_on = [
    data.terraform_remote_state.global
  ]
  name = data.terraform_remote_state.global.outputs.organization
}

#____________________________________________________________
#
# Intersight Fabric Interconnects  Data Source
# GUI Location: User Drop Down > Account {Name} > Account ID
#____________________________________________________________

data "intersight_network_element_summary" "fabric_interconnect_a" {
  serial = var.serial_switch_a
}

data "intersight_network_element_summary" "fabric_interconnect_b" {
  serial = var.serial_switch_b
}
