#______________________________________________
#
# VLAN Policy Variables
#______________________________________________

vlan_policies = {
  "#Organization#_vlans" = {
    description  = "#Organization# VLAN Policy."
    organization = "#Organization#"
    tags         = []
    vlans = {
      1 = {
        auto_allow_on_uplinks = true
        multicast_policy      = "#Organization#_multicast",
        name                  = "vlan-1",
        native_vlan           = true
        vlan_id               = 1,
      },
      2 = {
        auto_allow_on_uplinks = true
        multicast_policy      = "#Organization#_multicast",
        name                  = "vlan-2",
        vlan_id               = 2,
      },
      3 = {
        auto_allow_on_uplinks = true
        multicast_policy      = "#Organization#_multicast",
        name                  = "vlan-3",
        vlan_id               = 3,
      },
      4 = {
        auto_allow_on_uplinks = true
        multicast_policy      = "#Organization#_multicast",
        name                  = "vlan-4",
        vlan_id               = 4,
      },
    }
  }
}
