#__________________________________________________________
#
# UCS Chassis Profile Variables
#__________________________________________________________

ucs_chassis_profiles = {
  "#Organization#_chassis" = {
    action              = "No-op" # Options are {Delete|Deploy|Ready|No-op|Unassign}.
    assign_chassis      = false
    description         = "#Organization# Chassis Profile Example."
    imc_access_policy   = "#Organization#_imc_access"
    organization        = "#Organization#"
    power_policy        = "#Organization#_power_9508"
    snmp_policy         = "#Organization#_snmp"
    serial_number       = ""
    tags                = []
    target_platform     = "FIAttached"
    thermal_policy      = "#Organization#_9508"
    wait_for_completion = false
  }
}

