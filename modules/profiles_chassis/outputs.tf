#__________________________________________________________
#
# UCS Chassis Profile Outputs
#__________________________________________________________

output "ucs_chassis_profiles" {
  description = "moid of the UCS Chassis Profiles."
  value = {
    for v in sort(keys(module.ucs_chassis_profiles)) : v => {
      moid = module.ucs_chassis_profiles[v].moid
      name = module.ucs_chassis_profiles[v].name
    }
  }
}


#__________________________________________________________
#
# UCS Chassis Moid
#__________________________________________________________

output "physical_chassis" {
  description = "Moid of the Physical Chassis in the Account."
  value = {
    for v in sort(keys(data.intersight_equipment_chassis.chassis)) : v => {
      moid  = data.intersight_equipment_chassis.chassis[v].results[0].moid
      model = data.intersight_equipment_chassis.chassis[v].results[0].model
      name  = data.intersight_equipment_chassis.chassis[v].results[0].name
    }
  }
}

#__________________________________________________________
#
# IMC Access Policy Outputs
#__________________________________________________________

output "policies_imc_access" {
  value = {
    for v in sort(keys(module.policies_imc_access)) : v => module.policies_imc_access[v].moid
    if v != null
  }
}


#__________________________________________________________
#
# Power Policy Outputs
#__________________________________________________________

output "policies_power" {
  value = {
    for v in sort(keys(module.policies_power)) : v => module.policies_power[v].moid
    if v != null
  }
}


#__________________________________________________________
#
# SNMP Policy Outputs
#__________________________________________________________

output "policies_snmp" {
  value = {
    for v in sort(keys(module.policies_snmp)) : v => module.policies_snmp[v].moid
    if v != null
  }
}

output "policies_snmp_1_user" {
  value = {
    for v in sort(keys(module.policies_snmp_1_user)) : v => module.policies_snmp_1_user[v].moid
    if v != null
  }
}

output "policies_snmp_2_users" {
  value = {
    for v in sort(keys(module.policies_snmp_2_users)) : v => module.policies_snmp_2_users[v].moid
    if v != null
  }
}


#__________________________________________________________
#
# Thermal Policy Outputs
#__________________________________________________________

output "policies_thermal" {
  value = {
    for v in sort(keys(module.policies_thermal)) : v => module.policies_thermal[v].moid
    if v != null
  }
}


