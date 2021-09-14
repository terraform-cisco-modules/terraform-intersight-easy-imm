#______________________________________________
#
# VSAN Policy Variables
#______________________________________________

vsan_policies = {
  "#Organization#_Fabric_A" = {
    description     = "#Organization# Fabric A VSAN Policy."
    organization    = "#Organization#"
    uplink_trunking = false
    tags            = []
    vsans = {
      100 = {
        fcoe_vlan_id = 100
        vsan_id      = 100
        name         = "Fabric_A"
      },
    }
  }
  "#Organization#_Fabric_B" = {
    description     = "#Organization# Fabric B VSAN Policy."
    organization    = "#Organization#"
    uplink_trunking = false
    tags            = []
    vsans = {
      200 = {
        fcoe_vlan_id = 200
        vsan_id      = 200
        name         = "Fabric_B"
      },
    }
  }
}
