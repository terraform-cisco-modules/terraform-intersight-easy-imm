#______________________________________________
#
# MAC Pool Variables
#______________________________________________

mac_pools = {
  "Fabric_A" = {
    assignment_order = "sequential"
    mac_blocks = [
      {
        from = "00:25:B5:0A:00:00"
        to   = "00:25:B5:0A:00:FF"
      }
    ]
  }
  "Fabric_B" = {
    assignment_order = "sequential"
    mac_blocks = [
      {
        from = "00:25:B5:0B:00:00"
        to   = "00:25:B5:0B:00:FF"
      }
    ]
  }
}
