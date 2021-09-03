#______________________________________________
#
# SAN Connectivity Policies
#______________________________________________

san_connectivity_policies = {
  "aaa_SCP" = {
    description          = ""
    organization         = "UCS-DEMO2"
    target_platform      = "FI-Attached"
    vhba_placement_mode  = "auto"
    wwnn_allocation_type = "pool"
    wwnn_static          = ""
    wwnn_pool            = ["DEMO"]
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
    vhbas = [
      {
        fibre_channel_adapter_policy = "default",
        fibre_channel_network_policy = "aaa_SCP_fc0",
        fibre_channel_qos_policy     = "default",
        name                         = "fc0",
        pci_order                    = 3,
        slot_id                      = "MLOM",
        switch_id                    = "A",
        wwpn_allocation_type         = "pool",
        wwpn_pool                    = "DEMO-SAN-A",
      },
      {
        fibre_channel_adapter_policy = "default",
        fibre_channel_network_policy = "aaa_SCP_fc1",
        fibre_channel_qos_policy     = "default",
        name                         = "fc1",
        pci_order                    = 5,
        slot_id                      = "MLOM",
        switch_id                    = "B",
        wwpn_allocation_type         = "pool",
        wwpn_pool                    = "DEMO-SAN-B",
      },
    ]
  }
  "ESXi-OCB" = {
    description          = ""
    organization         = "UCS-DEMO2"
    target_platform      = "FI-Attached"
    vhba_placement_mode  = "auto"
    wwnn_allocation_type = "pool"
    wwnn_static          = ""
    wwnn_pool            = ["NN-ESXi-OCB"]
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
    vhbas = [
      {
        fibre_channel_adapter_policy = "VMWare",
        fibre_channel_network_policy = "ESXi-OCB_SAN-A",
        fibre_channel_qos_policy     = "default",
        name                         = "SAN-A",
        pci_order                    = 2,
        slot_id                      = "MLOM",
        switch_id                    = "A",
        wwpn_allocation_type         = "pool",
        wwpn_pool                    = "PN-ESXi-OCB-A",
      },
      {
        fibre_channel_adapter_policy = "VMWare",
        fibre_channel_network_policy = "ESXi-OCB_SAN-B",
        fibre_channel_qos_policy     = "default",
        name                         = "SAN-B",
        pci_order                    = 4,
        slot_id                      = "MLOM",
        switch_id                    = "B",
        wwpn_allocation_type         = "pool",
        wwpn_pool                    = "PN-ESXi-OCB-B",
      },
    ]
  }
  "TEST-PLACEMENT_SCP" = {
    description          = ""
    organization         = "UCS-DEMO2"
    target_platform      = "FI-Attached"
    vhba_placement_mode  = "auto"
    wwnn_allocation_type = "pool"
    wwnn_static          = ""
    wwnn_pool            = ["DEMO"]
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
    vhbas = [
      {
        fibre_channel_adapter_policy = "Linux",
        fibre_channel_network_policy = "TEST-PLACEMENT_SCP_vhba0",
        fibre_channel_qos_policy     = "default",
        name                         = "vhba0",
        pci_order                    = 2,
        slot_id                      = "MLOM",
        switch_id                    = "A",
        wwpn_allocation_type         = "pool",
        wwpn_pool                    = "DEMO-SAN-A",
      },
    ]
  }
  "TEST-PLACEMENT-TEMPLATE_SCP" = {
    description          = ""
    organization         = "UCS-DEMO2"
    target_platform      = "FI-Attached"
    vhba_placement_mode  = "auto"
    wwnn_allocation_type = "pool"
    wwnn_static          = ""
    wwnn_pool            = ["DEMO"]
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
    vhbas = [
      {
        fibre_channel_adapter_policy = "VMWare",
        fibre_channel_network_policy = "TEST-PLACEMENT-TEMPLATE_SCP_vhba0",
        fibre_channel_qos_policy     = "default",
        name                         = "vhba0",
        pci_order                    = 1,
        slot_id                      = "MLOM",
        switch_id                    = "A",
        wwpn_allocation_type         = "pool",
        wwpn_pool                    = "DEMO-SAN-A",
      },
    ]
  }
}