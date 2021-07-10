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

variable "boot_policy" {
  default     = ""
  description = "Intersight Boot Policy Name.  Default name is {organization}"
  type        = string
}

variable "device_connector_policy" {
  default     = ""
  description = "Intersight Device Connector Policy Name.  Default name is {organization}"
  type        = string
}

variable "disk_group_policy" {
  default     = ""
  description = "Intersight Disk Group Policy Name.  Default name is {organization}"
  type        = string
}

variable "imc_access_policy" {
  default     = ""
  description = "Intersight IMC Access Policy Name.  Default name is {organization}"
  type        = string
}

variable "ipmi_over_lan_policy" {
  default     = ""
  description = "Intersight IPMI over LAN Policy Name.  Default name is {organization}"
  type        = string
}

variable "ldap_policy" {
  default     = ""
  description = "Intersight LDAP Policy Name.  Default name is {organization}"
  type        = string
}

variable "local_user_policy" {
  default     = ""
  description = "Intersight Local User Policy Name.  Default name is {organization}"
  type        = string
}

variable "persist_memory_plcy" {
  default     = ""
  description = "Intersight Persistent Memory Policy Name.  Default name is {organization}"
  type        = string
}

variable "sd_card_policy" {
  default     = ""
  description = "Intersight SD Card Policy Name.  Default name is {organization}"
  type        = string
}

variable "serial_over_lan_plcy" {
  default     = ""
  description = "Intersight Serial over LAN Policy Name.  Default name is {organization}"
  type        = string
}

variable "smtp_policy" {
  default     = ""
  description = "Intersight SMTP Policy Name.  Default name is {organization}"
  type        = string
}

variable "ssh_policy" {
  default     = ""
  description = "Intersight SSH Policy Name.  Default name is {organization}"
  type        = string
}

variable "storage_policy" {
  default     = ""
  description = "Intersight Storage Policy Name.  Default name is {organization}"
  type        = string
}

variable "vhba_adapter_policy" {
  default     = ""
  description = "Intersight vHBA Adapter Policy Name.  Default name is {organization}"
  type        = string
}

variable "vhba_network_policy" {
  default     = ""
  description = "Intersight vHBA Network Policy Name.  Default name is {organization}"
  type        = string
}

variable "vhba_qos_policy" {
  default     = ""
  description = "Intersight vHBA QoS Policy Name.  Default name is {organization}"
  type        = string
}

variable "vhba_sanconnect_plcy" {
  default     = ""
  description = "Intersight vHBA SAN Connectivity Policy Name.  Default name is {organization}"
  type        = string
}

variable "vic_adapter_policy" {
  default     = ""
  description = "Intersight VIC Adapter Policy Name (Standalone).  Default name is {organization}"
  type        = string
}

variable "virtual_kvm_policy" {
  default     = ""
  description = "Intersight Virtual KVM Name.  Default name is {organization}"
  type        = string
}

variable "virtual_media_policy" {
  default     = ""
  description = "Intersight Virtual Media Policy Name.  Default name is {organization}"
  type        = string
}

variable "vnic_adapter_plcy" {
  default     = ""
  description = "Intersight vNIC Adapter Policy Name.  Default name is {organization}"
  type        = string
}

variable "vnic_iscsiadapt_plcy" {
  default     = ""
  description = "Intersight vNIC iSCSI Adapter Policy Name.  Default name is {organization}"
  type        = string
}

variable "vnic_iscsiboot_plcy" {
  default     = ""
  description = "Intersight vNIC iSCSI Boot Policy Name.  Default name is {organization}"
  type        = string
}

variable "vnic_iscsitarget_plcy" {
  default     = ""
  description = "Intersight vNIC iSCSI Target Policy Name.  Default name is {organization}"
  type        = string
}

variable "vnic_lanconnect_plcy" {
  default     = ""
  description = "Intersight vNIC LAN Connectivity Policy Name.  Default name is {organization}"
  type        = string
}

variable "vnic_netctrl_policy" {
  default     = ""
  description = "Intersight vNIC Network Control Policy Name.  Default name is {organization}"
  type        = string
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
