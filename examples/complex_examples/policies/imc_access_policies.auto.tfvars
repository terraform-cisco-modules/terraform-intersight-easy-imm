#______________________________________________
#
# IMC Access Policies
#______________________________________________

imc_access_policies = {
  "imc_access" = {
    description                = ""
    inband_ip_pool             = "ip_pool_1"
    inband_vlan_id             = 4
    ipv4_address_configuration = true
    ipv6_address_configuration = false
    tags                       = []
  }
  "ADMIN_inband" = {
    description                = ""
    inband_ip_pool             = "inband"
    inband_vlan_id             = "100"
    ipv4_address_configuration = true
    ipv6_address_configuration = false
    tags                       = []
  }
}
