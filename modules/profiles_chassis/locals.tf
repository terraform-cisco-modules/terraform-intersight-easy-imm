#__________________________________________________________
#
# Local Variables Section
#__________________________________________________________

locals {
  # Intersight Organization Variables
  organizations = var.organizations
  org_moids = {
    for v in sort(keys(data.intersight_organization_organization.org_moid)) : v => {
      moid = data.intersight_organization_organization.org_moid[v].results[0].moid
    }
  }

  # Tags for Deployment
  tags = var.tags

  # Terraform Cloud Remote Resources
  ip_pools = data.terraform_remote_state.pools.outputs.ip_pools

  #______________________________________________
  #
  # UCS Domain Variables
  #______________________________________________
  ucs_chassis_profiles = {
    for k, v in var.ucs_chassis_profiles : k =>
    {
      for key, value in var.ucs_chassis_templates : "profile" =>
      {
        action                = (v.action != null ? v.action : "No-op")
        assigned_chassis      = (v.assigned_chassis != null ? v.assigned_chassis : false)
        description           = (v.description != null ? v.description : "")
        name                  = (v.name != null ? v.name : "")
        organization          = (value.organization != null ? value.organization : "default")
        policies_imc_access   = (value.policies_imc_access != null ? value.policies_imc_access : "")
        policies_power        = (value.policies_power != null ? value.policies_power : "")
        policies_snmp         = (value.policies_snmp != null ? value.policies_snmp : "")
        policies_snmp_1_user  = (value.policies_snmp_1_user != null ? value.policies_snmp_1_user : "")
        policies_snmp_2_users = (value.policies_snmp_2_users != null ? value.policies_snmp_2_users : "")
        policies_thermal      = (value.policies_thermal != null ? value.policies_thermal : "")
        tags                  = (v.tags != null ? v.tags : [])
        target_platform       = (value.target_platform != null ? value.target_platform : "FIAttached")
        wait_for_completion   = (v.wait_for_completion != null ? v.wait_for_completion : false)
      } if v.src_template == key
    }
  }


  #__________________________________________________________
  #
  # IMC Access Policy Section Locals
  #__________________________________________________________

  policies_imc_access = {
    for k, v in var.policies_imc_access : k => {
      description  = (v.description != null ? v.description : "")
      inband_vlan  = (v.inband_vlan != null ? v.inband_vlan : 1)
      imc_ip_pool  = (v.imc_ip_pool != null ? v.imc_ip_pool : "")
      ipv4_enable  = (v.ipv4_enable != null ? v.ipv4_enable : true)
      ipv6_enable  = (v.ipv6_enable != null ? v.ipv6_enable : false)
      organization = (v.organization != null ? v.organization : "default")
      tags         = (v.tags != null ? v.tags : [])
    }
  }


  #__________________________________________________________
  #
  # Power Policy Section Locals
  #__________________________________________________________

  policies_power = {
    for k, v in var.policies_power : k => {
      allocated_budget    = (v.allocated_budget != null ? v.allocated_budget : 0)
      description         = (v.description != null ? v.description : "")
      organization        = (v.organization != null ? v.organization : "default")
      power_profiling     = (v.power_profiling != null ? v.power_profiling : "Enabled")
      power_restore_state = (v.power_restore_state != null ? v.power_restore_state : "LastState")
      tags                = (v.tags != null ? v.tags : [])
      redundancy_mode     = (v.redundancy_mode != null ? v.redundancy_mode : "Grid")
    }
  }


  #__________________________________________________________
  #
  # SNMP Policy Section Locals
  #__________________________________________________________

  policies_snmp = {
    for k, v in var.policies_snmp : k => {
      description                = (v.description != null ? v.description : "")
      enabled                    = (v.enabled != null ? v.enabled : true)
      organization               = (v.organization != null ? v.organization : "default")
      snmp_access                = (v.snmp_access != null ? v.snmp_access : "Full")
      snmp_engine_id             = (v.snmp_engine_id != null ? v.snmp_engine_id : "")
      snmp_port                  = (v.snmp_port != null ? v.snmp_port : 161)
      snmp_trap_destinations     = (v.snmp_trap_destinations != null ? v.snmp_trap_destinations : [])
      snmp_user_1_auth_type      = (v.snmp_user_1_auth_type != null ? v.snmp_user_1_auth_type : "SHA")
      snmp_user_1_name           = (v.snmp_user_1_name != null ? v.snmp_user_1_name : "")
      snmp_user_1_security_level = (v.snmp_user_1_security_level != null ? v.snmp_user_1_security_level : "AuthPriv")
      snmp_user_2_auth_type      = (v.snmp_user_2_auth_type != null ? v.snmp_user_2_auth_type : "SHA")
      snmp_user_2_name           = (v.snmp_user_2_name != null ? v.snmp_user_2_name : "")
      snmp_user_2_security_level = (v.snmp_user_2_security_level != null ? v.snmp_user_2_security_level : "AuthPriv")
      system_contact             = (v.system_contact != null ? v.system_contact : "")
      system_location            = (v.system_location != null ? v.system_location : "")
      tags                       = (v.tags != null ? v.tags : [])
    }
  }


  #__________________________________________________________
  #
  # Thermal Policy Section Locals
  #__________________________________________________________

  policies_thermal = {
    for k, v in var.policies_thermal : k => {
      description      = (v.description != null ? v.description : "")
      fan_control_mode = (v.fan_control_mode != null ? v.fan_control_mode : "Balanced")
      organization     = (v.organization != null ? v.organization : "default")
      tags             = (v.tags != null ? v.tags : [])
    }
  }
}
