#______________________________________________
#
# System QoS
#______________________________________________

system_qos_policies = {
  "UCS-DEMO2" = {
    classes = [
      {
        admin_state        = "Disabled"
        bandwidth_percent  = 0
        cos                = 1
        mtu                = 1500
        multicast_optimize = false
        name               = "Bronze"
        packet_drop        = true
        weight             = 7
      },
      {
        admin_state        = "Disabled"
        bandwidth_percent  = 0
        cos                = 4
        mtu                = 1500
        multicast_optimize = false
        name               = "Gold"
        packet_drop        = true
        weight             = 9
      },
      {
        admin_state        = "Enabled"
        bandwidth_percent  = 40
        cos                = 5
        mtu                = 2240
        multicast_optimize = false
        name               = "Platinum"
        packet_drop        = false
        weight             = 10
      },
      {
        admin_state        = "Disabled"
        bandwidth_percent  = 0
        cos                = 2
        mtu                = 1500
        multicast_optimize = false
        name               = "Silver"
        packet_drop        = true
        weight             = 8
      },
      {
        admin_state        = "Enabled"
        bandwidth_percent  = 40
        cos                = 3
        mtu                = 2240
        multicast_optimize = false
        name               = "FC"
        packet_drop        = false
        weight             = 10
      },
      {
        admin_state        = "Enabled"
        bandwidth_percent  = 20
        cos                = 255
        mtu                = 1500
        multicast_optimize = false
        name               = "Best Effort"
        packet_drop        = true
        weight             = 5
      },
    ]
    description  = ""
    organization = "UCS-DEMO2"
    tags = [
      {
        key = "easyucs_origin",
        value = "convert",
      },
      {
        key = "easyucs_version",
        value = "0.9.8",
      },
    ]
  }
}