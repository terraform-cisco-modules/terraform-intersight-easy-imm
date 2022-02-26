#______________________________________________
#
# LAN Connectivity Policy Variables
#______________________________________________

lan_connectivity_policies = {
  "Virtualization" = {
    description         = "LAN Connectivity Policy."
    vnic_placement_mode = "custom"
    target_platform     = "FIAttached"
    tags                = []
    vnics = {
      "MANAGEMENT-A" = {
        ethernet_adapter_policy         = "Virtualization"
        ethernet_network_control_policy = "lldp_enabled"
        ethernet_network_group_policy   = "MANAGEMENT_vg"
        ethernet_qos_policy             = "Silver"
        mac_address_allocation_type     = "POOL"
        mac_address_pool                = "Fabric_A"
        name                            = "MANAGEMENT-A"
        placement_pci_order             = 2
        placement_slot_id               = "MLOM"
        placement_switch_id             = "A"
      },
      "MANAGEMENT-B" = {
        ethernet_adapter_policy         = "Virtualization"
        ethernet_network_control_policy = "lldp_enabled"
        ethernet_network_group_policy   = "MANAGEMENT_vg"
        ethernet_qos_policy             = "Silver"
        mac_address_allocation_type     = "POOL"
        mac_address_pool                = "Fabric_B"
        name                            = "MANAGEMENT-B"
        placement_pci_order             = 3
        placement_slot_id               = "MLOM"
        placement_switch_id             = "B"
      },
      "MIGRATION-A" = {
        ethernet_adapter_policy         = "Virtualization"
        ethernet_network_control_policy = "lldp_enabled"
        ethernet_network_group_policy   = "MIGRATION_vg"
        ethernet_qos_policy             = "Bronze"
        mac_address_allocation_type     = "POOL"
        mac_address_pool                = "Fabric_A"
        name                            = "MIGRATION-A"
        placement_pci_order             = 4
        placement_slot_id               = "MLOM"
        placement_switch_id             = "A"
      },
      "MIGRATION-B" = {
        ethernet_adapter_policy         = "Virtualization"
        ethernet_network_control_policy = "lldp_enabled"
        ethernet_network_group_policy   = "MIGRATION_vg"
        ethernet_qos_policy             = "Bronze"
        mac_address_allocation_type     = "POOL"
        mac_address_pool                = "Fabric_B"
        name                            = "MIGRATION-B"
        placement_pci_order             = 5
        placement_slot_id               = "MLOM"
        placement_switch_id             = "B"
      },
      "STORAGE-A" = {
        ethernet_adapter_policy         = "Virtualization"
        ethernet_network_control_policy = "lldp_enabled"
        ethernet_network_group_policy   = "STORAGE_vg"
        ethernet_qos_policy             = "Platinum"
        mac_address_allocation_type     = "POOL"
        mac_address_pool                = "Fabric_A"
        name                            = "STORAGE-A"
        placement_pci_order             = 6
        placement_slot_id               = "MLOM"
        placement_switch_id             = "A"
      },
      "STORAGE-B" = {
        ethernet_adapter_policy         = "Virtualization"
        ethernet_network_control_policy = "lldp_enabled"
        ethernet_network_group_policy   = "STORAGE_vg"
        ethernet_qos_policy             = "Platinum"
        mac_address_allocation_type     = "POOL"
        mac_address_pool                = "Fabric_B"
        name                            = "STORAGE-B"
        placement_pci_order             = 7
        placement_slot_id               = "MLOM"
        placement_switch_id             = "B"
      },
      "DATA-A" = {
        ethernet_adapter_policy         = "Virtualization"
        ethernet_network_control_policy = "lldp_enabled"
        ethernet_network_group_policy   = "DATA_vg"
        ethernet_qos_policy             = "Gold"
        mac_address_allocation_type     = "POOL"
        mac_address_pool                = "Fabric_A"
        name                            = "Virtual_Machine-A"
        placement_pci_order             = 8
        placement_slot_id               = "MLOM"
        placement_switch_id             = "A"
      },
      "DATA-B" = {
        ethernet_adapter_policy         = "Virtualization"
        ethernet_network_control_policy = "lldp_enabled"
        ethernet_network_group_policy   = "DATA_vg"
        ethernet_qos_policy             = "Gold"
        mac_address_allocation_type     = "POOL"
        mac_address_pool                = "Fabric_B"
        name                            = "Virtual_Machine-B"
        placement_pci_order             = 9
        placement_slot_id               = "MLOM"
        placement_switch_id             = "B"
      },
    }
  }
}
