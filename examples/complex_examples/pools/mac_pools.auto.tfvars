#______________________________________________
#
# MAC Pool Variables
#______________________________________________

mac_pools = {
  "mac_pool_a" = {
    assignment_order = "sequential"
    # mac_blocks = [] # Accepting Default MAC Block
  }
  "mac_pool_b" = {
    assignment_order = "sequential"
    mac_blocks = [
      {
        from = "00:25:B5:0b:00:00"
        to   = "00:25:B5:0b:00:ff"
      }
    ]
  }
  "DEMO" = {
    mac_blocks = [
      {
        from = "00:25:B5:11:C1:00"
        to   = "00:25:B5:11:C1:FF"
      }
    ]
    tags = []
  }
  "ISCSI-A" = {
    mac_blocks = [
      {
        from = "00:25:B5:00:0A:08"
        to   = "00:25:B5:00:0A:11"
      }
    ]
    tags = []
  }
  "ISCSI-B" = {
    mac_blocks = [
      {
        from = "00:25:B5:00:0B:08"
        to   = "00:25:B5:00:0B:11"
      }
    ]
    tags = []
  }
  "OCB-ESXi" = {
    mac_blocks = [
      {
        from = "00:25:B5:00:00:00"
        to   = "00:25:B5:00:01:F3"
      }
    ]
    tags = []
  }
  "test" = {
    mac_blocks = [
      {
        from = "00:25:B5:FF:FF:00"
        to   = "00:25:B5:FF:FF:03"
      }
    ]
    tags = []
  }
}
