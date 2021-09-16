#______________________________________________
#
# Ethernet QoS Policy Variables
#______________________________________________

ethernet_qos_policies = {
  "#Organization#_MANAGEMENT_qos" = {
    burst                 = 10240
    description           = "Virtualization Managment Ethernet QoS."
    enable_trust_host_cos = false
    priority              = "Silver"
    mtu                   = 9000
    organization          = "#Organization#"
    rate_limit            = 0
    tags                  = []
  }
  "#Organization#_MIGRATION_qos" = {
    burst                 = 10240
    description           = "Virtualization Migration Ethernet QoS."
    enable_trust_host_cos = false
    priority              = "Bronze"
    mtu                   = 9000
    organization          = "#Organization#"
    rate_limit            = 0
    tags                  = []
  }
  "#Organization#_STORAGE_qos" = {
    burst                 = 10240
    description           = "Virtualization Storage Ethernet QoS."
    enable_trust_host_cos = false
    priority              = "Platinum"
    mtu                   = 9000
    organization          = "#Organization#"
    rate_limit            = 0
    tags                  = []
  }
  "#Organization#_Virtual_Machine_qos" = {
    burst                 = 10240
    description           = "Virtualization Virtual Machine Ethernet QoS."
    enable_trust_host_cos = false
    priority              = "Gold"
    mtu                   = 9000
    organization          = "#Organization#"
    rate_limit            = 0
    tags                  = []
  }
}
