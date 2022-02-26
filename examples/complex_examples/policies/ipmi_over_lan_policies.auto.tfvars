#______________________________________________
#
# IPMI over LAN Policies
#______________________________________________

ipmi_over_lan_policies = {
  "ipmi" = {
    description = ""
    enabled     = true
    privilege   = "admin"
    tags        = []
  }
  "IPMI-OSB3-DID" = {
    description = ""
    enabled     = true
    ipmi_key    = null
    privilege   = "admin"
    tags        = []
  }
}
