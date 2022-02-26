#______________________________________________
#
# (DNS) Network Connectivity Policy Variables
#______________________________________________

network_connectivity_policies = {
  "dns" = {
    description        = "DNS Policy."
    dns_servers_v6     = []
    enable_dynamic_dns = false
    enable_ipv6        = true
    tags               = []
    update_domain      = ""
    dns_servers_v4 = [
      "208.67.220.220",
      "208.67.222.222"
    ]
    dns_servers_v6 = [
      "::",
      "::"
    ]
    tags = []
  }
}
