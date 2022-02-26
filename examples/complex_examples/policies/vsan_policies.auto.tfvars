#______________________________________________
#
# VSAN Policy Variables
#______________________________________________

vsan_policies = {
  "UCS-DEMO2-A" = {
    description     = ""
    uplink_trunking = true
    tags            = []
    vsans = {
      1 = {
        fcoe_vlan_id   = 4048
        vsan_id        = 1
        name           = "default"
        default_zoning = "Disabled"
      },
      10 = {
        fcoe_vlan_id   = 1010
        vsan_id        = 10
        name           = "PROD"
        default_zoning = "Disabled"
      },
      20 = {
        fcoe_vlan_id   = 1020
        vsan_id        = 20
        name           = "BACKUP"
        default_zoning = "Disabled"
      },
    }
  }
  "UCS-DEMO2-B" = {
    description     = ""
    uplink_trunking = false
    tags            = []
    vsans = {
      1 = {
        fcoe_vlan_id   = 4048
        vsan_id        = 1
        name           = "default"
        default_zoning = "Disabled"
      },
      11 = {
        fcoe_vlan_id   = 1011
        vsan_id        = 11
        name           = "PROD"
        default_zoning = "Disabled"
      },
      20 = {
        fcoe_vlan_id   = 1020
        vsan_id        = 20
        name           = "VSAN-20"
        default_zoning = "Disabled"
      },
      21 = {
        fcoe_vlan_id   = 1021
        vsan_id        = 21
        name           = "BACKUP"
        default_zoning = "Disabled"
      },
    }
  }
}
