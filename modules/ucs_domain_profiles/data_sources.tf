#____________________________________________________________
#
# Intersight Organization Data Source
# GUI Location: Settings > Settings > Organizations > Name
#____________________________________________________________

data "intersight_organization_organization" "org_moid" {
  name = var.organization
}

#____________________________________________________________
#
# Fabric Interconnects Moid Data Source
# GUI Location:
#   Operate > Fabric Interconnects > Click the Desired Fabric
#   Interconnect > General Tab > Details Left Column > Serial
#____________________________________________________________

data "intersight_network_element_summary" "fis" {
  for_each = {
    for k, v in local.merged_ucs_switches : k => v
    if length(
    regexall("[[:alnum:]]", v.serial_number)) > 0
  }
  serial = each.value.serial_number
}
