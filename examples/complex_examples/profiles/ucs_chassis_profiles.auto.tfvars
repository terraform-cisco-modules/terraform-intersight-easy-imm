#__________________________________________________________
#
# UCS Chassis Profile Variables
#__________________________________________________________

ucs_chassis_profiles = {
  asgard-ucs-1 = {
    action              = "No-op" # Options are {Delete|Deploy|Ready|No-op|Unassign}.
    assign_chassis      = true
    description         = ""
    imc_access_policy   = "Asgard_imc"
    organization        = "Asgard"
    power_policy        = "Asgard_power_5108"
    snmp_policy         = "Asgard_snmp"
    serial_number       = "FOX2308P6M7"
    tags                = []
    target_platform     = "FIAttached"
    thermal_policy      = "Asgard_thermal_5108"
    wait_for_completion = false
  }
}

