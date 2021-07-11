#____________________________________________________________
#
# Intersight Organization Data Source
# GUI Location: User Drop Down > Account {Name} > Account ID
#____________________________________________________________

data "intersight_organization_organization" "org_moid" {
  name = var.organization
}

#____________________________________________________________
#
# Intersight Fabric Interconnects  Data Source
# GUI Location: User Drop Down > Account {Name} > Account ID
#____________________________________________________________

data "intersight_network_element_summary" "fabric_interconnect_a" {
  serial = local.serial_a
}

data "intersight_network_element_summary" "fabric_interconnect_b" {
  serial = local.serial_b
}
