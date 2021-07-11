terraform {
  experiments = [module_variable_optional_attrs]
}

variable "variables_tfc" {
  type = object({
    cluster_name       = string
    serial_a           = string
    serial_b           = string
    dns_policy         = optional(string)
    ntp_policy         = optional(string)
    port_policy        = optional(string)
    snmp_policy        = optional(string)
    switch_ctrl_policy = optional(string)
    syslog_policy      = optional(string)
    system_qos_policy  = optional(string)
    vlan_policy        = optional(string)
    vsan_policy        = optional(string)
  })
}

#  default = {
#    dns_policy         = "default"
#    ntp_policy         = "default"
#    port_policy        = "default"
#    snmp_policy        = "default"
#    switch_ctrl_policy = "default"
#    system_qos_policy  = "default"
#    vlan_policy        = "default"
#    vsan_policy        = "default"
#  }
