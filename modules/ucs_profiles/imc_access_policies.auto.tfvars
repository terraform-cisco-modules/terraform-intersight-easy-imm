#______________________________________________
#
# IMC Access Policies
#______________________________________________

imc_access_policies = {
  "Asgard_imc_access" = {
    description                = ""
    inband_ip_pool             = "Asgard_ip_pool_1"
    inband_vlan_id             = 4
    ipv4_address_configuration = true
    ipv6_address_configuration = false
    organization               = "Asgard"
    tags                       = []
  }
  "ADMIN_inband" = {
    description                = ""
    inband_ip_pool             = "inband"
    inband_vlan_id             = "100"
    ipv4_address_configuration = true
    ipv6_address_configuration = false
    organization               = "UCS-DEMO2"
    tags = [
      {
        key   = "easyucs_origin",
        value = "convert",
      },
      {
        key   = "easyucs_version",
        value = "0.9.8",
      },
    ]
  }
}
