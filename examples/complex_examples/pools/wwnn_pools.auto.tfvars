#______________________________________________
#
# Fibre Channel WWNN Pools
#______________________________________________

wwnn_pools = {
  "wwnn_pool" = {
    assignment_order = "sequential"
    pool_purpose     = "WWNN"
    id_blocks = [
      {
        from = "20:00:00:25:B5:0c:00:00"
        to   = "20:00:00:25:B5:0c:00:ff"
      }
    ]
  }
  "DEMO" = {
    id_blocks = [
      {
        from = "20:00:00:25:B5:11:CC:00"
        to   = "20:00:00:25:B5:11:CC:FF"
      }
    ]
    tags = [
      {
        key   = "easyucs_origin"
        value = "convert"
      },
      {
        key   = "easyucs_version"
        value = "0.9.8"
      }
    ]
  }
  "NN-ESXi-OCB" = {
    id_blocks = [
      {
        from = "20:00:00:25:B5:00:10:00"
        to   = "20:00:00:25:B5:00:10:09"
      }
    ]
    tags = []
  }
}
