#______________________________________________
#
# SNMP Policies
#______________________________________________

snmp_policies = {
  "snmp" = {
    description            = "SNMP Policy."
    enable_snmp            = false
    snmp_community_access  = "Full"
    snmp_engine_input_id   = ""
    snmp_port              = 161
    system_contact         = ""
    system_location        = ""
    snmp_trap_destinations = {}
    snmp_users             = {}
    tags                   = []
  }
}
