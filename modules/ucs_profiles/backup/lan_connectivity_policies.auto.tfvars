#______________________________________________
#
# LAN Connectivity Policies
#______________________________________________

lan_connectivity_policies = {
  "aaa_LCP" = {
    description                 = ""
    enable_azure_stack_host_qos = false
    iqn_allocation_type         = "None"
    iqn_pool                    = [""]
    iqn_static_identifier       = ""
    organization                = "UCS-DEMO2"
    vnic_placement_mode         = "auto"
    target_platform             = "FI-Attached"
    tags = [
      {
        key = "easyucs_origin",
        value = "convert",
      },
      {
        key = "easyucs_version",
        value = "0.9.8",
      },
    ]
    vnics = [
      {
        enable_failover                 = false,
        ethernet_adapter_policy         = "default",
        ethernet_network_control_policy = "default",
        ethernet_network_group_policy   = "aaa_LCP_eth0",
        ethernet_qos_policy             = "default",
        mac_address_allocation_type     = "pool",
        mac_address_pool                = ["DEMO"],
        name                            = "eth0",
        pci_order                       = 2,
        slot_id                         = "MLOM",
        switch_id                       = "A",
      },
      {
        enable_failover                 = false,
        ethernet_adapter_policy         = "default",
        ethernet_network_control_policy = "default",
        ethernet_network_group_policy   = "aaa_LCP_eth1",
        ethernet_qos_policy             = "default",
        mac_address_allocation_type     = "pool",
        mac_address_pool                = ["DEMO"],
        name                            = "eth1",
        pci_order                       = 4,
        slot_id                         = "MLOM",
        switch_id                       = "B",
      },
      {
        enable_failover                 = false,
        ethernet_adapter_policy         = "default",
        ethernet_network_control_policy = "default",
        ethernet_network_group_policy   = "aaa_LCP_eth3",
        ethernet_qos_policy             = "default",
        mac_address_allocation_type     = "pool",
        mac_address_pool                = ["DEMO"],
        name                            = "eth3",
        pci_order                       = 1,
        slot_id                         = "MLOM",
        switch_id                       = "A",
      },
    ]
  }
  "esxi3_LCP" = {
    description                 = ""
    enable_azure_stack_host_qos = false
    iqn_allocation_type         = "None"
    iqn_pool                    = [""]
    iqn_static_identifier       = ""
    organization                = "UCS-DEMO2"
    vnic_placement_mode         = "auto"
    target_platform             = "FI-Attached"
    tags = [
      {
        key = "easyucs_origin",
        value = "convert",
      },
      {
        key = "easyucs_version",
        value = "0.9.8",
      },
    ]
    vnics = [
      {
        enable_failover                 = false,
        ethernet_adapter_policy         = "default",
        ethernet_network_control_policy = "default",
        ethernet_network_group_policy   = "esxi3_LCP_data-1",
        ethernet_qos_policy             = "default",
        mac_address_allocation_type     = "pool",
        mac_address_pool                = ["OCB-ESXi"],
        name                            = "data-1",
        pci_order                       = 6,
        slot_id                         = "MLOM",
        switch_id                       = "A",
      },
      {
        enable_failover                 = false,
        ethernet_adapter_policy         = "default",
        ethernet_network_control_policy = "default",
        ethernet_network_group_policy   = "esxi3_LCP_data-2",
        ethernet_qos_policy             = "default",
        mac_address_allocation_type     = "pool",
        mac_address_pool                = ["OCB-ESXi"],
        name                            = "data-2",
        pci_order                       = 8,
        slot_id                         = "MLOM",
        switch_id                       = "B",
      },
      {
        enable_failover                 = false,
        ethernet_adapter_policy         = "VMWare",
        ethernet_network_control_policy = "CDP-LLDP-ENABLE",
        ethernet_network_group_policy   = "esxi3_LCP_DATA-A",
        ethernet_qos_policy             = "default",
        mac_address_allocation_type     = "pool",
        mac_address_pool                = ["OCB-ESXi"],
        name                            = "DATA-A",
        pci_order                       = 7,
        slot_id                         = "MLOM",
        switch_id                       = "A",
      },
      {
        enable_failover                 = false,
        ethernet_adapter_policy         = "VMWare",
        ethernet_network_control_policy = "CDP-LLDP-ENABLE",
        ethernet_network_group_policy   = "esxi3_LCP_DATA-B",
        ethernet_qos_policy             = "default",
        mac_address_allocation_type     = "pool",
        mac_address_pool                = ["OCB-ESXi"],
        name                            = "DATA-B",
        pci_order                       = 10,
        slot_id                         = "MLOM",
        switch_id                       = "A",
      },
      {
        enable_failover                 = false,
        ethernet_adapter_policy         = "VMWare",
        ethernet_network_control_policy = "CDP-LLDP-ENABLE",
        ethernet_network_group_policy   = "esxi3_LCP_ISCSI-A",
        ethernet_qos_policy             = "ISCSI_mtu9000",
        mac_address_allocation_type     = "pool",
        mac_address_pool                = ["OCB-ESXi"],
        name                            = "ISCSI-A",
        pci_order                       = 1,
        slot_id                         = "MLOM",
        switch_id                       = "A",
      },
      {
        enable_failover                 = false,
        ethernet_adapter_policy         = "VMWare",
        ethernet_network_control_policy = "CDP-LLDP-ENABLE",
        ethernet_network_group_policy   = "esxi3_LCP_ISCSI-B",
        ethernet_qos_policy             = "ISCSI_mtu9000",
        mac_address_allocation_type     = "pool",
        mac_address_pool                = ["OCB-ESXi"],
        name                            = "ISCSI-B",
        pci_order                       = 2,
        slot_id                         = "MLOM",
        switch_id                       = "B",
      },
      {
        enable_failover                 = false,
        ethernet_adapter_policy         = "VMWare",
        ethernet_network_control_policy = "CDP-LLDP-ENABLE",
        ethernet_network_group_policy   = "esxi3_LCP_MGMT-A",
        ethernet_qos_policy             = "default",
        mac_address_allocation_type     = "pool",
        mac_address_pool                = ["OCB-ESXi"],
        name                            = "MGMT-A",
        pci_order                       = 4,
        slot_id                         = "MLOM",
        switch_id                       = "A",
      },
      {
        enable_failover                 = false,
        ethernet_adapter_policy         = "VMWare",
        ethernet_network_control_policy = "CDP-LLDP-ENABLE",
        ethernet_network_group_policy   = "esxi3_LCP_MGMT-B",
        ethernet_qos_policy             = "default",
        mac_address_allocation_type     = "pool",
        mac_address_pool                = ["OCB-ESXi"],
        name                            = "MGMT-B",
        pci_order                       = 5,
        slot_id                         = "MLOM",
        switch_id                       = "B",
      },
      {
        enable_failover                 = false,
        ethernet_adapter_policy         = "VMWare",
        ethernet_network_control_policy = "default",
        ethernet_network_group_policy   = "esxi3_LCP_VMOTION-A",
        ethernet_qos_policy             = "default",
        mac_address_allocation_type     = "pool",
        mac_address_pool                = ["OCB-ESXi"],
        name                            = "VMOTION-A",
        pci_order                       = 11,
        slot_id                         = "MLOM",
        switch_id                       = "A",
      },
      {
        enable_failover                 = false,
        ethernet_adapter_policy         = "VMWare",
        ethernet_network_control_policy = "default",
        ethernet_network_group_policy   = "esxi3_LCP_VMOTION-B",
        ethernet_qos_policy             = "default",
        mac_address_allocation_type     = "pool",
        mac_address_pool                = ["OCB-ESXi"],
        name                            = "VMOTION-B",
        pci_order                       = 12,
        slot_id                         = "MLOM",
        switch_id                       = "B",
      },
      {
        enable_failover                 = false,
        ethernet_adapter_policy         = "default",
        ethernet_network_control_policy = "default",
        ethernet_network_group_policy   = "esxi3_LCP_VNIC-ADMIN",
        ethernet_qos_policy             = "default",
        mac_address_allocation_type     = "pool",
        mac_address_pool                = ["OCB-ESXi"],
        name                            = "VNIC-ADMIN",
        pci_order                       = 3,
        slot_id                         = "MLOM",
        switch_id                       = "A",
      },
      {
        enable_failover                 = false,
        ethernet_adapter_policy         = "VMWare",
        ethernet_network_control_policy = "default",
        ethernet_network_group_policy   = "esxi3_LCP_VNIC-ADMIN-B",
        ethernet_qos_policy             = "default",
        mac_address_allocation_type     = "pool",
        mac_address_pool                = ["OCB-ESXi"],
        name                            = "VNIC-ADMIN-B",
        pci_order                       = 9,
        slot_id                         = "MLOM",
        switch_id                       = "B",
      },
    ]
  }
  "ISCSI-BOOT-2" = {
    description                 = ""
    enable_azure_stack_host_qos = false
    iqn_allocation_type         = "None"
    iqn_pool                    = [""]
    iqn_static_identifier       = ""
    organization                = "UCS-DEMO2"
    vnic_placement_mode         = "auto"
    target_platform             = "FI-Attached"
    tags = [
      {
        key = "easyucs_origin",
        value = "convert",
      },
      {
        key = "easyucs_version",
        value = "0.9.8",
      },
    ]
    vnics = [
      {
        cdn_source                      = "vnic",
        enable_failover                 = false,
        ethernet_adapter_policy         = "VMWare",
        ethernet_network_control_policy = "CDP-LLDP-ENABLE",
        ethernet_qos_policy             = "default",
        mac_address_allocation_type     = "pool",
        mac_address_pool                = ["OCB-ESXi"],
        name                            = "DATA-A",
        pci_order                       = 5,
        slot_id                         = "MLOM",
        switch_id                       = "A",
      },
      {
        cdn_source                      = "vnic",
        enable_failover                 = false,
        ethernet_adapter_policy         = "VMWare",
        ethernet_network_control_policy = "CDP-LLDP-ENABLE",
        ethernet_qos_policy             = "default",
        mac_address_allocation_type     = "pool",
        mac_address_pool                = ["OCB-ESXi"],
        name                            = "DATA-B",
        pci_order                       = 6,
        slot_id                         = "MLOM",
        switch_id                       = "A",
      },
      {
        cdn_source                      = "vnic",
        enable_failover                 = false,
        ethernet_adapter_policy         = "VMWare",
        ethernet_network_control_policy = "CDP-LLDP-ENABLE",
        ethernet_network_group_policy   = "ISCSI-BOOT-2_ISCSI-A",
        ethernet_qos_policy             = "ISCSI_mtu9000",
        mac_address_allocation_type     = "pool",
        mac_address_pool                = ["ISCSI-A"],
        name                            = "ISCSI-A",
        pci_order                       = 3,
        slot_id                         = "MLOM",
        switch_id                       = "A",
      },
      {
        cdn_source                      = "vnic",
        enable_failover                 = false,
        ethernet_adapter_policy         = "VMWare",
        ethernet_network_control_policy = "CDP-LLDP-ENABLE",
        ethernet_network_group_policy   = "ISCSI-BOOT-2_ISCSI-B",
        ethernet_qos_policy             = "ISCSI_mtu9000",
        mac_address_allocation_type     = "pool",
        mac_address_pool                = ["ISCSI-B"],
        name                            = "ISCSI-B",
        pci_order                       = 4,
        slot_id                         = "MLOM",
        switch_id                       = "B",
      },
      {
        cdn_source                      = "vnic",
        enable_failover                 = false,
        ethernet_adapter_policy         = "VMWare",
        ethernet_network_control_policy = "CDP-LLDP-ENABLE",
        ethernet_network_group_policy   = "ISCSI-BOOT-2_MGMT-A",
        ethernet_qos_policy             = "default",
        mac_address_allocation_type     = "pool",
        mac_address_pool                = ["OCB-ESXi"],
        name                            = "MGMT-A",
        pci_order                       = 1,
        slot_id                         = "MLOM",
        switch_id                       = "A",
      },
      {
        cdn_source                      = "vnic",
        enable_failover                 = false,
        ethernet_adapter_policy         = "VMWare",
        ethernet_network_control_policy = "CDP-LLDP-ENABLE",
        ethernet_network_group_policy   = "ISCSI-BOOT-2_MGMT-B",
        ethernet_qos_policy             = "default",
        mac_address_allocation_type     = "pool",
        mac_address_pool                = ["OCB-ESXi"],
        name                            = "MGMT-B",
        pci_order                       = 2,
        slot_id                         = "MLOM",
        switch_id                       = "B",
      },
    ]
  }
  "ISCSI-BOOT" = {
    description                 = ""
    enable_azure_stack_host_qos = false
    iqn_allocation_type         = "None"
    iqn_pool                    = [""]
    iqn_static_identifier       = ""
    organization                = "UCS-DEMO2"
    vnic_placement_mode         = "auto"
    target_platform             = "FI-Attached"
    tags = [
      {
        key = "easyucs_origin",
        value = "convert",
      },
      {
        key = "easyucs_version",
        value = "0.9.8",
      },
    ]
    vnics = [
      {
        cdn_source                      = "vnic",
        enable_failover                 = false,
        ethernet_adapter_policy         = "VMWare",
        ethernet_network_control_policy = "CDP-LLDP-ENABLE",
        ethernet_qos_policy             = "default",
        mac_address_allocation_type     = "pool",
        mac_address_pool                = ["OCB-ESXi"],
        name                            = "DATA-A",
        pci_order                       = 7,
        slot_id                         = "MLOM",
        switch_id                       = "A",
      },
      {
        cdn_source                      = "vnic",
        enable_failover                 = false,
        ethernet_adapter_policy         = "VMWare",
        ethernet_network_control_policy = "CDP-LLDP-ENABLE",
        ethernet_qos_policy             = "default",
        mac_address_allocation_type     = "pool",
        mac_address_pool                = ["OCB-ESXi"],
        name                            = "DATA-B",
        pci_order                       = 10,
        slot_id                         = "MLOM",
        switch_id                       = "A",
      },
      {
        cdn_source                      = "vnic",
        enable_failover                 = false,
        ethernet_adapter_policy         = "VMWare",
        ethernet_network_control_policy = "CDP-LLDP-ENABLE",
        ethernet_network_group_policy   = "ISCSI-BOOT_ISCSI-A",
        ethernet_qos_policy             = "ISCSI_mtu9000",
        mac_address_allocation_type     = "pool",
        mac_address_pool                = ["ISCSI-A"],
        name                            = "ISCSI-A",
        pci_order                       = 2,
        slot_id                         = "MLOM",
        switch_id                       = "A",
      },
      {
        cdn_source                      = "vnic",
        enable_failover                 = false,
        ethernet_adapter_policy         = "VMWare",
        ethernet_network_control_policy = "CDP-LLDP-ENABLE",
        ethernet_network_group_policy   = "ISCSI-BOOT_ISCSI-B",
        ethernet_qos_policy             = "ISCSI_mtu9000",
        mac_address_allocation_type     = "pool",
        mac_address_pool                = ["ISCSI-B"],
        name                            = "ISCSI-B",
        pci_order                       = 4,
        slot_id                         = "MLOM",
        switch_id                       = "B",
      },
      {
        cdn_source                      = "vnic",
        enable_failover                 = false,
        ethernet_adapter_policy         = "VMWare",
        ethernet_network_control_policy = "CDP-LLDP-ENABLE",
        ethernet_network_group_policy   = "ISCSI-BOOT_MGMT-A",
        ethernet_qos_policy             = "default",
        mac_address_allocation_type     = "pool",
        mac_address_pool                = ["OCB-ESXi"],
        name                            = "MGMT-A",
        pci_order                       = 3,
        slot_id                         = "MLOM",
        switch_id                       = "A",
      },
      {
        cdn_source                      = "vnic",
        enable_failover                 = false,
        ethernet_adapter_policy         = "VMWare",
        ethernet_network_control_policy = "CDP-LLDP-ENABLE",
        ethernet_network_group_policy   = "ISCSI-BOOT_MGMT-B",
        ethernet_qos_policy             = "default",
        mac_address_allocation_type     = "pool",
        mac_address_pool                = ["OCB-ESXi"],
        name                            = "MGMT-B",
        pci_order                       = 5,
        slot_id                         = "MLOM",
        switch_id                       = "B",
      },
      {
        cdn_source                      = "vnic",
        enable_failover                 = false,
        ethernet_adapter_policy         = "default",
        ethernet_network_control_policy = "default",
        ethernet_network_group_policy   = "ISCSI-BOOT_data-1",
        ethernet_qos_policy             = "default",
        mac_address_allocation_type     = "pool",
        mac_address_pool                = ["OCB-ESXi"],
        name                            = "data-1",
        pci_order                       = 6,
        slot_id                         = "MLOM",
        switch_id                       = "A",
      },
      {
        cdn_source                      = "vnic",
        enable_failover                 = false,
        ethernet_adapter_policy         = "default",
        ethernet_network_control_policy = "default",
        ethernet_network_group_policy   = "ISCSI-BOOT_data-2",
        ethernet_qos_policy             = "default",
        mac_address_allocation_type     = "pool",
        mac_address_pool                = ["OCB-ESXi"],
        name                            = "data-2",
        pci_order                       = 8,
        slot_id                         = "MLOM",
        switch_id                       = "B",
      },
      {
        cdn_source                      = "vnic",
        enable_failover                 = false,
        ethernet_adapter_policy         = "VMWare",
        ethernet_network_control_policy = "CDP-LLDP-ENABLE",
        ethernet_qos_policy             = "default",
        mac_address_allocation_type     = "pool",
        mac_address_pool                = ["OCB-ESXi"],
        name                            = "DATA-A",
        pci_order                       = 7,
        slot_id                         = "MLOM",
        switch_id                       = "A",
      },
      {
        cdn_source                      = "vnic",
        enable_failover                 = false,
        ethernet_adapter_policy         = "VMWare",
        ethernet_network_control_policy = "CDP-LLDP-ENABLE",
        ethernet_qos_policy             = "default",
        mac_address_allocation_type     = "pool",
        mac_address_pool                = ["OCB-ESXi"],
        name                            = "DATA-B",
        pci_order                       = 10,
        slot_id                         = "MLOM",
        switch_id                       = "A",
      },
      {
        cdn_source                      = "vnic",
        enable_failover                 = false,
        ethernet_adapter_policy         = "VMWare",
        ethernet_network_control_policy = "CDP-LLDP-ENABLE",
        ethernet_network_group_policy   = "ISCSI-BOOT_ISCSI-A",
        ethernet_qos_policy             = "ISCSI_mtu9000",
        mac_address_allocation_type     = "pool",
        mac_address_pool                = ["OCB-ESXi"],
        name                            = "ISCSI-A",
        pci_order                       = 2,
        slot_id                         = "MLOM",
        switch_id                       = "A",
      },
      {
        cdn_source                      = "vnic",
        enable_failover                 = false,
        ethernet_adapter_policy         = "VMWare",
        ethernet_network_control_policy = "CDP-LLDP-ENABLE",
        ethernet_network_group_policy   = "ISCSI-BOOT_ISCSI-B",
        ethernet_qos_policy             = "ISCSI_mtu9000",
        mac_address_allocation_type     = "pool",
        mac_address_pool                = ["OCB-ESXi"],
        name                            = "ISCSI-B",
        pci_order                       = 4,
        slot_id                         = "MLOM",
        switch_id                       = "B",
      },
      {
        cdn_source                      = "vnic",
        enable_failover                 = false,
        ethernet_adapter_policy         = "VMWare",
        ethernet_network_control_policy = "CDP-LLDP-ENABLE",
        ethernet_network_group_policy   = "ISCSI-BOOT_MGMT-A",
        ethernet_qos_policy             = "default",
        mac_address_allocation_type     = "pool",
        mac_address_pool                = ["OCB-ESXi"],
        name                            = "MGMT-A",
        pci_order                       = 3,
        slot_id                         = "MLOM",
        switch_id                       = "A",
      },
      {
        cdn_source                      = "vnic",
        enable_failover                 = false,
        ethernet_adapter_policy         = "VMWare",
        ethernet_network_control_policy = "CDP-LLDP-ENABLE",
        ethernet_network_group_policy   = "ISCSI-BOOT_MGMT-B",
        ethernet_qos_policy             = "default",
        mac_address_allocation_type     = "pool",
        mac_address_pool                = ["OCB-ESXi"],
        name                            = "MGMT-B",
        pci_order                       = 5,
        slot_id                         = "MLOM",
        switch_id                       = "B",
      },
      {
        cdn_source                      = "vnic",
        enable_failover                 = false,
        ethernet_adapter_policy         = "VMWare",
        ethernet_network_control_policy = "default",
        ethernet_network_group_policy   = "ISCSI-BOOT_VMOTION-A",
        ethernet_qos_policy             = "default",
        mac_address_allocation_type     = "pool",
        mac_address_pool                = ["OCB-ESXi"],
        name                            = "VMOTION-A",
        pci_order                       = 11,
        slot_id                         = "MLOM",
        switch_id                       = "A",
      },
      {
        cdn_source                      = "vnic",
        enable_failover                 = false,
        ethernet_adapter_policy         = "VMWare",
        ethernet_network_control_policy = "default",
        ethernet_network_group_policy   = "ISCSI-BOOT_VMOTION-B",
        ethernet_qos_policy             = "default",
        mac_address_allocation_type     = "pool",
        mac_address_pool                = ["OCB-ESXi"],
        name                            = "VMOTION-B",
        pci_order                       = 12,
        slot_id                         = "MLOM",
        switch_id                       = "B",
      },
      {
        cdn_source                      = "vnic",
        enable_failover                 = false,
        ethernet_adapter_policy         = "default",
        ethernet_network_control_policy = "default",
        ethernet_network_group_policy   = "ISCSI-BOOT_VNIC-ADMIN",
        ethernet_qos_policy             = "default",
        mac_address_allocation_type     = "pool",
        mac_address_pool                = ["OCB-ESXi"],
        name                            = "VNIC-ADMIN",
        pci_order                       = 1,
        slot_id                         = "MLOM",
        switch_id                       = "A",
      },
      {
        cdn_source                      = "vnic",
        enable_failover                 = false,
        ethernet_adapter_policy         = "VMWare",
        ethernet_network_control_policy = "default",
        ethernet_network_group_policy   = "ISCSI-BOOT_VNIC-ADMIN-B",
        ethernet_qos_policy             = "default",
        mac_address_allocation_type     = "pool",
        mac_address_pool                = ["OCB-ESXi"],
        name                            = "VNIC-ADMIN-B",
        pci_order                       = 9,
        slot_id                         = "MLOM",
        switch_id                       = "B",
      },
    ]
  }
  "ESXI-VCF-WLD_LCP" = {
    description                 = ""
    enable_azure_stack_host_qos = false
    iqn_allocation_type         = "None"
    iqn_pool                    = [""]
    iqn_static_identifier       = ""
    organization                = "UCS-DEMO2"
    vnic_placement_mode         = "auto"
    target_platform             = "FI-Attached"
    tags = [
      {
        key = "easyucs_origin",
        value = "convert",
      },
      {
        key = "easyucs_version",
        value = "0.9.8",
      },
    ]
    vnics = [
      {
        enable_failover                 = false,
        ethernet_adapter_policy         = "VMWare",
        ethernet_network_control_policy = "default",
        ethernet_network_group_policy   = "ESXI-VCF-WLD_LCP_ETH0",
        ethernet_qos_policy             = "default_mtu9000",
        mac_address_allocation_type     = "pool",
        mac_address_pool                = ["OCB-ESXi"],
        name                            = "ETH0",
        pci_order                       = 1,
        slot_id                         = "MLOM",
        switch_id                       = "A",
      },
      {
        enable_failover                 = false,
        ethernet_adapter_policy         = "VMWare",
        ethernet_network_control_policy = "default",
        ethernet_network_group_policy   = "ESXI-VCF-WLD_LCP_ETH1",
        ethernet_qos_policy             = "default_mtu9000",
        mac_address_allocation_type     = "pool",
        mac_address_pool                = ["OCB-ESXi"],
        name                            = "ETH1",
        pci_order                       = 2,
        slot_id                         = "MLOM",
        switch_id                       = "B",
      },
      {
        enable_failover                 = false,
        ethernet_adapter_policy         = "default",
        ethernet_network_control_policy = "CDP-LLDP-ENABLE",
        ethernet_network_group_policy   = "ESXI-VCF-WLD_LCP_ETH2-iSCSI",
        ethernet_qos_policy             = "ISCSI_mtu9000",
        mac_address_allocation_type     = "pool",
        mac_address_pool                = ["OCB-ESXi"],
        name                            = "ETH2-iSCSI",
        pci_order                       = 3,
        slot_id                         = "MLOM",
        switch_id                       = "A",
      },
      {
        enable_failover                 = false,
        ethernet_adapter_policy         = "default",
        ethernet_network_control_policy = "CDP-LLDP-ENABLE",
        ethernet_network_group_policy   = "ESXI-VCF-WLD_LCP_ETH3-iSCSI",
        ethernet_qos_policy             = "ISCSI_mtu9000",
        mac_address_allocation_type     = "pool",
        mac_address_pool                = ["OCB-ESXi"],
        name                            = "ETH3-iSCSI",
        pci_order                       = 4,
        slot_id                         = "MLOM",
        switch_id                       = "B",
      },
    ]
  }
  "ESXI-VCF-WLD-FC_LCP" = {
    description                 = ""
    enable_azure_stack_host_qos = false
    iqn_allocation_type         = "None"
    iqn_pool                    = [""]
    iqn_static_identifier       = ""
    organization                = "UCS-DEMO2"
    vnic_placement_mode         = "auto"
    target_platform             = "FI-Attached"
    tags = [
      {
        key = "easyucs_origin",
        value = "convert",
      },
      {
        key = "easyucs_version",
        value = "0.9.8",
      },
    ]
    vnics = [
      {
        enable_failover                 = false,
        ethernet_adapter_policy         = "VMWare",
        ethernet_network_control_policy = "default",
        ethernet_network_group_policy   = "ESXI-VCF-WLD-FC_LCP_ETH0",
        ethernet_qos_policy             = "default_mtu9000",
        mac_address_allocation_type     = "pool",
        mac_address_pool                = ["OCB-ESXi"],
        name                            = "ETH0",
        pci_order                       = 1,
        slot_id                         = "MLOM",
        switch_id                       = "A",
      },
      {
        enable_failover                 = false,
        ethernet_adapter_policy         = "VMWare",
        ethernet_network_control_policy = "default",
        ethernet_network_group_policy   = "ESXI-VCF-WLD-FC_LCP_ETH1",
        ethernet_qos_policy             = "default_mtu9000",
        mac_address_allocation_type     = "pool",
        mac_address_pool                = ["OCB-ESXi"],
        name                            = "ETH1",
        pci_order                       = 3,
        slot_id                         = "MLOM",
        switch_id                       = "B",
      },
    ]
  }
  "ipvtest_LCP" = {
    description                 = ""
    enable_azure_stack_host_qos = false
    iqn_allocation_type         = "None"
    iqn_pool                    = [""]
    iqn_static_identifier       = ""
    organization                = "UCS-DEMO2"
    vnic_placement_mode         = "auto"
    target_platform             = "FI-Attached"
    tags = [
      {
        key = "easyucs_origin",
        value = "convert",
      },
      {
        key = "easyucs_version",
        value = "0.9.8",
      },
    ]
    vnics = [
      {
        enable_failover                 = false,
        ethernet_adapter_policy         = "default",
        ethernet_network_control_policy = "default",
        ethernet_network_group_policy   = "ipvtest_LCP_eth0",
        ethernet_qos_policy             = "default",
        mac_address_allocation_type     = "static",
        mac_address_static              = "12:34:56:78:90:AB",
        name                            = "eth0",
        pci_order                       = 1,
        slot_id                         = "MLOM",
        switch_id                       = "A",
      },
    ]
  }
  "test1_LCP" = {
    description                 = ""
    enable_azure_stack_host_qos = false
    iqn_allocation_type         = "None"
    iqn_pool                    = [""]
    iqn_static_identifier       = ""
    organization                = "UCS-DEMO2"
    vnic_placement_mode         = "auto"
    target_platform             = "FI-Attached"
    tags = [
      {
        key = "easyucs_origin",
        value = "convert",
      },
      {
        key = "easyucs_version",
        value = "0.9.8",
      },
    ]
    vnics = [
      {
        enable_failover                 = false,
        ethernet_adapter_policy         = "default",
        ethernet_network_control_policy = "default",
        ethernet_network_group_policy   = "test1_LCP_eth0",
        ethernet_qos_policy             = "default",
        mac_address_allocation_type     = "pool",
        mac_address_pool                = ["test"],
        name                            = "eth0",
        pci_order                       = 1,
        slot_id                         = "MLOM",
        switch_id                       = "A",
      },
    ]
  }
  "TEST-PLACEMENT_LCP" = {
    description                 = ""
    enable_azure_stack_host_qos = false
    iqn_allocation_type         = "None"
    iqn_pool                    = [""]
    iqn_static_identifier       = ""
    organization                = "UCS-DEMO2"
    vnic_placement_mode         = "auto"
    target_platform             = "FI-Attached"
    tags = [
      {
        key = "easyucs_origin",
        value = "convert",
      },
      {
        key = "easyucs_version",
        value = "0.9.8",
      },
    ]
    vnics = [
      {
        enable_failover                 = true,
        ethernet_adapter_policy         = "Linux",
        ethernet_network_control_policy = "default",
        ethernet_network_group_policy   = "TEST-PLACEMENT_LCP_vnic0",
        ethernet_qos_policy             = "default",
        mac_address_allocation_type     = "pool",
        mac_address_pool                = ["DEMO"],
        name                            = "vnic0",
        pci_order                       = 1,
        slot_id                         = "MLOM",
        switch_id                       = "A",
      },
    ]
  }
  "TEST-PLACEMENT-TEMPLATE_LCP" = {
    description                 = ""
    enable_azure_stack_host_qos = false
    iqn_allocation_type         = "None"
    iqn_pool                    = [""]
    iqn_static_identifier       = ""
    organization                = "UCS-DEMO2"
    vnic_placement_mode         = "auto"
    target_platform             = "FI-Attached"
    tags = [
      {
        key = "easyucs_origin",
        value = "convert",
      },
      {
        key = "easyucs_version",
        value = "0.9.8",
      },
    ]
    vnics = [
      {
        enable_failover                 = true,
        ethernet_adapter_policy         = "VMWare",
        ethernet_network_control_policy = "default",
        ethernet_network_group_policy   = "TEST-PLACEMENT-TEMPLATE_LCP_vnic0",
        ethernet_qos_policy             = "default",
        mac_address_allocation_type     = "pool",
        mac_address_pool                = ["DEMO"],
        name                            = "vnic0",
        pci_order                       = 2,
        slot_id                         = "MLOM",
        switch_id                       = "A",
      },
    ]
  }
}