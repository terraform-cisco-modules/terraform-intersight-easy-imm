#______________________________________________
#
# Switch Control Policy Variables
#______________________________________________

switch_control_policies = {
  "UCS-DEMO2" = {
    description                  = ""
    mac_address_table_aging      = "Custom"
    mac_aging_time               = 14500
    udld_message_interval        = 15
    udld_recovery_action         = "reset"
    vlan_port_count_optimization = false
    tags                         = []
  }
}
