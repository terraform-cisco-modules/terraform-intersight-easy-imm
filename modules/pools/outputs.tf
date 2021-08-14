#__________________________________________________________
#
# Fibre-Channel Pool Outputs
#__________________________________________________________

output "fc_pools" {
  description = "moid of the Fibre-Channel Pools."
  value       = var.fc_pools != {} ? { for v in sort(keys(module.fc_pools)) : v => module.fc_pools[v].moid } : {}
}


#__________________________________________________________
#
# IP Pool Outputs
#__________________________________________________________

output "ip_pools" {
  description = "moid of the IP Pools."
  value       = var.ip_pools != {} ? { for v in sort(keys(module.ip_pools)) : v => module.ip_pools[v].moid } : {}
}


#__________________________________________________________
#
# IQN Pool Outputs
#__________________________________________________________

output "iqn_pools" {
  description = "moid of the IQN Pools."
  value       = var.iqn_pools != {} ? { for v in sort(keys(module.iqn_pools)) : v => module.iqn_pools[v].moid } : {}
}


#__________________________________________________________
#
# MAC Pool Outputs
#__________________________________________________________

output "mac_pools" {
  description = "moid of the MAC Pools."
  value       = var.mac_pools != {} ? { for v in sort(keys(module.mac_pools)) : v => module.mac_pools[v].moid } : {}
}


#__________________________________________________________
#
# UUID Pool Outputs
#__________________________________________________________

output "uuid_pools" {
  description = "moid of the UUID Pools."
  value       = var.uuid_pools != {} ? { for v in sort(keys(module.uuid_pools)) : v => module.uuid_pools[v].moid } : {}
}
