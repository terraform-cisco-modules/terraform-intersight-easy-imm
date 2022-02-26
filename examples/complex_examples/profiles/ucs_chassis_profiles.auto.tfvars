#__________________________________________________________
#
# UCS Chassis Profile Variables
#__________________________________________________________

ucs_chassis_profiles = {
  asgard-ucs-1 = {
    action              = "No-op" # Options are {Delete|Deploy|Ready|No-op|Unassign}.
    assign_chassis      = true
    description         = ""
    imc_access_policy   = "imc"
    power_policy        = "5108"
    snmp_policy         = "snmp"
    serial_number       = ""
    tags                = []
    target_platform     = "FIAttached"
    thermal_policy      = "5108"
    wait_for_completion = false
  }
}

