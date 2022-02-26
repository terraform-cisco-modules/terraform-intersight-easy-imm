#______________________________________________
#
# Fibre Channel (vHBA) Network Policies
#______________________________________________

fibre_channel_network_policies = {
  "aaa_SCP_fc0" = {
    default_vlan_id = 4048
    description     = ""
    vsan_id         = 1
    tags            = []
  }
  "aaa_SCP_fc1" = {
    default_vlan_id = 4048
    description     = ""
    vsan_id         = 1
    tags            = []
  }
  "ESXi-OCB_SAN-A" = {
    default_vlan_id = 1010
    description     = ""
    vsan_id         = 10
    tags            = []
  }
  "ESXi-OCB_SAN-B" = {
    default_vlan_id = 1020
    description     = ""
    vsan_id         = 20
    tags            = []
  }
  "TEST-PLACEMENT_SCP_vhba0" = {
    default_vlan_id = 4048
    description     = ""
    vsan_id         = 1
    tags            = []
  }
  "TEST-PLACEMENT-TEMPLATE_SCP_vhba0" = {
    default_vlan_id = 4048
    description     = ""
    vsan_id         = 1
    tags            = []
  }
}