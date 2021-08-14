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
