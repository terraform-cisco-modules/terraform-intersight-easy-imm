#______________________________________________
#
# Fibre Channel WWPN Pools
#______________________________________________

wwpn_pools = {
  "wwpn_pool_a" = {
    assignment_order = "sequential"
    # id_blocks = [] # Accepting the Default Values
  }
  "wwpn_pool_b" = {
    assignment_order = "sequential"
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
        from = "20:00:00:25:B5:11:AA:00"
        to   = "20:00:00:25:B5:11:AA:FF"
      }
    ]
    tags = []
  }
  "DEMO-SAN-B" = {
    id_blocks = [
      {
        from = "20:00:00:25:B5:11:BB:00"
        to   = "20:00:00:25:B5:11:BB:FF"
      }
    ]
    tags = []
  }
  "PN-ESXi-OCB-A" = {
    id_blocks = [
      {
        from = "20:0A:00:25:B5:00:20:06"
        to   = "20:0A:00:25:B5:00:20:FF"
      }
    ]
    tags = []
  }
  "PN-ESXi-OCB-B" = {
    id_blocks = [
      {
        from = "20:0B:00:25:B5:00:20:06"
        to   = "20:0B:00:25:B5:00:20:FF"
      }
    ]
    tags = []
  }
}
