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

variable "organization" {
  default     = "default"
  description = "Intersight Organization Name."
  type        = string
}

variable "tags" {
  default     = []
  description = "List of Key/Value Pairs to Assign as Attributes to the Policy."
  type        = list(map(string))
}


#__________________________________________________________
#
# Intersight UCS Domain Profile Variables
#__________________________________________________________

#______________________________________________
#
# UCS Domain Variables
#______________________________________________

variable "assign_domain" {
  default     = true
  description = "Flag to Assign Policies to Domain or not."
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
  default     = []
  description = "List of IPv6 DNS Server(s) for Deployment.  Can be one or two servers."
  type        = list(string)
}

variable "dynamic_dns" {
  default     = false
  description = "Flag to Enable or Disable Dynamic DNS on the Policy.  Meaning obtain DNS Servers from DHCP Service."
  type        = bool
}

variable "ipv6_enable" {
  default     = false
  description = "Flag to Enable or Disable IPv6 for the deployment."
  type        = bool
}

variable "update_domain" {
  default     = ""
  description = "Name of the Domain to Update when using Dynamic DNS for the Policy."
  type        = string
}

#______________________________________________
#
# Flow Control Policy Variables
#______________________________________________

variable "flow_control_policy" {
  default     = ""
  description = "Intersight Flow Control Policy Name.  Default name is {organization}"
  type        = string
}

#______________________________________________
#
# Link Aggregation Policy Variables
#______________________________________________

variable "link_aggregation_policy" {
  default     = ""
  description = "Intersight Link Aggregation Policy Name.  Default name is {organization}"
  type        = string
}


#______________________________________________
#
# Link Control Policy Variables
#______________________________________________

variable "link_control_policy" {
  default     = ""
  description = "Intersight Link Control Policy Name.  Default name is {organization}"
  type        = string
}

#______________________________________________
#
# Multicast Policy Variables
#______________________________________________

variable "multicast_policy" {
  default     = ""
  description = "Intersight Multicast Policy Name.  Default name is {organization}"
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
  description = "List of NTP Server for Deployment."
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

#__________________________________________________________
#
# Port Policy Variables
#__________________________________________________________

variable "port_policy" {
  default     = ""
  description = "Intersight Port Policy Name.  Default name is {organization}"
  type        = string
}


#______________________________________________
#
# LAN Port-Channel Variables
#______________________________________________

variable "lan_pc_breakout_swport" {
  default     = 0
  description = "Breakout port Identifier of the Switch Interface.  When a port is not configured as a breakout port, the aggregatePortId is set to 0, and unused.  When a port is configured as a breakout port, the 'aggregatePortId' port number as labeled on the equipment, e.g. the id of the port on the switch."
  type        = number
}

variable "lan_port_channel" {
  default     = [53, 54]
  description = "List of LAN Uplinks to Configure in a Port-Channel."
  type        = list(number)
}

variable "lan_uplink_speed" {
  default     = "Auto"
  description = "Admin configured speed for the port.\r\n * Auto - Admin configurable speed AUTO ( default ).\r\n * 1Gbps - Admin configurable speed 1Gbps.\r\n * 10Gbps - Admin configurable speed 10Gbps.\r\n * 25Gbps - Admin configurable speed 25Gbps.\r\n * 40Gbps - Admin configurable speed 40Gbps.\r\n * 100Gbps - Admin configurable speed 100Gbps."
  type        = string
}

variable "lan_pc_slot_id" {
  default     = 1
  description = "Slot Identifier of the Switch/FEX/Chassis Interface."
  type        = number
}


#______________________________________________
#
# SAN Port-Channel Variables
#______________________________________________

variable "fill_pattern" {
  default     = "Idle"
  description = "Fill pattern to differentiate the configs in NPIV.\r\n * Idle - Fc Fill Pattern type Idle.\r\n * Arbff - Fc Fill Pattern type Arbff."
  type        = string
}

variable "san_pc_breakout_swport" {
  default     = 0
  description = "Breakout port Identifier of the Switch Interface.  When a port is not configured as a breakout port, the aggregatePortId is set to 0, and unused.  When a port is configured as a breakout port, the 'aggregatePortId' port number as labeled on the equipment, e.g. the id of the port on the switch."
  type        = number
}

variable "san_pc_slot_id" {
  default     = 1
  description = "Slot Identifier of the Switch/FEX/Chassis Interface."
  type        = number
}

variable "san_port_channel" {
  default     = [1, 2]
  description = "List of Ports to Assign to the SAN Port-Channel Policy."
  type        = list(number)
}

variable "san_uplink_speed" {
  default     = "16Gbps"
  description = "Admin configured speed for the port.\r\n * Auto - Admin configurable speed AUTO ( default ).\r\n * 8Gbps - Admin configurable speed 8Gbps.\r\n * 16Gbps - Admin configurable speed 16Gbps.\r\n * 32Gbps - Admin configurable speed 32Gbps."
  type        = string
}


#______________________________________________
#
# Server Port Variables
#______________________________________________

variable "server_ports" {
  default     = "5-18"
  description = "List of Ports to Configure as Server Ports.\r\nNote: Ports 1-4 will be assigned as Fibre Channel ports.  So the list must start after 5"
  type        = string
  # validation {
  #   condition = (
  #     tonumber(element(split("-", var.server_port_range),0)) >= 5 &&
  #     tonumber(element(split("-", var.server_port_range),0)) <= 96 &&
  #     tonumber(element(split("-", var.server_port_range),1)) >= 6 &&
  #     tonumber(element(split("-", var.server_port_range),1)) <= 96
  #   )
  #   error_message = "The Server port range must start with 5 or more and end with 96 or less."
  # }
}


#______________________________________________
#
# SNMP Policy Variables
#______________________________________________

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
  default = "warning"
  description = "Lowest level of messages to be included in the local log.\r\n * warning - Use logging level warning for logs classified as warning.\r\n * emergency - Use logging level emergency for logs classified as emergency.\r\n * alert - Use logging level alert for logs classified as alert.\r\n * critical - Use logging level critical for logs classified as critical.\r\n * error - Use logging level error for logs classified as error.\r\n * notice - Use logging level notice for logs classified as notice.\r\n * informational - Use logging level informational for logs classified as informational.\r\n * debug - Use logging level debug for logs classified as debug."
  type = string
}

#______________________________________________
#
# Switch Control Policy Variables
#______________________________________________

variable "switch_control_policy" {
  default     = ""
  description = "Intersight Switch Control Policy Name.  Default name is {organization}"
  type        = string
}

variable "mac_aging_option" {
  default     = "Default"
  description = "his specifies one of the option to configure the MAC address aging time.\r\n * Default - This option sets the default MAC address aging time to 14500 seconds for End Host mode.\r\n * Custom - This option allows the the user to configure the MAC address aging time on the switch. For Switch Model UCS-FI-6454 or higher, the valid range is 120 to 918000 seconds and the switch will set the lower multiple of 5 of the given time.\r\n * Never - This option disables the MAC address aging process and never allows the MAC address entries to get removed from the table."
  type        = string
}

variable "mac_aging_time" {
  default     = 14500
  description = "Define the MAC address aging time in seconds.  Range is between 120 to 918000, in multiples of 5, when mac_aging_option is set to Custom."
  type        = string
}

variable "udld_message_interval" {
  default     = 15
  description = "Configures the time between UDLD probe messages on ports that are in advertisement mode and arecurrently determined to be bidirectional.  Valid values are from 7 to 90 seconds."
  type        = number
}

variable "udld_recovery_action" {
  default     = "reset"
  description = "UDLD recovery when enabled, attempts to bring an UDLD error-disabled port out of reset.\r\n * none - No action is taken when a port has been disabled.\r\n * reset - The switch will attempt to bring a UDLD error-disabled port back online."
  type        = string
}

variable "vlan_optimization" {
  default     = true
  description = "To enable or disable the VLAN port count optimization."
  type        = bool
}

#______________________________________________
#
# System QoS Policy Variables
#______________________________________________

variable "system_qos_policy" {
  default     = ""
  description = "Intersight System QoS Policy Name.  Default name is {organization}"
  type        = string
}

variable "best_effort_admin_state" {
  default     = "Enabled"
  description = "Best Effort Class Admin State.  Options are {Disabled|Enabled}"
  type        = string
}

variable "best_effort_bandwidth" {
  default     = 50
  description = "Best Effort Class Bandwidth Percentage.  Range is 0-100."
  type        = number
}

variable "best_effort_mtu" {
  default     = 9216
  description = "Best Effort Class - MTU.  Range is 1500-9216."
  type        = number
}

variable "best_effort_multicast_optimize" {
  default     = false
  description = "Best Effort Class - Multicast Optimize."
  type        = bool
}

variable "best_effort_weight" {
  default     = 5
  description = "Best Effort Class - The weight of the QoS Class controls the distribution of bandwidth between QoS Classes, with the same priority after the Guarantees for the QoS Classes are reached.\r\n Range is 0-10."
  type        = number
}

variable "bronze_admin_state" {
  default     = "Disabled"
  description = "Bronze Class Admin State.  Options are {Disabled|Enabled}"
  type        = string
}

variable "bronze_bandwidth" {
  default     = 0
  description = "Bronze Class Bandwidth Percentage.  Range is 0-100."
  type        = number
}

variable "bronze_cos" {
  default     = 1
  description = "Bronze Class - Class of service received by the traffic tagged with this QoS.  Range is 0-6."
  type        = number
}

variable "bronze_mtu" {
  default     = 9216
  description = "Bronze Class - MTU.  Range is 1500-9216."
  type        = number
}

variable "bronze_multicast_optimize" {
  default     = false
  description = "Bronze Class - Multicast Optimize."
  type        = bool
}

variable "bronze_packet_drop" {
  default     = true
  description = "Bronze Class - If enabled, this QoS class will allow packet drops within an acceptable limit."
  type        = bool
}

variable "bronze_weight" {
  default     = 7
  description = "Bronze Class - The weight of the QoS Class controls the distribution of bandwidth between QoS Classes, with the same priority after the Guarantees for the QoS Classes are reached.\r\n Range is 0-10."
  type        = number
}

variable "fc_bandwidth" {
  default     = 50
  description = "FC Class Bandwidth Percentage.  Range is 0-100."
  type        = number
}

variable "fc_weight" {
  default     = 5
  description = "FC Class - The weight of the QoS Class controls the distribution of bandwidth between QoS Classes, with the same priority after the Guarantees for the QoS Classes are reached.\r\n Range is 0-10."
  type        = number
}

variable "gold_admin_state" {
  default     = "Disabled"
  description = "Gold Class Admin State.  Options are {Disabled|Enabled}"
  type        = string
}

variable "gold_bandwidth" {
  default     = 0
  description = "Gold Class Bandwidth Percentage.  Range is 0-100."
  type        = number
}

variable "gold_cos" {
  default     = 4
  description = "Gold Class - Class of service received by the traffic tagged with this QoS.  Range is 0-6."
  type        = number
}

variable "gold_mtu" {
  default     = 9216
  description = "Gold Class - MTU.  Range is 1500-9216."
  type        = number
}

variable "gold_multicast_optimize" {
  default     = false
  description = "Gold Class - Multicast Optimize."
  type        = bool
}

variable "gold_packet_drop" {
  default     = true
  description = "Gold Class - If enabled, this QoS class will allow packet drops within an acceptable limit."
  type        = bool
}

variable "gold_weight" {
  default     = 9
  description = "Gold Class - The weight of the QoS Class controls the distribution of bandwidth between QoS Classes, with the same priority after the Guarantees for the QoS Classes are reached.\r\n Range is 0-10."
  type        = number
}

variable "platinum_admin_state" {
  default     = "Disabled"
  description = "Platinum Class Admin State.  Options are {Disabled|Enabled}"
  type        = string
}

variable "platinum_bandwidth" {
  default     = 0
  description = "Platinum Class Bandwidth Percentage.  Range is 0-100."
  type        = number
}

variable "platinum_cos" {
  default     = 5
  description = "Platinum Class - Class of service received by the traffic tagged with this QoS.  Range is 0-6."
  type        = number
}

variable "platinum_mtu" {
  default     = 9216
  description = "Platinum Class - MTU.  Range is 1500-9216."
  type        = number
}

variable "platinum_multicast_optimize" {
  default     = false
  description = "Platinum Class - Multicast Optimize."
  type        = bool
}

variable "platinum_packet_drop" {
  default     = true
  description = "Platinum Class - If enabled, this QoS class will allow packet drops within an acceptable limit."
  type        = bool
}

variable "platinum_weight" {
  default     = 10
  description = "Platinum Class - The weight of the QoS Class controls the distribution of bandwidth between QoS Classes, with the same priority after the Guarantees for the QoS Classes are reached.\r\n Range is 0-10."
  type        = number
}

variable "silver_admin_state" {
  default     = "Disabled"
  description = "Silver Class Admin State.  Options are {Disabled|Enabled}"
  type        = string
}

variable "silver_bandwidth" {
  default     = 0
  description = "Silver Class Bandwidth Percentage.  Range is 0-100."
  type        = number
}

variable "silver_cos" {
  default     = 2
  description = "Silver Class - Class of service received by the traffic tagged with this QoS.  Range is 0-6."
  type        = number
}

variable "silver_mtu" {
  default     = 9216
  description = "Silver Class - MTU.  Range is 1500-9216."
  type        = number
}

variable "silver_multicast_optimize" {
  default     = false
  description = "Silver Class - Multicast Optimize."
  type        = bool
}

variable "silver_packet_drop" {
  default     = true
  description = "Silver Class - If enabled, this QoS class will allow packet drops within an acceptable limit."
  type        = bool
}

variable "silver_weight" {
  default     = 8
  description = "Silver Class - The weight of the QoS Class controls the distribution of bandwidth between QoS Classes, with the same priority after the Guarantees for the QoS Classes are reached.\r\n Range is 0-10."
  type        = number
}


#______________________________________________
#
# VLAN Variables
#______________________________________________

variable "native_vlan" {
  default     = 1
  description = "Native VLAN ID for the Domain.  Note: Exclude this VLAN from your domain_vlan_list Below."
  type        = number
}

variable "vlan_list" {
  default     = "2-5,7-10"
  description = "List of VLANs to add to the Domain.\r\n  Important Note: Make sure to exclude the Native domain_native_vlan and VSANs for Fabric_A/Fabric_B as the FCoE VLAN will be the same as the VSAN ID."
  type        = string
}

variable "vlan_policy" {
  default     = ""
  description = "Intersight VLAN Policy Name.  Default name is {organization}"
  type        = string
}


#______________________________________________
#
# VSAN Variables
#______________________________________________

variable "vsan_fabric_a" {
  default     = 100
  description = "VSAN to Assign to Fabric A."
  type        = number
#  validation {
#    condition = [for s in var.vlan_list: s == var.vsan_fabric_a]
#    error_message = "The VSAN must not be in the VLAN list."
#  }
}

variable "vsan_fabric_b" {
  default     = 200
  description = "VSAN to Assign to Fabric B."
  type        = number
#  validation {
#    condition = [for s in var.vlan_list: s == var.vsan_fabric_b]
#    error_message = "The VSAN must not be in the VLAN list."
#  }
}

variable "vsan_policy" {
  default     = ""
  description = "Intersight VSAN Policy Name.  Default name is {organization}"
  type        = string
}

variable "tfc_variables" {
  description = "Object Map of Variables to Assign to the Domain Profile."
  type        = object({
    dns_policy                      = optional(string)
    dns_servers_v4                  = optional(list(string))
    dns_servers_v6                  = optional(list(string))
    dynamic_dns                     = optional(bool)
    ipv6_enable                     = optional(bool)
    update_domain                   = optional(string)
    ntp_policy                      = optional(string)
    ntp_servers                     = optional(string)
    timezone                        = optional(string)
    port_policy                     = optional(string)
    lan_port_channel                = optional(list(number))
    lan_pc_breakout_swport          = optional(number)
    lan_pc_slot_id                  = optional(number)
    lan_uplink_speed                = optional(string)
    san_port_channel                = optional(list(number))
    fill_pattern                    = optional(string)
    san_pc_breakout_swport          = optional(number)
    san_pc_slot_id                  = optional(number)
    san_uplink_speed                = optional(string)
    server_ports                    = optional(string)
    snmp_policy                     = optional(string)
    snmp_trap_destinations          = optional(list(map(string)))
    snmp_users                      = optional(list(map(string)))
    system_contact                  = optional(string)
    system_location                 = optional(string)
    switch_control_policy           = optional(string)
    mac_aging_option                = optional(string)
    mac_aging_time                  = optional(number)
    udld_message_interval           = optional(number)
    udld_recovery_action            = optional(string)
    vlan_optimization               = optional(bool)
    syslog_policy                   = optional(string)
    syslog_destinations             = optional(list(map(string)))
    syslog_severity                 = optional(string)
    system_qos_policy               = optional(string)
    best_effort_admin_state         = optional(string)
    best_effort_bandwidth           = optional(number)
    best_effort_mtu                 = optional(number)
    best_effort_multicast_optimize  = optional(bool)
    best_effort_weight              = optional(number)
    bronze_admin_state              = optional(string)
    bronze_bandwidth                = optional(number)
    bronze_cos                      = optional(number)
    bronze_mtu                      = optional(number)
    bronze_multicast_optimize       = optional(bool)
    bronze_packet_drop              = optional(bool)
    bronze_weight                   = optional(number)
    fc_bandwidth                    = optional(number)
    fc_weight                       = optional(number)
    gold_admin_state                = optional(string)
    gold_bandwidth                  = optional(number)
    gold_cos                        = optional(number)
    gold_mtu                        = optional(number)
    gold_multicast_optimize         = optional(bool)
    gold_packet_drop                = optional(bool)
    gold_weight                     = optional(number)
    platinum_admin_state            = optional(string)
    platinum_bandwidth              = optional(number)
    platinum_cos                    = optional(number)
    platinum_mtu                    = optional(number)
    platinum_multicast_optimize     = optional(bool)
    platinum_packet_drop            = optional(bool)
    platinum_weight                 = optional(number)
    silver_admin_state              = optional(string)
    silver_bandwidth                = optional(number)
    silver_cos                      = optional(number)
    silver_mtu                      = optional(number)
    silver_multicast_optimize       = optional(bool)
    silver_packet_drop              = optional(bool)
    silver_weight                   = optional(number)
    vlan_policy                     = optional(string)
    native_vlan                     = optional(number)
    vlan_list                       = optional(string)
    vsan_policy                     = optional(string)
    vsan_fabric_a                   = optional(number)
    vsan_fabric_b                   = optional(number)
  })
}

