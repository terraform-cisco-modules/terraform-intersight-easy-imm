#__________________________________________________________
#
# Terraform Cloud Variables
#__________________________________________________________

# agent_pool        = "Richfield_Agents"
# terraform_version = "1.0.3"
# tfc_email         = "tyscott@cisco.com"
tfc_organization = "Cisco-Richfield-Lab"
# vcs_repo         = "scotttyso/terraform-intersight-easy-imm"
ws_pools = "Asgard_pools"
/*
  We highly recommend that for the terraform_cloud_token you use an environment variable for input:
  - export TF_VAR_terraform_cloud_token="abcdefghijklmnopqrstuvwxyz.0123456789"
  If you still want to move forward with it in this file, uncomment the line below, and input your value.
*/
# terraform_cloud_token = "value"
/*
  We highly recommend that for the tfc_oath_token you use an environment variable for input; Like:
  - export TF_VAR_tfc_oath_token="abcdefghijklmnopqrstuvwxyz.0123456789"
  If you still want to move forward with it in this file, uncomment the line below, and input your value.
*/
# tfc_oath_token = "value"


#__________________________________________________________
#
# Intersight Variables
#__________________________________________________________

/*
  We highly recommend that for the apikey you use an environment variable for input:
  - export TF_VAR_apikey="abcdefghijklmnopqrstuvwxyz.0123456789"
*/
# apikey = "value"

# endpoint     = "https://intersight.com"

organizations = ["Asgard"]

# secretkey    = "../../../../intersight.secret"
/*
  To export the Secret Key via an Environment Variable the format is as follows (Note: they are not quotation marks, but escape characters):
  - export TF_VAR_secretkey=`cat ../../intersight.secret`
  Either way will work in this case as we are not posting the contents of the file here.
*/

#__________________________________________________________
#
# Intersight Tags
#__________________________________________________________

tags = [{ key = "Module", value = "terraform-intersight-easy-imm" }, { key = "Owner", value = "tyscott" }]

#__________________________________________________________
#
# Intersight UCS Chassis Profiles - Variables
#__________________________________________________________

#______________________________________________
#
# UCS Chassis Profile Variables
#______________________________________________

ucs_chassis_templates = {
  "Asgard_5108" = {
    organization        = "Asgard"
    policies_imc_access = "Asgard_imc_chassis"
    policies_power      = "Asgard_power_5108"
    policies_snmp       = "Asgard_snmp_chassis"
    policies_thermal    = "Asgard_thermal_5108"
    target_platform     = "FIAttached"
  }
  "Asgard_9508" = {
    organization        = "Asgard"
    policies_imc_access = "Asgard_imc_chassis"
    policies_power      = "Asgard_power_9508"
    policies_snmp       = "Asgard_snmp_chassis"
    policies_thermal    = "Asgard_thermal_9508"
    target_platform     = "FIAttached"
  }
}

ucs_chassis_profiles = {
  FOX2308P6M7 = {
    action              = "No-op" # Options are {Delete|Deploy|Ready|No-op|Unassign}.
    assigned_chassis    = true
    description         = ""
    name                = "asgard-ucs-1"
    src_template        = "Asgard_5108"
    tags                = []
    wait_for_completion = false
  }
}


#__________________________________________________________
#
# Intersight UCS Chassis Policies - Variables
#__________________________________________________________

#______________________________________________
#
# IMC Access Policies
#______________________________________________

policies_imc_access = {
  "Asgard_imc_chassis" = {
    description  = ""
    imc_ip_pool  = "Asgard_ip_pool_1"
    inband_vlan  = 4
    ipv4_enable  = true
    ipv6_enable  = false
    organization = "Asgard"
    tags         = []
  }
}

#______________________________________________
#
# Power Policies
#______________________________________________

policies_power = {
  "Asgard_power_5108" = {
    allocated_budget    = 0
    description         = "Asgard 5108 Power Policy."
    organization        = "Asgard"
    power_profiling     = "Enabled"
    power_restore_state = "AlwaysOff"
    redundancy_mode     = "Grid"
    tags                = []
  }
  "Asgard_power_9508" = {
    allocated_budget    = 0
    description         = "Asgard X-Series Power Policy."
    organization        = "Asgard"
    power_profiling     = "Enabled"
    power_restore_state = "AlwaysOff"
    redundancy_mode     = "Grid"
    tags                = []
  }
}


#______________________________________________
#
# SNMP Policies
#______________________________________________

policies_snmp = {
  "Asgard_snmp" = {
    description                = ""
    enabled                    = true
    organization               = "Asgard"
    snmp_access                = "Full"
    snmp_engine_id             = ""
    snmp_port                  = 161
    snmp_user_1_auth_type      = "SHA"
    snmp_user_1_name           = "richuser"
    snmp_user_1_security_level = "AuthPriv"
    snmp_user_2_auth_type      = "SHA"
    snmp_user_2_name           = ""
    snmp_user_2_security_level = "AuthPriv"
    system_contact             = "Richfield Lab Admins: rich-lab@cisco.com"
    system_location            = "Richfield Ohio: Room 143, Rack 143D."
    tags                       = []
    snmp_trap_destinations = [
      {
        community    = ""
        destination  = "lnx1.rich.ciscolabs.com"
        enabled      = true
        port         = 162
        snmp_version = "V3"
        type         = "Trap"
        user         = "richuser"
      },
      {
        community    = ""
        destination  = "lnx2.rich.ciscolabs.com"
        enabled      = true
        port         = 162
        snmp_version = "V3"
        type         = "Trap"
        user         = "richuser"
      }
    ]
  }
}


#______________________________________________
#
# Thermal Policies
#______________________________________________

policies_thermal = {
  "Asgard_thermal_5108" = {
    description      = "Asgard 5108 Thermal Policy"
    fan_control_mode = "Balanced"
    organization     = "Asgard"
    tags             = []
  }
  "Asgard_thermal_9508" = {
    description      = "Asgard X-Serial 9508 Thermal Policy"
    fan_control_mode = "Acoustic"
    organization     = "Asgard"
    tags             = []
  }
}
