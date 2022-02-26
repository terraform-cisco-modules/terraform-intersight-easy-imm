#______________________________________________
#
# VLAN Policy Variables
#______________________________________________

vlan_policies = {
  "vlans" = {
    description = "VLAN Policy."
    tags        = []
    vlans = {
      1 = {
        auto_allow_on_uplinks = true
        multicast_policy      = "multicast",
        name                  = "vlan-1",
        native_vlan           = true
        vlan_list             = "1",
      },
      2 = {
        auto_allow_on_uplinks = true
        multicast_policy      = "multicast",
        name                  = "vlan-2",
        vlan_list             = "2",
      },
      3 = {
        auto_allow_on_uplinks = true
        multicast_policy      = "multicast",
        name                  = "vlan-3",
        vlan_id               = "3",
      },
      "vlan_list" = {
        auto_allow_on_uplinks = true
        multicast_policy      = "multicast",
        name                  = "VLAN",
        vlan_list             = "5-100,200-211",
      },
    }
  }
}
