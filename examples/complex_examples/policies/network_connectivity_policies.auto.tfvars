#______________________________________________
#
# (DNS) Network Connectivity Policy Variables
#______________________________________________

network_connectivity_policies = {
  "dns" = {
    description        = ""
    dns_servers_v6     = []
    enable_dynamic_dns = false
    enable_ipv6        = false
    tags               = []
    update_domain      = ""
    dns_servers_v4 = [
      "10.101.128.15",
      "10.101.128.16"
    ]
  }
  "UCS-DEMO2" = {
    description        = ""
    enable_dynamic_dns = false
    enable_ipv6        = true
    update_domain      = ""
    dns_servers_v4 = [
      "1.2.3.4",
      "144.254.71.184"
    ]
    dns_servers_v6 = [
      "2001:420:44f0::1",
      "::"
    ]
    tags = []
  }
}
