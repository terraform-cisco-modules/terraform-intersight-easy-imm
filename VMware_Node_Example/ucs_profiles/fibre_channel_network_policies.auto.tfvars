#______________________________________________
#
# Fibre Channel Network Policy Variables
#______________________________________________

fibre_channel_network_policies = {
  "#Organization#_Fabric_A" = {
    description     = "Fabric A VSAN Network Policy"
    organization    = "#Organization#"
    vsan_id         = 100
    tags            = []
  }
  "#Organization#_Fabric_B" = {
    description     = "Fabric B VSAN Network Policy"
    organization    = "#Organization#"
    vsan_id         = 200
    tags            = []
  }
}
