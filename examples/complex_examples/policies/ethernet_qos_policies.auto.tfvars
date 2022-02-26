#______________________________________________
#
# Ethernet (vNIC) QoS Policies
#______________________________________________

ethernet_qos_policies = {
  "1Gb-bronze" = {
    burst                 = 10240
    description           = ""
    enable_trust_host_cos = false
    priority              = "Best Effort"
    mtu                   = 1500
    rate_limit            = 1000
    tags                  = []
  }
  "5Gb-platinum" = {
    burst                 = 10240
    description           = ""
    enable_trust_host_cos = false
    priority              = "Platinum"
    mtu                   = 1500
    rate_limit            = 5000
    tags                  = []
  }
  "100Mb" = {
    burst                 = 10240
    description           = ""
    enable_trust_host_cos = false
    priority              = "Best Effort"
    mtu                   = 1500
    rate_limit            = 100
    tags                  = []
  }
  "ISCSI" = {
    burst                 = 10240
    description           = ""
    enable_trust_host_cos = false
    priority              = "Platinum"
    mtu                   = 1500
    rate_limit            = 0
    tags                  = []
  }
  "default" = {
    burst                 = 10240
    description           = ""
    enable_trust_host_cos = false
    priority              = "Best Effort"
    mtu                   = 1500
    rate_limit            = 0
    tags                  = []
  }
  "ISCSI_mtu9000" = {
    burst                 = 10240
    description           = ""
    enable_trust_host_cos = false
    priority              = "Platinum"
    mtu                   = 9000
    rate_limit            = 0
    tags                  = []
  }
  "default_mtu9000" = {
    burst                 = 10240
    description           = ""
    enable_trust_host_cos = false
    priority              = "Best Effort"
    mtu                   = 9000
    rate_limit            = 0
    tags                  = []
  }
}
