#______________________________________________
#
# Syslog Policy Variables
#______________________________________________

syslog_policies = {
  "syslog" = {
    description        = ""
    local_min_severity = "warning"
    remote_clients = [
      {
        enabled      = true
        hostname     = "lnx1.rich.ciscolabs.com"
        min_severity = "warning"
        port         = 514
        protocol     = "udp"
      },
      {
        enabled      = true
        hostname     = "lnx2.rich.ciscolabs.com"
        min_severity = "warning"
        port         = 514
        protocol     = "udp"
      }
    ]
    tags = []
  }
  "UCS-DEMO2_domain" = {
    description        = ""
    local_min_severity = "critical"
    remote_clients = [
      {
        enabled      = true
        hostname     = "10.60.7.122"
        min_severity = "informational"
        port         = 514
        protocol     = "udp"
      },
    ]
    tags = []
  }
}
