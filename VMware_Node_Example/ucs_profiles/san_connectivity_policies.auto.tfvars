#______________________________________________
#
# SAN Connectivity Policy Variables
#______________________________________________

san_connectivity_policies = {
  "#Organization#_Virtualzation" = {
    description          = "#Organization# SAN Connectivity Policy for Virtual Hosts."
    organization         = "#Organization#"
    target_platform      = "FIAttached"
    vhba_placement_mode  = "custom"
    wwnn_allocation_type = "POOL"
    wwnn_static_address  = ""
    wwnn_pool            = "#Organization#_WWNN"
    tags                 = []
    vhbas = {
      "SAN-A" = {
        fibre_channel_adapter_policy = "#Organization#_fc_Virtualization"
        fibre_channel_network_policy = "#Organization#_Fabric_A"
        fibre_channel_qos_policy     = "#Organization#_fc_qos"
        name                         = "SAN-A"
        placement_pci_order          = 3
        placement_slot_id            = "MLOM"
        placement_switch_id          = "A"
        wwpn_allocation_type         = "POOL"
        wwpn_pool                    = "#Organization#_WWPN_Fabric_A"
      },
      "SAN-B" = {
        fibre_channel_adapter_policy = "#Organization#_fc_Virtualization"
        fibre_channel_network_policy = "#Organization#_Fabric_B"
        fibre_channel_qos_policy     = "#Organization#_fc_qos"
        name                         = "SAN-B"
        placement_pci_order          = 5
        placement_slot_id            = "MLOM"
        placement_switch_id          = "B"
        wwpn_allocation_type         = "POOL"
        wwpn_pool                    = "#Organization#_WWPN_Fabric_B"
      },
    }
  }
}
