#______________________________________________
#
# IPMI over LAN Policies
#______________________________________________

ipmi_over_lan_policies = {
  "Asgard_ipmi" = {
    description  = ""
    enabled      = true
    privilege    = "admin"
    organization = "Asgard"
    tags         = []
  }
  "IPMI-OSB3-DID" = {
    description  = ""
    enabled      = true
    ipmi_key     = null
    organization = "UCS-DEMO2"
    privilege    = "admin"
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
