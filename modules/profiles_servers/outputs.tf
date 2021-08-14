#__________________________________________________________
#
# UCS Domain Profile Outputs
#__________________________________________________________

output "ucs_server_profiles" {
  description = "moid of the UCS Server Profiles."
  value = {
    for v in sort(keys(module.ucs_server_profiles)) : v => {
      moid = module.ucs_server_profiles[v].moid
      name = module.ucs_server_profiles[v].name
    }
  }
}


#__________________________________________________________
#
# UCS Server Moid
#__________________________________________________________

output "physical_servers" {
  description = "Moid of the Physical Servers in the Account."
  value = {
    for v in sort(keys(data.intersight_compute_physical_summary.server)) : v => {
      moid        = data.intersight_compute_physical_summary.server[v].results[0].moid
      name        = data.intersight_compute_physical_summary.server[v].results[0].name
      object_type = data.intersight_compute_physical_summary.server[v].results[0].source_object_type
    }
  }
}
