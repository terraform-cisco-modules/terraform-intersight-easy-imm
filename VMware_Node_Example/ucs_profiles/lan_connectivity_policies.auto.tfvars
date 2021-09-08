#______________________________________________
#
# LAN Connectivity Policy Variables
#______________________________________________

lan_connectivity_policies = {
  "#Organization#_Virtualization" = {
    description                 = "#Organization# LAN Connectivity Policy."
    organization                = "#Organization#"
    vnic_placement_mode         = "custom"
    target_platform             = "FIAttached"
    tags                        = []
    vnics = {
      "MANAGEMENT-A" = {
        ethernet_adapter_policy         = "#Organization#_eth_Virtualization"
        ethernet_network_control_policy = "#Organization#_lldp_enabled"
        ethernet_network_group_policy   = "#Organization#_MANAGEMENT_vg"
        ethernet_qos_policy             = "#Organization#_MANAGEMENT_qos"
        mac_address_allocation_type     = "POOL"
        mac_address_pool                = "#Organization#_Fabric_A"
        name                            = "MANAGEMENT-A"
        placement_pci_order             = 0
        placement_slot_id               = "MLOM"
        placement_switch_id             = "A"
      },
      "MANAGEMENT-B" = {
        ethernet_adapter_policy         = "#Organization#_eth_Virtualization"
        ethernet_network_control_policy = "#Organization#_lldp_enabled"
        ethernet_network_group_policy   = "#Organization#_MANAGEMENT_vg"
        ethernet_qos_policy             = "#Organization#_MANAGEMENT_qos"
        mac_address_allocation_type     = "POOL"
        mac_address_pool                = "#Organization#_Fabric_B"
        name                            = "MANAGEMENT-B"
        placement_pci_order             = 1
        placement_slot_id               = "MLOM"
        placement_switch_id             = "B"
      },
      "MIGRATION-A" = {
        ethernet_adapter_policy         = "#Organization#_eth_Virtualization"
        ethernet_network_control_policy = "#Organization#_lldp_enabled"
        ethernet_network_group_policy   = "#Organization#_MIGRATION_vg"
        ethernet_qos_policy             = "#Organization#_MIGRATION_qos"
        mac_address_allocation_type     = "POOL"
        mac_address_pool                = "#Organization#_Fabric_A"
        name                            = "MIGRATION-A"
        placement_pci_order             = 2
        placement_slot_id               = "MLOM"
        placement_switch_id             = "A"
      },
      "MIGRATION-B" = {
        ethernet_adapter_policy         = "#Organization#_eth_Virtualization"
        ethernet_network_control_policy = "#Organization#_lldp_enabled"
        ethernet_network_group_policy   = "#Organization#_MIGRATION_vg"
        ethernet_qos_policy             = "#Organization#_MIGRATION_qos"
        mac_address_allocation_type     = "POOL"
        mac_address_pool                = "#Organization#_Fabric_B"
        name                            = "MIGRATION-B"
        placement_pci_order             = 3
        placement_slot_id               = "MLOM"
        placement_switch_id             = "B"
      },
      "STORAGE-A" = {
        ethernet_adapter_policy         = "#Organization#_eth_Virtualization"
        ethernet_network_control_policy = "#Organization#_lldp_enabled"
        ethernet_network_group_policy   = "#Organization#_STORAGE_vg"
        ethernet_qos_policy             = "#Organization#_STORAGE_qos"
        mac_address_allocation_type     = "POOL"
        mac_address_pool                = "#Organization#_Fabric_A"
        name                            = "STORAGE-A"
        placement_pci_order             = 4
        placement_slot_id               = "MLOM"
        placement_switch_id             = "A"
      },
      "STORAGE-B" = {
        ethernet_adapter_policy         = "#Organization#_eth_Virtualization"
        ethernet_network_control_policy = "#Organization#_lldp_enabled"
        ethernet_network_group_policy   = "#Organization#_STORAGE_vg"
        ethernet_qos_policy             = "#Organization#_STORAGE_qos"
        mac_address_allocation_type     = "POOL"
        mac_address_pool                = "#Organization#_Fabric_B"
        name                            = "STORAGE-B"
        placement_pci_order             = 5
        placement_slot_id               = "MLOM"
        placement_switch_id             = "B"
      },
      "Virtual_Machine-A" = {
        ethernet_adapter_policy         = "#Organization#_eth_Virtualization"
        ethernet_network_control_policy = "#Organization#_lldp_enabled"
        ethernet_network_group_policy   = "#Organization#_Virtual_Machine_vg"
        ethernet_qos_policy             = "#Organization#_Virtual_Machine_qos"
        mac_address_allocation_type     = "POOL"
        mac_address_pool                = "#Organization#_Fabric_A"
        name                            = "Virtual_Machine-A"
        placement_pci_order             = 6
        placement_slot_id               = "MLOM"
        placement_switch_id             = "A"
      },
      "Virtual_Machine-B" = {
        ethernet_adapter_policy         = "#Organization#_eth_Virtualization"
        ethernet_network_control_policy = "#Organization#_lldp_enabled"
        ethernet_network_group_policy   = "#Organization#_Virtual_Machine_vg"
        ethernet_qos_policy             = "#Organization#_Virtual_Machine_qos"
        mac_address_allocation_type     = "POOL"
        mac_address_pool                = "#Organization#_Fabric_B"
        name                            = "Virtual_Machine-B"
        placement_pci_order             = 7
        placement_slot_id               = "MLOM"
        placement_switch_id             = "B"
      },
    }
  }
}
