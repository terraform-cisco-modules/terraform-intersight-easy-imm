terraform {
  experiments = [module_variable_optional_attrs]
}

#__________________________________________________________
#
# Terraform Cloud Organization
#__________________________________________________________

variable "tfc_organization" {
  description = "Terraform Cloud Organization."
  type        = string
}


#______________________________________________
#
# Terraform Cloud domain_workspace Workspace
#______________________________________________

variable "domain_workspace" {
  description = "Domain Workspace Name."
  type        = string
}


#__________________________________________________________
#
# Intersight Provider Variables
#__________________________________________________________

variable "apikey" {
  description = "Intersight API Key."
  sensitive   = true
  type        = string
}

variable "endpoint" {
  default     = "https://intersight.com"
  description = "Intersight URL."
  type        = string
}

variable "secretkey" {
  description = "Intersight Secret Key."
  sensitive   = true
  type        = string
}


#__________________________________________________________
#
# Global Variables
#__________________________________________________________

variable "organizations" {
  description = "Intersight Organization Names to Apply Policy to.  https://intersight.com/an/settings/organizations/."
  type        = set(string)
}

variable "tags" {
  default     = []
  description = "Tags to be Associated with Objects Created in Intersight."
  type        = list(map(string))
}


#______________________________________________
#
# Deployment Variables
#______________________________________________

variable "Cluster_ID" {
  default     = "0"
  description = "A single digit Cluster Identifier between 0 and 256 in Hex. (0-9, A, B, C, D, E, F)."
  type        = string
}

variable "Organization_ID" {
  default     = "0"
  description = "A single digit site identifier between 0 and 15 in Hex. (0-9, A, B, C, D, E, F)."
  type        = string
  validation {
    condition = (
      var.Organization_ID == "0" ||
      var.Organization_ID == "1" ||
      var.Organization_ID == "2" ||
      var.Organization_ID == "3" ||
      var.Organization_ID == "4" ||
      var.Organization_ID == "5" ||
      var.Organization_ID == "6" ||
      var.Organization_ID == "7" ||
      var.Organization_ID == "8" ||
      var.Organization_ID == "9" ||
      var.Organization_ID == "A" ||
      var.Organization_ID == "B" ||
      var.Organization_ID == "C" ||
      var.Organization_ID == "D" ||
      var.Organization_ID == "E" ||
      var.Organization_ID == "F" ||
      var.Organization_ID == "a" ||
      var.Organization_ID == "b" ||
      var.Organization_ID == "c" ||
      var.Organization_ID == "d" ||
      var.Organization_ID == "e" ||
      var.Organization_ID == "f"
    )
    error_message = "Organization_ID Must be a single digit value in Hex between 0 and F."
  }
}

variable "Site_ID" {
  default     = "0"
  description = "A single digit site identifier between 0 and 15 in Hex. (0-9, A, B, C, D, E, F)."
  type        = string
  validation {
    condition = (
      var.Site_ID == "0" ||
      var.Site_ID == "1" ||
      var.Site_ID == "2" ||
      var.Site_ID == "3" ||
      var.Site_ID == "4" ||
      var.Site_ID == "5" ||
      var.Site_ID == "6" ||
      var.Site_ID == "7" ||
      var.Site_ID == "8" ||
      var.Site_ID == "9" ||
      var.Site_ID == "A" ||
      var.Site_ID == "B" ||
      var.Site_ID == "C" ||
      var.Site_ID == "D" ||
      var.Site_ID == "E" ||
      var.Site_ID == "F" ||
      var.Site_ID == "a" ||
      var.Site_ID == "b" ||
      var.Site_ID == "c" ||
      var.Site_ID == "d" ||
      var.Site_ID == "e" ||
      var.Site_ID == "f"
    )
    error_message = "Site_ID Must be a single digit value in Hex between 0 and F."
  }
}
output "Site_ID" {
  description = "Site Identifier."
  value       = var.Site_ID
}


#__________________________________________________________
#
# Policies Shared between Domains and Servers
#__________________________________________________________

#______________________________________________
#
# Global IP Variables
#______________________________________________

variable "ipv4_enable" {
  default     = true
  description = "Flag to Enable or Disable IPv4 for the deployment."
  type        = bool
}

variable "ipv6_enable" {
  default     = false
  description = "Flag to Enable or Disable IPv6 for the deployment."
  type        = bool
}


#______________________________________________
#
# (DNS) Network Connectivity Policy Variables
#______________________________________________

variable "dns_policy" {
  default     = ""
  description = "Intersight Network Connectivity (DNS) Policy Name.  Default name is {organization}"
  type        = string
}

variable "dns_servers_v4" {
  default     = ["208.67.222.222", "208.67.220.220"]
  description = "List of IPv4 DNS Server(s) for Deployment.  Can be one or two servers."
  type        = list(string)
}

variable "dns_servers_v6" {
  default     = ["empty"]
  description = "List of IPv6 DNS Server(s) for Deployment.  Can be one or two servers."
  type        = list(string)
}

variable "dynamic_dns" {
  default     = false
  description = "Flag to Enable or Disable Dynamic DNS on the Policy.  Meaning obtain DNS Servers from DHCP Service."
  type        = bool
}

variable "update_domain" {
  default     = ""
  description = "Name of the Domain to Update when using Dynamic DNS for the Policy."
  type        = string
}


#______________________________________________
#
# NTP Policy Variables
#______________________________________________

variable "ntp_policy" {
  default     = ""
  description = "Intersight NTP Policy Name.  Default name is {organization}"
  type        = string
}

variable "ntp_servers" {
  default     = ["time-a-g.nist.gov", "time-b-g.nist.gov"]
  description = "List of NTP Server for Deployment.  If undefined then the dns_servers will be used."
  type        = list(string)
}

variable "timezone" {
  default     = "Etc/GMT"
  description = "Timezone for Deployment.  For a List of supported timezones see the following URL.\r\n https://github.com/terraform-cisco-modules/terraform-intersight-imm/blob/master/modules/policies_ntp/README.md."
  type        = string
  validation {
    condition = (
      var.timezone == "Africa/Abidjan" ||
      var.timezone == "Africa/Accra" ||
      var.timezone == "Africa/Algiers" ||
      var.timezone == "Africa/Bissau" ||
      var.timezone == "Africa/Cairo" ||
      var.timezone == "Africa/Casablanca" ||
      var.timezone == "Africa/Ceuta" ||
      var.timezone == "Africa/El_Aaiun" ||
      var.timezone == "Africa/Johannesburg" ||
      var.timezone == "Africa/Khartoum" ||
      var.timezone == "Africa/Lagos" ||
      var.timezone == "Africa/Maputo" ||
      var.timezone == "Africa/Monrovia" ||
      var.timezone == "Africa/Nairobi" ||
      var.timezone == "Africa/Ndjamena" ||
      var.timezone == "Africa/Tripoli" ||
      var.timezone == "Africa/Tunis" ||
      var.timezone == "Africa/Windhoek" ||
      var.timezone == "America/Anchorage" ||
      var.timezone == "America/Araguaina" ||
      var.timezone == "America/Argentina/Buenos_Aires" ||
      var.timezone == "America/Asuncion" ||
      var.timezone == "America/Bahia" ||
      var.timezone == "America/Barbados" ||
      var.timezone == "America/Belem" ||
      var.timezone == "America/Belize" ||
      var.timezone == "America/Boa_Vista" ||
      var.timezone == "America/Bogota" ||
      var.timezone == "America/Campo_Grande" ||
      var.timezone == "America/Cancun" ||
      var.timezone == "America/Caracas" ||
      var.timezone == "America/Cayenne" ||
      var.timezone == "America/Cayman" ||
      var.timezone == "America/Chicago" ||
      var.timezone == "America/Costa_Rica" ||
      var.timezone == "America/Cuiaba" ||
      var.timezone == "America/Curacao" ||
      var.timezone == "America/Danmarkshavn" ||
      var.timezone == "America/Dawson_Creek" ||
      var.timezone == "America/Denver" ||
      var.timezone == "America/Edmonton" ||
      var.timezone == "America/El_Salvador" ||
      var.timezone == "America/Fortaleza" ||
      var.timezone == "America/Godthab" ||
      var.timezone == "America/Grand_Turk" ||
      var.timezone == "America/Guatemala" ||
      var.timezone == "America/Guayaquil" ||
      var.timezone == "America/Guyana" ||
      var.timezone == "America/Halifax" ||
      var.timezone == "America/Havana" ||
      var.timezone == "America/Hermosillo" ||
      var.timezone == "America/Iqaluit" ||
      var.timezone == "America/Jamaica" ||
      var.timezone == "America/La_Paz" ||
      var.timezone == "America/Lima" ||
      var.timezone == "America/Los_Angeles" ||
      var.timezone == "America/Maceio" ||
      var.timezone == "America/Managua" ||
      var.timezone == "America/Manaus" ||
      var.timezone == "America/Martinique" ||
      var.timezone == "America/Mazatlan" ||
      var.timezone == "America/Mexico_City" ||
      var.timezone == "America/Miquelon" ||
      var.timezone == "America/Montevideo" ||
      var.timezone == "America/Nassau" ||
      var.timezone == "America/New_York" ||
      var.timezone == "America/Noronha" ||
      var.timezone == "America/Panama" ||
      var.timezone == "America/Paramaribo" ||
      var.timezone == "America/Phoenix" ||
      var.timezone == "America/Port_of_Spain" ||
      var.timezone == "America/Port-au-Prince" ||
      var.timezone == "America/Porto_Velho" ||
      var.timezone == "America/Puerto_Rico" ||
      var.timezone == "America/Recife" ||
      var.timezone == "America/Regina" ||
      var.timezone == "America/Rio_Branco" ||
      var.timezone == "America/Santiago" ||
      var.timezone == "America/Santo_Domingo" ||
      var.timezone == "America/Sao_Paulo" ||
      var.timezone == "America/Scoresbysund" ||
      var.timezone == "America/St_Johns" ||
      var.timezone == "America/Tegucigalpa" ||
      var.timezone == "America/Thule" ||
      var.timezone == "America/Tijuana" ||
      var.timezone == "America/Toronto" ||
      var.timezone == "America/Vancouver" ||
      var.timezone == "America/Whitehorse" ||
      var.timezone == "America/Winnipeg" ||
      var.timezone == "America/Yellowknife" ||
      var.timezone == "Antarctica/Casey" ||
      var.timezone == "Antarctica/Davis" ||
      var.timezone == "Antarctica/DumontDUrville" ||
      var.timezone == "Antarctica/Mawson" ||
      var.timezone == "Antarctica/Palmer" ||
      var.timezone == "Antarctica/Rothera" ||
      var.timezone == "Antarctica/Syowa" ||
      var.timezone == "Antarctica/Vostok" ||
      var.timezone == "Asia/Almaty" ||
      var.timezone == "Asia/Amman" ||
      var.timezone == "Asia/Aqtau" ||
      var.timezone == "Asia/Aqtobe" ||
      var.timezone == "Asia/Ashgabat" ||
      var.timezone == "Asia/Baghdad" ||
      var.timezone == "Asia/Baku" ||
      var.timezone == "Asia/Bangkok" ||
      var.timezone == "Asia/Beirut" ||
      var.timezone == "Asia/Bishkek" ||
      var.timezone == "Asia/Brunei" ||
      var.timezone == "Asia/Calcutta" ||
      var.timezone == "Asia/Choibalsan" ||
      var.timezone == "Asia/Colombo" ||
      var.timezone == "Asia/Damascus" ||
      var.timezone == "Asia/Dhaka" ||
      var.timezone == "Asia/Dili" ||
      var.timezone == "Asia/Dubai" ||
      var.timezone == "Asia/Dushanbe" ||
      var.timezone == "Asia/Gaza" ||
      var.timezone == "Asia/Hong_Kong" ||
      var.timezone == "Asia/Hovd" ||
      var.timezone == "Asia/Irkutsk" ||
      var.timezone == "Asia/Jakarta" ||
      var.timezone == "Asia/Jayapura" ||
      var.timezone == "Asia/Jerusalem" ||
      var.timezone == "Asia/Kabul" ||
      var.timezone == "Asia/Kamchatka" ||
      var.timezone == "Asia/Karachi" ||
      var.timezone == "Asia/Katmandu" ||
      var.timezone == "Asia/Kolkata" ||
      var.timezone == "Asia/Krasnoyarsk" ||
      var.timezone == "Asia/Kuala_Lumpur" ||
      var.timezone == "Asia/Macau" ||
      var.timezone == "Asia/Magadan" ||
      var.timezone == "Asia/Makassar" ||
      var.timezone == "Asia/Manila" ||
      var.timezone == "Asia/Nicosia" ||
      var.timezone == "Asia/Omsk" ||
      var.timezone == "Asia/Pyongyang" ||
      var.timezone == "Asia/Qatar" ||
      var.timezone == "Asia/Rangoon" ||
      var.timezone == "Asia/Riyadh" ||
      var.timezone == "Asia/Saigon" ||
      var.timezone == "Asia/Seoul" ||
      var.timezone == "Asia/Shanghai" ||
      var.timezone == "Asia/Singapore" ||
      var.timezone == "Asia/Taipei" ||
      var.timezone == "Asia/Tashkent" ||
      var.timezone == "Asia/Tbilisi" ||
      var.timezone == "Asia/Tehran" ||
      var.timezone == "Asia/Thimphu" ||
      var.timezone == "Asia/Tokyo" ||
      var.timezone == "Asia/Ulaanbaatar" ||
      var.timezone == "Asia/Vladivostok" ||
      var.timezone == "Asia/Yakutsk" ||
      var.timezone == "Asia/Yekaterinburg" ||
      var.timezone == "Asia/Yerevan" ||
      var.timezone == "Atlantic/Azores" ||
      var.timezone == "Atlantic/Bermuda" ||
      var.timezone == "Atlantic/Canary" ||
      var.timezone == "Atlantic/Cape_Verde" ||
      var.timezone == "Atlantic/Faroe" ||
      var.timezone == "Atlantic/Reykjavik" ||
      var.timezone == "Atlantic/South_Georgia" ||
      var.timezone == "Atlantic/Stanley" ||
      var.timezone == "Australia/Adelaide" ||
      var.timezone == "Australia/Brisbane" ||
      var.timezone == "Australia/Darwin" ||
      var.timezone == "Australia/Hobart" ||
      var.timezone == "Australia/Perth" ||
      var.timezone == "Australia/Sydney" ||
      var.timezone == "Etc/GMT" ||
      var.timezone == "Europe/Amsterdam" ||
      var.timezone == "Europe/Andorra" ||
      var.timezone == "Europe/Athens" ||
      var.timezone == "Europe/Belgrade" ||
      var.timezone == "Europe/Berlin" ||
      var.timezone == "Europe/Brussels" ||
      var.timezone == "Europe/Bucharest" ||
      var.timezone == "Europe/Budapest" ||
      var.timezone == "Europe/Chisinau" ||
      var.timezone == "Europe/Copenhagen" ||
      var.timezone == "Europe/Dublin" ||
      var.timezone == "Europe/Gibraltar" ||
      var.timezone == "Europe/Helsinki" ||
      var.timezone == "Europe/Istanbul" ||
      var.timezone == "Europe/Kaliningrad" ||
      var.timezone == "Europe/Kiev" ||
      var.timezone == "Europe/Lisbon" ||
      var.timezone == "Europe/London" ||
      var.timezone == "Europe/Luxembourg" ||
      var.timezone == "Europe/Madrid" ||
      var.timezone == "Europe/Malta" ||
      var.timezone == "Europe/Minsk" ||
      var.timezone == "Europe/Monaco" ||
      var.timezone == "Europe/Moscow" ||
      var.timezone == "Europe/Oslo" ||
      var.timezone == "Europe/Paris" ||
      var.timezone == "Europe/Prague" ||
      var.timezone == "Europe/Riga" ||
      var.timezone == "Europe/Rome" ||
      var.timezone == "Europe/Samara" ||
      var.timezone == "Europe/Sofia" ||
      var.timezone == "Europe/Stockholm" ||
      var.timezone == "Europe/Tallinn" ||
      var.timezone == "Europe/Tirane" ||
      var.timezone == "Europe/Vienna" ||
      var.timezone == "Europe/Vilnius" ||
      var.timezone == "Europe/Warsaw" ||
      var.timezone == "Europe/Zurich" ||
      var.timezone == "Indian/Chagos" ||
      var.timezone == "Indian/Christmas" ||
      var.timezone == "Indian/Cocos" ||
      var.timezone == "Indian/Kerguelen" ||
      var.timezone == "Indian/Mahe" ||
      var.timezone == "Indian/Maldives" ||
      var.timezone == "Indian/Mauritius" ||
      var.timezone == "Indian/Reunion" ||
      var.timezone == "Pacific/Apia" ||
      var.timezone == "Pacific/Auckland" ||
      var.timezone == "Pacific/Chuuk" ||
      var.timezone == "Pacific/Easter" ||
      var.timezone == "Pacific/Efate" ||
      var.timezone == "Pacific/Enderbury" ||
      var.timezone == "Pacific/Fakaofo" ||
      var.timezone == "Pacific/Fiji" ||
      var.timezone == "Pacific/Funafuti" ||
      var.timezone == "Pacific/Galapagos" ||
      var.timezone == "Pacific/Gambier" ||
      var.timezone == "Pacific/Guadalcanal" ||
      var.timezone == "Pacific/Guam" ||
      var.timezone == "Pacific/Honolulu" ||
      var.timezone == "Pacific/Kiritimati" ||
      var.timezone == "Pacific/Kosrae" ||
      var.timezone == "Pacific/Kwajalein" ||
      var.timezone == "Pacific/Majuro" ||
      var.timezone == "Pacific/Marquesas" ||
      var.timezone == "Pacific/Nauru" ||
      var.timezone == "Pacific/Niue" ||
      var.timezone == "Pacific/Norfolk" ||
      var.timezone == "Pacific/Noumea" ||
      var.timezone == "Pacific/Pago_Pago" ||
      var.timezone == "Pacific/Palau" ||
      var.timezone == "Pacific/Pitcairn" ||
      var.timezone == "Pacific/Pohnpei" ||
      var.timezone == "Pacific/Port_Moresby" ||
      var.timezone == "Pacific/Rarotonga" ||
      var.timezone == "Pacific/Tahiti" ||
      var.timezone == "Pacific/Tarawa" ||
      var.timezone == "Pacific/Tongatapu" ||
      var.timezone == "Pacific/Wake" ||
      var.timezone == "Pacific/Wallis"
    )
    error_message = "Please Validate that you have input a valid timezone. For a List of supported timezones see the following URL.\r\n https://github.com/terraform-cisco-modules/terraform-intersight-imm/blob/master/modules/policies_ntp/README.md."
  }
}


#______________________________________________
#
# SNMP Policy Variables
#______________________________________________

variable "snmp_auth_password" {
  default     = ""
  description = "SNMP User Authentication Password."
  sensitive   = true
  type        = string
}

variable "snmp_community" {
  default     = ""
  description = "The default SNMPv1, SNMPv2c community name or SNMPv3 username to include on any trap messages sent to the SNMP host. The name can be 18 characters long."
  sensitive   = true
  type        = string
}

variable "snmp_policy" {
  default     = ""
  description = "Intersight SNMP Policy Name.  Default name is {organization}"
  type        = string
}

variable "snmp_trap_destinations" {
  default     = []
  description = "SNMP Trap Destinations Settings."
  type        = list(map(string))
}

variable "snmp_users" {
  default     = []
  description = "List of SNMP User Settings."
  type        = list(map(string))
}

variable "system_contact" {
  default     = ""
  description = "SNMP System Contact."
  type        = string
}

variable "system_location" {
  default     = ""
  description = "SNMP System Location."
  type        = string
}

variable "trap_community" {
  default     = ""
  description = "The default SNMPv1, SNMPv2c community name or SNMPv3 username to include on any trap messages sent to the SNMP host. The name can be 18 characters long."
  sensitive   = true
  type        = string
}

#______________________________________________
#
# Syslog Policy Variables
#______________________________________________

variable "syslog_destinations" {
  default     = []
  description = "Configure up to 2 remote syslog servers."
  type        = list(map(string))
}

variable "syslog_policy" {
  default     = ""
  description = "Intersight Syslog Policy Name.  Default name is {organization}"
  type        = string
}

variable "syslog_severity" {
  default     = "warning"
  description = "Lowest level of messages to be included in the local log.\r\n * warning - Use logging level warning for logs classified as warning.\r\n * emergency - Use logging level emergency for logs classified as emergency.\r\n * alert - Use logging level alert for logs classified as alert.\r\n * critical - Use logging level critical for logs classified as critical.\r\n * error - Use logging level error for logs classified as error.\r\n * notice - Use logging level notice for logs classified as notice.\r\n * informational - Use logging level informational for logs classified as informational.\r\n * debug - Use logging level debug for logs classified as debug."
  type        = string
}


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
