#______________________________________________
#
# NTP Policy Variables
#______________________________________________

ntp_policies = {
  "ntp" = {
    description = ""
    enabled     = true
    tags        = []
    timezone    = "America/New_York"
    ntp_servers = [
      "10.101.128.15",
      "10.101.128.16"
    ]
  }
  "UCS-DEMO2" = {
    description = ""
    enabled     = true
    timezone    = "Europe/Paris"
    ntp_servers = [
      "ntp.esl.cisco.com",
    ]
    tags = []
  }
}
