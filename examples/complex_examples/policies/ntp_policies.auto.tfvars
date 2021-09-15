#______________________________________________
#
# NTP Policy Variables
#______________________________________________

ntp_policies = {
  "Asgard_ntp" = {
    description  = ""
    enabled      = true
    organization = "Asgard"
    tags         = []
    timezone     = "America/New_York"
    ntp_servers = [
      "10.101.128.15",
      "10.101.128.16"
    ]
  }
  "UCS-DEMO2" = {
    description  = ""
    enabled      = true
    organization = "UCS-DEMO2"
    timezone     = "Europe/Paris"
    ntp_servers = [
      "ntp.esl.cisco.com",
    ]
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
