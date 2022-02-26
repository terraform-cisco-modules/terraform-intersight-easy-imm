#______________________________________________
#
# SAN Connectivity Policy Variables
#______________________________________________

san_connectivity_policies = {
  "Virtualzation" = {
    description          = "SAN Connectivity Policy for Virtual Hosts."
    target_platform      = "FIAttached"
    vhba_placement_mode  = "custom"
    wwnn_allocation_type = "POOL"
    wwnn_static_address  = ""
    wwnn_pool            = "WWNN"
    tags                 = []
    vhbas = {
      "HBA-A" = {
        fibre_channel_adapter_policy = "Virtualization"
        fibre_channel_network_policy = "Fabric_A"
        fibre_channel_qos_policy     = "fc_qos"
        name                         = "HBA-A"
        placement_pci_order          = 0
        placement_slot_id            = "MLOM"
        placement_switch_id          = "A"
        wwpn_allocation_type         = "POOL"
        wwpn_pool                    = "WWPN_Fabric_A"
      },
      "HBA-B" = {
        fibre_channel_adapter_policy = "Virtualization"
        fibre_channel_network_policy = "Fabric_B"
        fibre_channel_qos_policy     = "fc_qos"
        name                         = "HBA-B"
        placement_pci_order          = 1
        placement_slot_id            = "MLOM"
        placement_switch_id          = "B"
        wwpn_allocation_type         = "POOL"
        wwpn_pool                    = "WWPN_Fabric_B"
      },
    }
  }
}
