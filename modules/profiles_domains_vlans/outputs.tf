#__________________________________________________________
#
# VLAN Policy Outputs
#__________________________________________________________

output "policies_multicast" {
  value = {
    for v in sort(keys(module.policies_multicast)) : v => module.policies_multicast[v].moid
  }
}

output "policies_vlan" {
  value = {
    for v in sort(keys(module.policies_vlan)) : v => module.policies_vlan[v].moid
  }
}

output "policies_vlan_native" {
  value = {
    for v in sort(keys(module.policies_vlan_native)) : v => {
      moid = module.policies_vlan_native[v].moid
      name = module.policies_vlan_native[v].name
    } if local.polices_vlan[v].vlan_native != null
  }
}

output "policies_vlan_list" {
  value = {
    for v in sort(keys(module.policies_vlan_list)) : v => {
      moid = module.policies_vlan_list[v].moid
      name = module.policies_vlan_list[v].name
    } if local.polices_vlan[v].vlan_list != null
  }
}

output "policies_vlan_map" {
  value = {
    for v in sort(keys(module.policies_vlan_map)) : v => {
      moid = module.policies_vlan_map[v].moid
      name = module.policies_vlan_map[v].name
    } if local.polices_vlan[v].vlan_map != null
  }
}
