#______________________________________________
#
# Ethernet Network Group Policy Variables
#______________________________________________

ethernet_network_group_policies = {
  "#Organization#_MANAGEMENT_vg" = {
    allowed_vlans = "100"
    description   = "Virtualization Management Vlan Group."
    native_vlan   = null
    organization  = "#Organization#"
    tags          = []
  }
  "#Organization#_MIGRATION_vg" = {
    allowed_vlans = "100"
    description   = "Virtualization Migration Vlan Group."
    native_vlan   = null
    organization  = "#Organization#"
    tags          = []
  }
  "#Organization#_STORAGE_vg" = {
    allowed_vlans = "100"
    description   = "Virtualization Storage Vlan Group."
    native_vlan   = null
    organization  = "#Organization#"
    tags          = []
  }
  "#Organization#_Virtual_Machine_vg" = {
    allowed_vlans = "100"
    description   = "Virtualization Virtual Machine Vlan Group."
    native_vlan   = null
    organization  = "#Organization#"
    tags          = []
  }
}
