#______________________________________________
#
# NTP Policy Variables
#______________________________________________

ntp_policies = {
  "ntp" = {
    description = "NTP Policy."
    enabled     = true
    tags        = []
    timezone    = "America/New_York"
    ntp_servers = [
      "0.north-america.pool.ntp.org",
      "1.north-america.pool.ntp.org"
    ]
  }
}
