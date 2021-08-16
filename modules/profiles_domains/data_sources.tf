#____________________________________________________________
#
# Intersight Organization Data Source
# GUI Location: Settings > Settings > Organizations > Name
#____________________________________________________________

data "intersight_organization_organization" "org_moid" {
  for_each = local.organizations
  name     = each.value
}

#____________________________________________________________
#
# Fabric Interconnects Moid Data Source
# GUI Location:
#   Operate > Fabric Interconnects > Click the Desired Fabric
#   Interconnect > General Tab > Details Left Column > Serial
#____________________________________________________________

data "intersight_network_element_summary" "fi_a" {
  for_each = {
    for assign, serial in local.ucs_domain_profiles : assign => serial
    if serial.profile.assign_switches == true
  }
  serial = each.value.profile.domain_serial_a
}

data "intersight_network_element_summary" "fi_b" {
  for_each = {
    for assign, serial in local.ucs_domain_profiles : assign => serial
    if serial.profile.assign_switches == true
  }
  serial = each.value.profile.domain_serial_b
}
