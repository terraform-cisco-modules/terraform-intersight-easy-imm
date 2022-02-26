#______________________________________________
#
# IP Pool Variables
#______________________________________________

ip_pools = {
  "ip_pool" = {
    assignment_order = "sequential"
    ipv4_block = [
      {
        from = "198.18.0.32"
        to   = "198.18.0.63"
      },
    ]
    ipv4_config = {
      config = {
        gateway       = "198.18.0.1"
        netmask       = "255.255.255.0"
        primary_dns   = "208.67.220.220"
        secondary_dns = "208.67.222.222"
      }
    }
    ipv6_block  = []
    ipv6_config = {}
    tags        = []
  }
}
