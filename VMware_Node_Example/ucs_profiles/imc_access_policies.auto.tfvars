#______________________________________________
#
# IMC Access Policies
#______________________________________________

imc_access_policies = {
  "#Organization#_imc_access" = {
    description                = ""
    inband_ip_pool             = "#Organization#_ip_pool"
    inband_vlan_id             = 4
    ipv4_address_configuration = true
    ipv6_address_configuration = false
    organization               = "#Organization#"
    tags                       = []
  }
}
