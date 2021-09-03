#______________________________________________
#
# Fibre Channel WWPN Pools
#______________________________________________

wwpn_pools = {
  Asgard_wwpn_pool_a = {
    assignment_order = "sequential"
    organization     = "Asgard"
    # id_blocks = [] # Accepting the Default Values
  }
  Asgard_wwpn_pool_b = {
    assignment_order = "sequential"
    organization     = "Asgard"
    id_blocks = [
      {
        from = "20:00:00:25:B5:0b:00:00"
        to   = "20:00:00:25:B5:0b:00:ff"
      }
    ]
  }
  "DEMO-SAN-A" = {
    id_blocks = [
      {
        from = "20:00:00:25:B5:11:AA:00",
        to   = "20:00:00:25:B5:11:AA:FF",
      },
    ]
    organization = "UCS-DEMO2"
    pool_purpose = "WWPN"
    tags = [
      {
        key   = "easyucs_origin",
        value = "convert",
      },
      {
        key   = "easyucs_version",
        value = "0.9.8",
      },
    ]
  }
  "DEMO-SAN-B" = {
    id_blocks = [
      {
        from = "20:00:00:25:B5:11:BB:00",
        to   = "20:00:00:25:B5:11:BB:FF",
      },
    ]
    organization = "UCS-DEMO2"
    pool_purpose = "WWPN"
    tags = [
      {
        key   = "easyucs_origin",
        value = "convert",
      },
      {
        key   = "easyucs_version",
        value = "0.9.8",
      },
    ]
  }
  "PN-ESXi-OCB-A" = {
    id_blocks = [
      {
        from = "20:0A:00:25:B5:00:20:06",
        to   = "20:0A:00:25:B5:00:20:FF",
      },
    ]
    organization = "UCS-DEMO2"
    pool_purpose = "WWPN"
    tags = [
      {
        key   = "easyucs_origin",
        value = "convert",
      },
      {
        key   = "easyucs_version",
        value = "0.9.8",
      },
    ]
  }
  "PN-ESXi-OCB-B" = {
    id_blocks = [
      {
        from = "20:0B:00:25:B5:00:20:06",
        to   = "20:0B:00:25:B5:00:20:FF",
      },
    ]
    organization = "UCS-DEMO2"
    pool_purpose = "WWPN"
    tags = [
      {
        key   = "easyucs_origin",
        value = "convert",
      },
      {
        key   = "easyucs_version",
        value = "0.9.8",
      },
    ]
  }
}
