#______________________________________________
#
# NTP Policy Variables
#______________________________________________

ntp_policies = {
  "#Organization#_ntp" = {
    description  = "#Organization# NTP Policy."
    enabled      = true
    organization = "#Organization#"
    tags         = []
    timezone     = "America/New_York"
    # Supported Timezone List - https://github.com/terraform-cisco-modules/terraform-intersight-imm/tree/master/modules/ntp_policies
    ntp_servers = [
      "0.north-america.pool.ntp.org",
      "1.north-america.pool.ntp.org"
    ]
  }
}
