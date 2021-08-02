#__________________________________________________________
#
# UCS Domain Profile Outputs
#__________________________________________________________

output "ucs_server_profiles" {
  description = "moid of the UCS Server Profiles."
  value = {
    for v in sort(keys(module.ucs_server_profile)) : v => {
      moid = module.ucs_server_profile[v].moid
      name = module.ucs_server_profile[v].name
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

output "bios_nvmeof_orgs" {
  value = local.bios_nvmeof_orgs
}
output "bios_vmware_node_orgs" {
  value = local.bios_vmware_node_orgs
}

# output "testing" {
#   value = [ for s in sort(keys(local.bios_nvmeof_profiles)) : module.ucs_server_profile[s].moid ]
# }
