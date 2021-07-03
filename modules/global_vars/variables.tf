locals {
  vlan_split = length(regexall("-", var.vlan_list)) > 0 ? tolist(split(",", var.vlan_list)) : tolist(var.vlan_list)
  vlan_lists = [for s in local.vlan_split : length(regexall("-", s)) > 0 ? [
    for v in range(tonumber(element(split("-", s), 0)),(tonumber(element(split("-", s), 1))+1)): tonumber(v)] : [s]
  ]
  flattened_vlan_list = flatten(local.vlan_lists)

}

#__________________________________________________________
#
# Intersight Provider Variables
#__________________________________________________________

variable "endpoint" {
  default     = "https://intersight.com"
  description = "Intersight URL."
  type        = string
}
output "endpoint" {
  description = "Intersight URL."
  value       = var.endpoint
}

#__________________________________________________________
#
# Intersight Organization Variables
#__________________________________________________________

variable "organization" {
  default     = "default"
  description = "Intersight Organization Name."
  type        = string
}
output "organization" {
  description = "Intersight Organization Name."
  value       = var.organization
}

#______________________________________________
#
# DNS Variables
#______________________________________________

variable "domain_name" {
  default     = "cisco.com"
  description = "Domain Name for Deployment."
  type        = string
}
output "domain_name" {
  description = "Domain Name for Deployment."
  value       = var.domain_name
}

variable "dns_servers_v4" {
  default     = ["208.67.222.222", "208.67.220.220"]
  description = "List of IPv4 DNS Server(s) for Deployment.  Can be one or two servers."
  type        = list(string)
}
output "dns_servers_v4" {
  description = "List of IPv4 DNS Server(s) for Deployment."
  value       = var.dns_servers_v4
}

#______________________________________________
#
# Time Variables
#______________________________________________

variable "ntp_servers" {
  default     = ["time-a-g.nist.gov", "time-b-g.nist.gov"]
  description = "List of NTP Server for Deployment.  If undefined then the dns_servers will be used."
  type        = list(string)
}
output "ntp_servers" {
  description = "List of NTP Server for Deployment."
  value       = length(var.ntp_servers) != 0 ? var.ntp_servers : var.dns_servers_v4
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
output "timezone" {
  description = "Timezone for Deployment."
  value       = var.timezone
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
output "Cluster_ID" {
  description = "Intersight Cluster Identifier."
  value       = var.Cluster_ID
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
output "Organization_ID" {
  description = "Intersight Organization Identifier."
  value       = var.Organization_ID
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
  description = "Intersight Site Identifier."
  value       = var.Site_ID
}


variable "cluster_prefix" {
  default     = "easyimm"
  description = "The cluster prefix will be used for policy, pools, cluster, and service-profile naming.  Typically the UCS Cluster Name would be good to use for this."
  type        = string
}
output "cluster_prefix" {
  description = "Intersight Cluster Prefix."
  value       = var.cluster_prefix
}

#______________________________________________
#
# Intersight IP Pool Variables
#______________________________________________

variable "ip_pool_gateway" {
  default     = "198.18.0.1/24"
  description = "IP Pool Gateway/Prefix."
  type        = string
  validation {
    condition = (
      tonumber(element(split(".", var.ip_pool_gateway),0)) >= 0 &&
      tonumber(element(split(".", var.ip_pool_gateway),0)) <= 223 &&
      tonumber(element(split(".", var.ip_pool_gateway),1)) >= 0 &&
      tonumber(element(split(".", var.ip_pool_gateway),1)) <= 255 &&
      tonumber(element(split(".", var.ip_pool_gateway),2)) >= 0 &&
      tonumber(element(split(".", var.ip_pool_gateway),2)) <= 255 &&
      tonumber(element(split(".", (element(split("/", var.ip_pool_gateway),0))),3)) >= 1 &&
      tonumber(element(split(".", (element(split("/", var.ip_pool_gateway),0))),3)) <= 254 &&
      tonumber(element(split("/", var.ip_pool_gateway),1)) >= 1 &&
      tonumber(element(split("/", var.ip_pool_gateway),1)) <= 30
    )
    error_message = "The ip_pool_gateway must be in the format X.X.X.X/X."
  }
}
output "ip_pool_gateway" {
  description = "IP Pool Gateway."
  value       = element(split("/", var.ip_pool_gateway),0)
}
output "ip_pool_netmask" {
  description = "IP Pool Netmask Value."
  value       = element(split("/", var.ip_pool_gateway),1) == 1 ? "128.0.0.0" : element(
    split("/", var.ip_pool_gateway),1) == 2 ? "192.0.0.0" : element(
    split("/", var.ip_pool_gateway),1) == 3 ? "224.0.0.0" : element(
    split("/", var.ip_pool_gateway),1) == 4 ? "240.0.0.0" : element(
    split("/", var.ip_pool_gateway),1) == 5 ? "248.0.0.0" : element(
    split("/", var.ip_pool_gateway),1) == 6 ? "252.0.0.0" : element(
    split("/", var.ip_pool_gateway),1) == 7 ? "254.0.0.0" : element(
    split("/", var.ip_pool_gateway),1) == 8 ? "255.0.0.0" : element(
    split("/", var.ip_pool_gateway),1) == 9 ? "255.128.0.0" : element(
    split("/", var.ip_pool_gateway),1) == 10 ? "255.192.0.0" : element(
    split("/", var.ip_pool_gateway),1) == 11 ? "255.224.0.0" : element(
    split("/", var.ip_pool_gateway),1) == 12 ? "255.240.0.0" : element(
    split("/", var.ip_pool_gateway),1) == 13 ? "255.248.0.0" : element(
    split("/", var.ip_pool_gateway),1) == 14 ? "255.252.0.0" : element(
    split("/", var.ip_pool_gateway),1) == 15 ? "255.254.0.0" : element(
    split("/", var.ip_pool_gateway),1) == 16 ? "255.255.0.0" : element(
    split("/", var.ip_pool_gateway),1) == 17 ? "255.255.128.0" : element(
    split("/", var.ip_pool_gateway),1) == 18 ? "255.255.192.0" : element(
    split("/", var.ip_pool_gateway),1) == 19 ? "255.255.224.0" : element(
    split("/", var.ip_pool_gateway),1) == 20 ? "255.255.240.0" : element(
    split("/", var.ip_pool_gateway),1) == 21 ? "255.255.248.0" : element(
    split("/", var.ip_pool_gateway),1) == 22 ? "255.255.252.0" : element(
    split("/", var.ip_pool_gateway),1) == 23 ? "255.255.254.0" : element(
    split("/", var.ip_pool_gateway),1) == 24 ? "255.255.255.0" : element(
    split("/", var.ip_pool_gateway),1) == 25 ? "255.255.255.128" : element(
    split("/", var.ip_pool_gateway),1) == 26 ? "255.255.255.192" : element(
    split("/", var.ip_pool_gateway),1) == 27 ? "255.255.255.224" : element(
    split("/", var.ip_pool_gateway),1) == 28 ? "255.255.255.240" : element(
    split("/", var.ip_pool_gateway),1) == 29 ? "255.255.255.248" : "255.255.255.252"
}

variable "ip_pool_from" {
  default     = "198.18.0.2"
  description = "IP Pool Starting host address."
  type        = string
  validation {
    condition = (
      tonumber(element(split(".", var.ip_pool_from),0)) >= 0 &&
      tonumber(element(split(".", var.ip_pool_from),0)) <= 223 &&
      tonumber(element(split(".", var.ip_pool_from),1)) >= 0 &&
      tonumber(element(split(".", var.ip_pool_from),1)) <= 255 &&
      tonumber(element(split(".", var.ip_pool_from),2)) >= 0 &&
      tonumber(element(split(".", var.ip_pool_from),2)) <= 255 &&
      tonumber(element(split(".", var.ip_pool_from),3)) >= 0 &&
      tonumber(element(split(".", var.ip_pool_from),3)) <= 255
    )
    error_message = "The ip_pool_from must be in the format X.X.X.X."
  }
}
output "ip_pool_from" {
  description = "IP Pool Starting IP Value."
  value       = var.ip_pool_from
}

variable "ip_pool_size" {
  default     = "254"
  description = "IP Pool Size.  Between 1 and 254."
  type        = string
  validation {
    condition = (
      var.ip_pool_size >= 1 &&
      var.ip_pool_size <= 254
    )
    error_message = "The ip_pool_size must be in the range of 1 and 254."
  }
}
output "ip_pool_size" {
  description = "IP Pool Block Size."
  value       = var.ip_pool_size
}

#______________________________________________
#
# Intersight Pool Names
#______________________________________________

variable "ip_pool" {
  default     = ""
  description = "Intersight IP Pool Name.  Default name is {cluster_prefix}_ip_pool"
  type        = string
}
output "ip_pool" {
  description = "IP Pool Policy Name."
  value       = var.ip_pool != "" ? var.ip_pool : join("_", [var.cluster_prefix, "ip_pool"])
}

variable "iqn_pool_a" {
  default     = ""
  description = "Intersight IQN Pool A Name.  Default name is {cluster_prefix}_iqn_pool_a"
  type        = string
}
output "iqn_pool_a" {
  description = "IQN Pool A Policy Name."
  value       = var.iqn_pool_a != "" ? var.iqn_pool_a : join("_", [var.cluster_prefix, "iqn_pool_a"])
}

variable "iqn_pool_b" {
  default     = ""
  description = "Intersight IQN Pool B Name.  Default name is {cluster_prefix}_iqn_pool_b"
  type        = string
}
output "iqn_pool_b" {
  description = "IQN Pool B Policy Name."
  value       = var.iqn_pool_b != "" ? var.iqn_pool_b : join("_", [var.cluster_prefix, "iqn_pool_b"])
}

variable "mac_pool_a" {
  default     = ""
  description = "MAC Pool A Policy Name.  Default name is {cluster_prefix}_mac_pool_a."
  type        = string
}
output "mac_pool_a" {
  description = "MAC Pool A Policy Name."
  value       = var.mac_pool_a != "" ? var.mac_pool_a : join("_", [var.cluster_prefix, "mac_pool_a"])
}

variable "mac_pool_b" {
  default     = ""
  description = "MAC Pool B Policy Name.  Default name is {cluster_prefix}_mac_pool_b."
  type        = string
}
output "mac_pool_b" {
  description = "MAC Pool B Policy Name."
  value       = var.mac_pool_b != "" ? var.mac_pool_b : join("_", [var.cluster_prefix, "mac_pool_b"])
}

variable "uuid_pool" {
  default     = ""
  description = "Intersight UUID Pool Name.  Default name is {cluster_prefix}_uuid_pool"
  type        = string
}
output "uuid_pool" {
  description = "IP Pool Policy Name."
  value       = var.uuid_pool != "" ? var.uuid_pool : join("_", [var.cluster_prefix, "uuid_pool"])
}

variable "wwnn_pool" {
  default     = ""
  description = "WWNN Pool Policy Name.  Default name is {cluster_prefix}_wwnnpool."
  type        = string
}
output "wwnn_pool" {
  description = "WWNN Pool Policy Name."
  value       = var.wwpn_pool_a != "" ? var.wwpn_pool_a : join("_", [var.cluster_prefix, "wwnnpool"])
}

variable "wwpn_pool_a" {
  default     = ""
  description = "WWPN Pool A Policy Name.  Default name is {cluster_prefix}_wwpnpool_a."
  type        = string
}
output "wwpn_pool_a" {
  description = "WWPN Pool A Policy Name."
  value       = var.wwpn_pool_a != "" ? var.wwpn_pool_a : join("_", [var.cluster_prefix, "wwpnpool_a"])
}

variable "wwpn_pool_b" {
  default     = ""
  description = "WWPN Pool B Policy Name.  Default name is {cluster_prefix}_wwpnpool_b."
  type        = string
}
output "wwpn_pool_b" {
  description = "WWPN Pool B Policy Name."
  value       = var.wwpn_pool_b != "" ? var.wwpn_pool_b : join("_", [var.cluster_prefix, "wwpnpool_b"])
}

#______________________________________________
#
# Intersight Policy Names
#______________________________________________

variable "flowctrl_policy" {
  default     = ""
  description = "Intersight NTP Policy Name.  Default name is {cluster_prefix}_flowctrl"
  type        = string
}
output "flowctrl_policy" {
  description = "Intersight NTP Policy Name."
  value       = var.flowctrl_policy != "" ? var.flowctrl_policy : join("_", [var.cluster_prefix, "flowctrl"])
}

variable "linkagg_policy" {
  default     = ""
  description = "Intersight Link Aggregation Policy Name.  Default name is {cluster_prefix}_linkagg"
  type        = string
}
output "linkagg_policy" {
  description = "Intersight Link Aggregation Policy Name."
  value       = var.linkagg_policy != "" ? var.linkagg_policy : join("_", [var.cluster_prefix, "linkagg"])
}

variable "linkctrl_policy" {
  default     = ""
  description = "Intersight Link Control Policy Name.  Default name is {cluster_prefix}_linkctrl"
  type        = string
}
output "linkctrl_policy" {
  description = "Intersight Link Control Policy Name."
  value       = var.linkctrl_policy != "" ? var.linkctrl_policy : join("_", [var.cluster_prefix, "linkctrl"])
}

variable "multicast_policy" {
  default     = ""
  description = "Intersight Multicast Policy Name.  Default name is {cluster_prefix}_multicast"
  type        = string
}
output "multicast_policy" {
  description = "Intersight Multicast Policy Name."
  value       = var.multicast_policy != "" ? var.multicast_policy : join("_", [var.cluster_prefix, "multicast"])
}

variable "netconn_policy" {
  default     = ""
  description = "Intersight Network Connectivity (DNS) Policy Name.  Default name is {cluster_prefix}_dns"
  type        = string
}
output "netconn_policy" {
  description = "Intersight Network Connectivity (DNS) Policy Name."
  value       = var.netconn_policy != "" ? var.netconn_policy : join("_", [var.cluster_prefix, "dns"])
}

variable "ntp_policy" {
  default     = ""
  description = "Intersight NTP Policy Name.  Default name is {cluster_prefix}_ntp"
  type        = string
}
output "ntp_policy" {
  description = "Intersight NTP Policy Name."
  value       = var.ntp_policy != "" ? var.ntp_policy : join("_", [var.cluster_prefix, "ntp"])
}

variable "port_policy" {
  default     = ""
  description = "Intersight Port Policy Name.  Default name is {cluster_prefix}_ports"
  type        = string
}
output "port_policy" {
  description = "Intersight Port Policy Name."
  value       = var.port_policy != "" ? var.port_policy : join("_", [var.cluster_prefix, "ports"])
}

variable "snmp_policy" {
  default     = ""
  description = "Intersight SNMP Policy Name.  Default name is {cluster_prefix}_snmp"
  type        = string
}
output "snmp_policy" {
  description = "Intersight SNMP Policy Name."
  value       = var.snmp_policy != "" ? var.snmp_policy : join("_", [var.cluster_prefix, "snmp"])
}

variable "swctrl_policy" {
  default     = ""
  description = "Intersight Switch Control Policy Name.  Default name is {cluster_prefix}_swctrl"
  type        = string
}
output "swctrl_policy" {
  description = "Intersight Switch Control Policy Name."
  value       = var.swctrl_policy != "" ? var.swctrl_policy : join("_", [var.cluster_prefix, "swctrl"])
}

variable "syslog_policy" {
  default     = ""
  description = "Intersight Syslog Policy Name.  Default name is {cluster_prefix}_syslog"
  type        = string
}
output "syslog_policy" {
  description = "Intersight Syslog Policy Name."
  value       = var.syslog_policy != "" ? var.syslog_policy : join("_", [var.cluster_prefix, "syslog"])
}

variable "systemqos_policy" {
  default     = ""
  description = "Intersight System QoS Policy Name.  Default name is {cluster_prefix}_systemqos"
  type        = string
}
output "systemqos_policy" {
  description = "Intersight System QoS Policy Name."
  value       = var.systemqos_policy != "" ? var.systemqos_policy : join("_", [var.cluster_prefix, "systemqos"])
}

variable "vlan_policy" {
  default     = ""
  description = "Intersight VLAN Policy Name.  Default name is {cluster_prefix}_vlans"
  type        = string
}
output "vlan_policy" {
  description = "Intersight VLAN Policy Name."
  value       = var.vlan_policy != "" ? var.vlan_policy : join("_", [var.cluster_prefix, "vlans"])
}

variable "vsan_policy" {
  default     = ""
  description = "Intersight VSAN Policy Name.  Default name is {cluster_prefix}_vsan"
  type        = string
}
output "vsan_policy" {
  description = "Intersight VSAN Policy Name."
  value       = var.vsan_policy != "" ? var.vsan_policy : join("_", [var.cluster_prefix, "vsan"])
}


#______________________________________________
#
# Intersight UCS Domain Variables
#______________________________________________

variable "device_model" {
  default     = "6454"
  description = "Model of Fabric Interconnect.  Supported Options are {6454|64108}."
  type        = string
}
output "device_model" {
  description = "Model of the Fabric Interconnect."
  value       = var.device_model == "6454" ? "UCS-FI-6454" : "UCS-FI-64108"
}

variable "serial_a" {
  description = "Serial Number of Fabric Interconnect A."
  type        = string
}
output "serial_a" {
  description = "Serial Number of Fabric Interconnect A."
  value       = var.serial_a
}

variable "serial_b" {
  description = "Serial Number of Fabric Interconnect B."
  type        = string
}
output "serial_b" {
  description = "Serial Number of Fabric Interconnect B."
  value       = var.serial_b
}

variable "server_port_range" {
  default     = "5-18"
  description = "Range of Ports to Configure as Server Ports.\r\nNote: Ports 1-4 will be assigned as Fibre Channel ports.  So the range must start after 5"
  type        = string
  validation {
    condition = (
      tonumber(element(split("-", var.server_port_range),0)) >= 5 &&
      tonumber(element(split("-", var.server_port_range),0)) <= 96 &&
      tonumber(element(split("-", var.server_port_range),1)) >= 6 &&
      tonumber(element(split("-", var.server_port_range),1)) <= 96
    )
    error_message = "The Server port range must start with 5 or more and end with 96 or less."
  }
}
output "port_list_type" {
  description = "Port List type to Assign as Server Ports."
  value       = "range"
}
output "sp_start" {
  description = "Server Port List starting port."
  value       = tonumber(element(split("-", var.server_port_range),0))
}
output "sp_stop" {
  description = "Server Port List ending port."
  value       = tonumber(element(split("-", var.server_port_range),1))
}

variable "lan_uplink_pc_list" {
  default     = [53, 54]
  description = "List of LAN Uplinks to Configure in a Port-Channel.  Default is 53 and 54."
  type        = list(number)
}
output "lan_pc_list" {
  description = "List of LAN Uplinks to Configure in a Port-Channel."
  value       = var.lan_uplink_pc_list
}
output "lan_pc_id" {
  description = "LAN Port-Channel ID."
  value       = element(var.lan_uplink_pc_list, 0)
}

variable "san_uplink_pc_list" {
  default     = [1, 2]
  description = "List of LAN Uplinks to Configure in a Port-Channel.  Default is 1 and 2."
  type        = list(number)
}
output "san_pc_list" {
  description = "List of LAN Uplinks to Configure in a Port-Channel."
  value       = var.san_uplink_pc_list
}
output "san_pc_id" {
  description = "SAN Port-Channel ID."
  value       = element(var.san_uplink_pc_list, 0)
}

variable "native_vlan" {
  default     = 1
  description = "Native VLAN ID.  Note: Exclude this VLAN from your VLAN List Below."
  type        = number
}
output "native_vlan" {
  description = "Native VLAN ID."
  value       = var.native_vlan
}

variable "vlan_list" {
  default     = "2-5,7-10"
  description = "Important Note: Make sure to exclude the Native VLAN_ID and VSANs for Fabric_A or Fabric_B as the FCoE VLAN will be the same as the .\r\nList of VLANs to add to the Domain."
  type        = string
}
output "vlan_list" {
  description = "List of VLANs to add to the domain."
  value       = local.flattened_vlan_list
}

variable "vsan_fabric_a" {
  default     = 100
  description = "VSAN to Assign to Fabric A."
  type        = number
#  validation {
#    condition = [for s in local.flattened_vlan_list: s == var.vsan_fabric_a]
#    error_message = "The VSAN must not be in the VLAN list."
#  }
}
output "vsan_fabric_a" {
  description = "VSAN to Assign to Fabric A."
  value       = var.vsan_fabric_a
}

variable "vsan_fabric_b" {
  default     = 200
  description = "VSAN to Assign to Fabric B."
  type        = number
#  validation {
#    condition = [for s in local.flattened_vlan_list: s == var.vsan_fabric_b]
#    error_message = "The VSAN must not be in the VLAN list."
#  }
}
output "vsan_fabric_b" {
  description = "VSAN to Assign to Fabric B."
  value       = var.vsan_fabric_b
}

#______________________________________________
#
# Intersight Tag Variables
#______________________________________________

variable "tags" {
  default     = []
  description = "List of Key/Value Pairs to Assign as Attributes to the Policy."
  type        = list(map(string))
}
output "tags" {
  description = "List of Key/Value Pairs to Assign as Attributes to the Policy."
  value       = var.tags
}

