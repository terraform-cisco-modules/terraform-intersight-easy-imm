#____________________________________________________________
#
# Intersight Organization Data Source
# GUI Location: User Drop Down > Account {Name} > Account ID
#____________________________________________________________

data "intersight_organization_organization" "org_moid" {
  depends_on = [
    data.terraform_remote_state.global
  ]
  name = var.organization
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
