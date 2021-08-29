#__________________________________________________________
#
# Get outputs from the Intersight Pools Workspace
#__________________________________________________________

data "terraform_remote_state" "pools" {
  backend = "remote"
  config = {
    organization = var.tfc_organization
    workspaces = {
      name = var.ws_pools
    }
  }
}


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
# Server Moid Data Source
# GUI Location:
#   Operate > Servers > Copy the Serial from the Column.
#____________________________________________________________

data "intersight_compute_physical_summary" "server" {
  for_each = {
    for k, v in local.ucs_server_profiles : k => v
    if v.profile.assign_server == true
  }
  serial = each.key
}


#____________________________________________________________
#
# Chassis Moid Data Source
# GUI Location:
#   Operate > Chassis > Copy the Serial from the Column.
#____________________________________________________________

data "intersight_equipment_chassis" "chassis" {
  for_each = {
    for k, v in local.ucs_chassis_profiles : k => v
    if v.profile.assigned_chassis == true
  }
  serial = each.key
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
