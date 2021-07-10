#__________________________________________________________
#
# Server Policy Variables
#__________________________________________________________

#______________________________________________
#
# Intersight UCS Domain Profile Policy Names
#______________________________________________

variable "bios_policy" {
  default     = ""
  description = "Intersight BIOS Policy Name.  Default name is {organization}"
  type        = string
}
output "bios_policy" {
  description = "Intersight BIOS Policy Name."
  value       = var.bios_policy != "" ? var.bios_policy : var.organization
}

variable "boot_policy" {
  default     = ""
  description = "Intersight Boot Policy Name.  Default name is {organization}"
  type        = string
}
output "boot_policy" {
  description = "Intersight Boot Policy Name."
  value       = var.boot_policy != "" ? var.boot_policy : var.organization
}

variable "device_connector_plcy" {
  default     = ""
  description = "Intersight Device Connector Policy Name.  Default name is {organization}"
  type        = string
}
output "device_connector_plcy" {
  description = "Intersight Device Connector Policy Name."
  value       = var.device_connector_plcy != "" ? var.device_connector_plcy : var.organization
}

variable "disk_group_policy" {
  default     = ""
  description = "Intersight Disk Group Policy Name.  Default name is {organization}"
  type        = string
}
output "disk_group_policy" {
  description = "Intersight Disk Group Policy Name."
  value       = var.disk_group_policy != "" ? var.disk_group_policy : var.organization
}

variable "imc_access_policy" {
  default     = ""
  description = "Intersight IMC Access Policy Name.  Default name is {organization}"
  type        = string
}
output "imc_access_policy" {
  description = "Intersight IMC Access Policy Name."
  value       = var.imc_access_policy != "" ? var.imc_access_policy : var.organization
}

variable "ipmi_over_lan_policy" {
  default     = ""
  description = "Intersight IPMI over LAN Policy Name.  Default name is {organization}"
  type        = string
}
output "ipmi_over_lan_policy" {
  description = "Intersight IPMI over LAN Policy Name."
  value       = var.ipmi_over_lan_policy != "" ? var.ipmi_over_lan_policy : var.organization
}

variable "ldap_policy" {
  default     = ""
  description = "Intersight LDAP Policy Name.  Default name is {organization}"
  type        = string
}
output "ldap_policy" {
  description = "Intersight LDAP Policy Name."
  value       = var.ldap_policy != "" ? var.ldap_policy : var.organization
}

variable "local_user_policy" {
  default     = ""
  description = "Intersight Local User Policy Name.  Default name is {organization}"
  type        = string
}
output "local_user_policy" {
  description = "Intersight Local User Policy Name."
  value       = var.local_user_policy != "" ? var.local_user_policy : var.organization
}

variable "persist_memory_plcy" {
  default     = ""
  description = "Intersight Persistent Memory Policy Name.  Default name is {organization}"
  type        = string
}
output "persist_memory_plcy" {
  description = "Intersight Persistent Memory Policy Name."
  value       = var.persist_memory_plcy != "" ? var.persist_memory_plcy : var.organization
}

variable "sd_card_policy" {
  default     = ""
  description = "Intersight SD Card Policy Name.  Default name is {organization}"
  type        = string
}
output "sd_card_policy" {
  description = "Intersight SD Card Policy Name."
  value       = var.sd_card_policy != "" ? var.sd_card_policy : var.organization
}

variable "serial_over_lan_plcy" {
  default     = ""
  description = "Intersight Serial over LAN Policy Name.  Default name is {organization}"
  type        = string
}
output "serial_over_lan_plcy" {
  description = "Intersight Serial over LAN Policy Name."
  value       = var.serial_over_lan_plcy != "" ? var.serial_over_lan_plcy : var.organization
}

variable "smtp_policy" {
  default     = ""
  description = "Intersight SMTP Policy Name.  Default name is {organization}"
  type        = string
}
output "smtp_policy" {
  description = "Intersight SMTP Policy Name."
  value       = var.smtp_policy != "" ? var.smtp_policy : var.organization
}

variable "ssh_policy" {
  default     = ""
  description = "Intersight SSH Policy Name.  Default name is {organization}"
  type        = string
}
output "ssh_policy" {
  description = "Intersight SSH Policy Name."
  value       = var.ssh_policy != "" ? var.ssh_policy : var.organization
}

variable "storage_policy" {
  default     = ""
  description = "Intersight Storage Policy Name.  Default name is {organization}"
  type        = string
}
output "storage_policy" {
  description = "Intersight Storage Policy Name."
  value       = var.storage_policy != "" ? var.storage_policy : var.organization
}

variable "vhba_adapter_policy" {
  default     = ""
  description = "Intersight vHBA Adapter Policy Name.  Default name is {organization}"
  type        = string
}
output "vhba_adapter_policy" {
  description = "Intersight vHBA Adapter Policy Name."
  value       = var.vhba_adapter_policy != "" ? var.vhba_adapter_policy : var.organization
}

variable "vhba_network_policy" {
  default     = ""
  description = "Intersight vHBA Network Policy Name.  Default name is {organization}"
  type        = string
}
output "vhba_network_policy" {
  description = "Intersight vHBA Network Policy Name."
  value       = var.vhba_network_policy != "" ? var.vhba_network_policy : var.organization
}

variable "vhba_qos_policy" {
  default     = ""
  description = "Intersight vHBA QoS Policy Name.  Default name is {organization}"
  type        = string
}
output "vhba_qos_policy" {
  description = "Intersight vHBA QoS Policy Name."
  value       = var.vhba_qos_policy != "" ? var.vhba_qos_policy : var.organization
}

variable "vhba_sanconnect_plcy" {
  default     = ""
  description = "Intersight vHBA SAN Connectivity Policy Name.  Default name is {organization}"
  type        = string
}
output "vhba_sanconnect_plcy" {
  description = "Intersight SAN Connectivity Policy Name."
  value       = var.vhba_sanconnect_plcy != "" ? var.vhba_sanconnect_plcy : var.organization
}

variable "vic_adapter_policy" {
  default     = ""
  description = "Intersight VIC Adapter Policy Name (Standalone).  Default name is {organization}"
  type        = string
}
output "vic_adapter_policy" {
  description = "Intersight VIC Adapter Policy Name."
  value       = var.vic_adapter_policy != "" ? var.vic_adapter_policy : var.organization
}

variable "virtual_kvm_policy" {
  default     = ""
  description = "Intersight Virtual KVM Name.  Default name is {organization}"
  type        = string
}
output "virtual_kvm_policy" {
  description = "Intersight Virtual KVM Policy Name."
  value       = var.virtual_kvm_policy != "" ? var.virtual_kvm_policy : var.organization
}

variable "virtual_media_policy" {
  default     = ""
  description = "Intersight Virtual Media Policy Name.  Default name is {organization}"
  type        = string
}
output "virtual_media_policy" {
  description = "Intersight Virtual Media Policy Name."
  value       = var.virtual_media_policy != "" ? var.virtual_media_policy : var.organization
}

variable "vnic_adapter_plcy" {
  default     = ""
  description = "Intersight vNIC Adapter Policy Name.  Default name is {organization}"
  type        = string
}
output "vnic_adapter_plcy" {
  description = "Intersight vNIC Adapter Policy Name."
  value       = var.vnic_adapter_plcy != "" ? var.vnic_adapter_plcy : var.organization
}

variable "vnic_iscsiadapt_plcy" {
  default     = ""
  description = "Intersight vNIC iSCSI Adapter Policy Name.  Default name is {organization}"
  type        = string
}
output "vnic_iscsiadapt_plcy" {
  description = "Intersight vNIC iSCSI Adapter Policy Name."
  value       = var.vnic_iscsiadapt_plcy != "" ? var.vnic_iscsiadapt_plcy : var.organization
}

variable "vnic_iscsiboot_plcy" {
  default     = ""
  description = "Intersight vNIC iSCSI Boot Policy Name.  Default name is {organization}"
  type        = string
}
output "vnic_iscsiboot_plcy" {
  description = "Intersight vNIC iSCSI Boot Policy Name."
  value       = var.vnic_iscsiboot_plcy != "" ? var.vnic_iscsiboot_plcy : var.organization
}

variable "vnic_iscsitarget_plcy" {
  default     = ""
  description = "Intersight vNIC iSCSI Target Policy Name.  Default name is {organization}"
  type        = string
}
output "vnic_iscsitarget_plcy" {
  description = "Intersight vNIC iSCSI Target Policy Name."
  value       = var.vnic_iscsitarget_plcy != "" ? var.vnic_iscsitarget_plcy : var.organization
}

variable "vnic_lanconnect_plcy" {
  default     = ""
  description = "Intersight vNIC LAN Connectivity Policy Name.  Default name is {organization}"
  type        = string
}
output "vnic_lanconnect_plcy" {
  description = "Intersight vNIC LAN Connectivity Policy Name."
  value       = var.vnic_lanconnect_plcy != "" ? var.vnic_lanconnect_plcy : var.organization
}

variable "vnic_netctrl_policy" {
  default     = ""
  description = "Intersight vNIC Network Control Policy Name.  Default name is {organization}"
  type        = string
}
output "vnic_netctrl_policy" {
  description = "Intersight vNIC Network Control Policy Name."
  value       = var.vnic_netctrl_policy != "" ? var.vnic_netctrl_policy : var.organization
}

variable "vnic_netgrp_policy" {
  default     = ""
  description = "Intersight vNIC Network Group Policy Name.  Default name is {organization}"
  type        = string
}

variable "vnic_network_policy" {
  default     = ""
  description = "Intersight vNIC Network Policy Name (Standalone).  Default name is {organization}"
  type        = string
}

variable "vnic_qos_policy" {
  default     = ""
  description = "Intersight vNIC QoS Policy Name.  Default name is {organization}"
  type        = string
}
