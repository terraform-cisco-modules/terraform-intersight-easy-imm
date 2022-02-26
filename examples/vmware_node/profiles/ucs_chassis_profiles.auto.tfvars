#__________________________________________________________
#
# UCS Chassis Profile Variables
#__________________________________________________________

ucs_chassis_profiles = {
  "#chassis_profile#" = {
    action              = "No-op" # Options are {Deploy|No-op|Unassign}.
    assign_chassis      = false
    description         = "Chassis Profile Example."
    imc_access_policy   = "imc_access"
    power_policy        = "power_9508"
    snmp_policy         = "snmp"
    serial_number       = ""
    tags                = []
    target_platform     = "FIAttached"
    thermal_policy      = "9508"
    wait_for_completion = false
  }
}

