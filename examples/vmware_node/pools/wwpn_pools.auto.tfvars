#______________________________________________
#
# Fibre Channel WWPN Pools
#______________________________________________

wwpn_pools = {
  "#Organization#_WWPN_Fabric_A" = {
    assignment_order = "sequential"
    organization     = "#Organization#"
    id_blocks = [
      {
        from = "20:00:00:25:B5:0a:00:00"
        to   = "20:00:00:25:B5:0a:00:ff"
      }
    ]
  }
  "#Organization#_WWPN_Fabric_A" = {
    assignment_order = "sequential"
    organization     = "#Organization#"
    id_blocks = [
      {
        from = "20:00:00:25:B5:0b:00:00"
        to   = "20:00:00:25:B5:0b:00:ff"
      }
    ]
  }
}
