locals {
  dns_policy         = var.variables_tfc.dns_policy == null ? local.org_name : var.variables_tfc.dns_policy
  cluster_name       = var.variables_tfc.cluster_name
  ntp_policy         = var.variables_tfc.ntp_policy == null ? local.org_name : var.variables_tfc.ntp_policy
  org_name           = "Asgard"
  port_policy        = var.variables_tfc.port_policy == null ? local.org_name : var.variables_tfc.port_policy
  serial_a           = var.variables_tfc.serial_a
  serial_b           = var.variables_tfc.serial_b
  snmp_policy        = var.variables_tfc.snmp_policy == null ? local.org_name : var.variables_tfc.snmp_policy
  switch_ctrl_policy = var.variables_tfc.switch_ctrl_policy == null ? local.org_name : var.variables_tfc.switch_ctrl_policy
  syslog_policy      = var.variables_tfc.syslog_policy == null ? local.org_name : var.variables_tfc.syslog_policy
  system_qos_policy  = var.variables_tfc.system_qos_policy == null ? local.org_name : var.variables_tfc.system_qos_policy
  vlan_policy        = var.variables_tfc.vlan_policy == null ? local.org_name : var.variables_tfc.vlan_policy
  vsan_policy        = var.variables_tfc.vsan_policy == null ? local.org_name : var.variables_tfc.vsan_policy
}
output "cluster_variables" {
  value = {
    cluster_name       = local.cluster_name
    serial_a           = local.serial_a
    serial_b           = local.serial_b
    dns_policy         = local.dns_policy
    ntp_policy         = local.ntp_policy
    port_policy        = local.port_policy
    snmp_policy        = local.snmp_policy
    switch_ctrl_policy = local.switch_ctrl_policy
    syslog_policy      = local.syslog_policy
    system_qos_policy  = local.system_qos_policy
    vlan_policy        = local.vlan_policy
    vsan_policy        = local.vsan_policy
  }
}
