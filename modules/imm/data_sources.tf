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
  name = yamldecode(data.terraform_remote_state.global.outputs.organization)
}

#____________________________________________________________
#
# Intersight Organization Data Source
# GUI Location: User Drop Down > Account {Name} > Account ID
#____________________________________________________________

data "intersight_network_element_summary" "fabric_interconnect_a" {
  serial = data.terraform_remote_state.global.outputs.serial_a
}

data "intersight_network_element_summary" "fabric_interconnect_b" {
  serial = data.terraform_remote_state.global.outputs.serial_b
}

output "moid_a" {
  value = data.intersight_network_element_summary.fabric_interconnect_a.results.0.moid
}

output "serial_a" {
  value = data.terraform_remote_state.global.outputs.serial_a
}

output "model_a" {
  value = data.intersight_network_element_summary.fabric_interconnect_a.results.0.model
}

output "moid_b" {
  value = data.intersight_network_element_summary.fabric_interconnect_b.results.0.moid
}

output "model_b" {
  value = data.intersight_network_element_summary.fabric_interconnect_b.results.0.model
}
