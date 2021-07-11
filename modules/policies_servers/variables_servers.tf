#__________________________________________________________
#
# Server Policy Variables
#__________________________________________________________

#______________________________________________
#
# BIOS Policy Variables
#______________________________________________

variable "bios_policy" {
  default     = ""
  description = "Intersight BIOS Policy Name.  Default name is {organization}"
  type        = string
}


#______________________________________________
#
# Boot Policy Variables
#______________________________________________

variable "boot_policy" {
  default     = ""
  description = "Intersight Boot Policy Name.  Default name is {organization}"
  type        = string
}


#______________________________________________
#
# Device Connector Policy Variables
#______________________________________________

variable "device_connector_policy" {
  default     = ""
  description = "Intersight Device Connector Policy Name.  Default name is {organization}"
  type        = string
}


#______________________________________________
#
# Disk Group Policy Variables
#______________________________________________

variable "disk_group_policy" {
  default     = ""
  description = "Intersight Disk Group Policy Name.  Default name is {organization}"
  type        = string
}


#______________________________________________
#
# IMC Access Policy Variables
#______________________________________________

variable "imc_access_policy" {
  default     = ""
  description = "Intersight IMC Access Policy Name.  Default name is {organization}"
  type        = string
}


#______________________________________________
#
# IPMI over LAN Policy Variables
#______________________________________________

variable "ipmi_over_lan_policy" {
  default     = ""
  description = "Intersight IPMI over LAN Policy Name.  Default name is {organization}"
  type        = string
}


#______________________________________________
#
# LDAP Policy Variables
#______________________________________________

variable "ldap_policy" {
  default     = ""
  description = "Intersight LDAP Policy Name.  Default name is {organization}"
  type        = string
}


#______________________________________________
#
# Local User Policy Variables
#______________________________________________

variable "local_user_policy" {
  default     = ""
  description = "Intersight Local User Policy Name.  Default name is {organization}"
  type        = string
}


#______________________________________________
#
# Persistent Memory Policy Variables
#______________________________________________

variable "persist_memory_plcy" {
  default     = ""
  description = "Intersight Persistent Memory Policy Name.  Default name is {organization}"
  type        = string
}


#______________________________________________
#
# SD Card Policy Variables
#______________________________________________

variable "sd_card_policy" {
  default     = ""
  description = "Intersight SD Card Policy Name.  Default name is {organization}"
  type        = string
}


#______________________________________________
#
# Serial over LAN Policy Variables
#______________________________________________

variable "serial_over_lan_plcy" {
  default     = ""
  description = "Intersight Serial over LAN Policy Name.  Default name is {organization}"
  type        = string
}


#______________________________________________
#
# SMTP Policy Variables
#______________________________________________

variable "smtp_policy" {
  default     = ""
  description = "Intersight SMTP Policy Name.  Default name is {organization}"
  type        = string
}


#______________________________________________
#
# SSH Policy Variables
#______________________________________________

variable "ssh_policy" {
  default     = ""
  description = "Intersight SSH Policy Name.  Default name is {organization}"
  type        = string
}


#______________________________________________
#
# Storage Policy Variables
#______________________________________________

variable "storage_policy" {
  default     = ""
  description = "Intersight Storage Policy Name.  Default name is {organization}"
  type        = string
}


#______________________________________________
#
# vHBA Adapter Policy Variables
#______________________________________________

variable "vhba_adapter_policy" {
  default     = ""
  description = "Intersight vHBA Adapter Policy Name.  Default name is {organization}"
  type        = string
}


#______________________________________________
#
# vHBA Network Policy Variables
#______________________________________________

variable "vhba_network_policy" {
  default     = ""
  description = "Intersight vHBA Network Policy Name.  Default name is {organization}"
  type        = string
}


#______________________________________________
#
# vHBA QoS Policy Variables
#______________________________________________

variable "vhba_qos_policy" {
  default     = ""
  description = "Intersight vHBA QoS Policy Name.  Default name is {organization}"
  type        = string
}


#______________________________________________
#
# vHBA SAN Connectivity Variables
#______________________________________________

variable "vhba_san_connectivity" {
  default     = ""
  description = "Intersight vHBA SAN Connectivity Policy Name.  Default name is {organization}"
  type        = string
}

#______________________________________________
#
# VIC Adapter Configuration Policy Variables
#______________________________________________

variable "vic_adapter_policy" {
  default     = ""
  description = "Intersight VIC Adapter Policy Name (Standalone).  Default name is {organization}"
  type        = string
}

variable "vic_fip_enabled" {
  default     = true
  description = "Enables advanced filtering on the interface."
  type        = bool
}

variable "vic_fec_mode_int0" {
  default     = "cl91"
  description = "Interface 0 Forward Error Correction (FEC) mode setting for the DCE interfaces of the adapter. FEC mode setting is supported only for Cisco VIC 14xx adapters. FEC mode 'cl74' is unsupported for Cisco VIC 1495/1497. This setting will be ignored for unsupported adapters and for unavailable DCE interfaces.\r\n * cl74 - Use cl74 standard as FEC mode setting. 'Clause 74' aka FC-FEC ('FireCode' FEC) offers simple, low-latency protection against 1 burst/sparse bit error, but it is not good for random errors.\r\n * cl91 - Use cl91 standard as FEC mode setting. 'Clause 91' aka RS-FEC ('ReedSolomon' FEC) offers better error protection against bursty and random errors but adds latency.\r\n * Off - Disable FEC mode on the DCE Interface."
  type        = string
}

variable "vic_fec_mode_int1" {
  default     = "cl91"
  description = "Interface 1 Forward Error Correction (FEC) mode setting for the DCE interfaces of the adapter. FEC mode setting is supported only for Cisco VIC 14xx adapters. FEC mode 'cl74' is unsupported for Cisco VIC 1495/1497. This setting will be ignored for unsupported adapters and for unavailable DCE interfaces.\r\n * cl74 - Use cl74 standard as FEC mode setting. 'Clause 74' aka FC-FEC ('FireCode' FEC) offers simple, low-latency protection against 1 burst/sparse bit error, but it is not good for random errors.\r\n * cl91 - Use cl91 standard as FEC mode setting. 'Clause 91' aka RS-FEC ('ReedSolomon' FEC) offers better error protection against bursty and random errors but adds latency.\r\n * Off - Disable FEC mode on the DCE Interface."
  type        = string
}

variable "vic_fec_mode_int2" {
  default     = "cl91"
  description = "Interface 2 Forward Error Correction (FEC) mode setting for the DCE interfaces of the adapter. FEC mode setting is supported only for Cisco VIC 14xx adapters. FEC mode 'cl74' is unsupported for Cisco VIC 1495/1497. This setting will be ignored for unsupported adapters and for unavailable DCE interfaces.\r\n * cl74 - Use cl74 standard as FEC mode setting. 'Clause 74' aka FC-FEC ('FireCode' FEC) offers simple, low-latency protection against 1 burst/sparse bit error, but it is not good for random errors.\r\n * cl91 - Use cl91 standard as FEC mode setting. 'Clause 91' aka RS-FEC ('ReedSolomon' FEC) offers better error protection against bursty and random errors but adds latency.\r\n * Off - Disable FEC mode on the DCE Interface."
  type        = string
}

variable "vic_fec_mode_int3" {
  default     = "cl91"
  description = "Interface 3 Forward Error Correction (FEC) mode setting for the DCE interfaces of the adapter. FEC mode setting is supported only for Cisco VIC 14xx adapters. FEC mode 'cl74' is unsupported for Cisco VIC 1495/1497. This setting will be ignored for unsupported adapters and for unavailable DCE interfaces.\r\n * cl74 - Use cl74 standard as FEC mode setting. 'Clause 74' aka FC-FEC ('FireCode' FEC) offers simple, low-latency protection against 1 burst/sparse bit error, but it is not good for random errors.\r\n * cl91 - Use cl91 standard as FEC mode setting. 'Clause 91' aka RS-FEC ('ReedSolomon' FEC) offers better error protection against bursty and random errors but adds latency.\r\n * Off - Disable FEC mode on the DCE Interface."
  type        = string
}

variable "vic_lldp_enabled" {
  default     = true
  description = "Status of Accelerated Receive Flow Steering on the virtual ethernet interface."
  type        = bool
}

variable "vic_portchannel" {
  default     = true
  description = "When Port Channel is enabled, two vNICs and two vHBAs are available for use on the adapter card. When disabled, four vNICs and four vHBAs are available for use on the adapter card. Disabling port channel reboots the server. Port Channel is supported only for Cisco VIC 1455/1457 adapters."
  type        = bool
}


#______________________________________________
#
# Virtual KVM Policy Variables
#______________________________________________

variable "virtual_kvm_policy" {
  default     = ""
  description = "Intersight Virtual KVM Name.  Default name is {organization}"
  type        = string
}

variable "vkvm_local_server_video" {
  default     = true
  description = "If enabled, displays KVM session on any monitor attached to the server."
  type        = bool
}

variable "vkvm_video_encryption" {
  default     = true
  description = "If enabled, encrypts all video information sent through KVM."
  type        = bool
}

variable "vkvm_enabled" {
  default     = true
  description = "Flag to Enable or Disable the Policy."
  type        = bool
}

variable "vkvm_maximum_sessions" {
  default     = 4
  description = "The maximum number of concurrent KVM sessions allowed. Range is 1 to 4."
  type        = number
}

variable "vkvm_remote_port" {
  default     = 2068
  description = "The port used for KVM communication. Range is 1 to 65535."
  type        = number
}


#______________________________________________
#
# Virtual Media Policy Variables
#______________________________________________

variable "virtual_media_policy" {
  default     = ""
  description = "Intersight Virtual Media Policy Name.  Default name is {organization}"
  type        = string
}

variable "vmedia_enabled" {
  default     = true
  description = "Flag to Enable or Disable the Policy."
  type        = bool
}

variable "vmedia_encryption" {
  default     = false
  description = "If enabled, allows encryption of all Virtual Media communications."
  type        = bool
}

variable "vmedia_mappings" {
  default     = []
  description = "List of Properties to Assign to the Virtual Media Policy."
  type        = list(map(string))
}


#______________________________________________
#
# vNIC Adapter Policy Variables
#______________________________________________

variable "vnic_adapter_policy" {
  default     = ""
  description = "Intersight vNIC Adapter Policy Name.  Default name is {organization}"
  type        = string
}


#______________________________________________
#
# vNIC LAN Connectivity Variables
#______________________________________________

variable "vnic_lan_connectivity" {
  default     = ""
  description = "Intersight vNIC LAN Connectivity Policy Name.  Default name is {organization}"
  type        = string
}


#______________________________________________
#
# vNIC Network Control Policy Variables
#______________________________________________

variable "vnic_netctrl_policy" {
  default     = ""
  description = "Intersight vNIC Network Control Policy Name.  Default name is {organization}"
  type        = string
}


#______________________________________________
#
# vNIC Network Group Policy Variables
#______________________________________________

variable "vnic_netgrp_policy" {
  default     = ""
  description = "Intersight vNIC Network Group Policy Name.  Default name is {organization}"
  type        = string
}


#______________________________________________
#
# vNIC Network Policy Variables
#______________________________________________

variable "vnic_network_policy" {
  default     = ""
  description = "Intersight vNIC Network Policy Name (Standalone).  Default name is {organization}"
  type        = string
}


#______________________________________________
#
# vNIC QoS Policy Variables
#______________________________________________

variable "vnic_qos_policy" {
  default     = ""
  description = "Intersight vNIC QoS Policy Name.  Default name is {organization}"
  type        = string
}
