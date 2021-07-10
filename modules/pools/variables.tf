#__________________________________________________________
#
# Intersight Provider Variables
#__________________________________________________________

variable "apikey" {
  description = "Intersight API Key."
  sensitive   = true
  type        = string
}

variable "secretkey" {
  description = "Intersight Secret Key."
  sensitive   = true
  type        = string
}

#______________________________________________
#
# Intersight Pool Names
#______________________________________________

variable "ip_pool" {
  default     = ""
  description = "Intersight IP Pool Name.  Default name is {organization}_ip_pool"
  type        = string
}
output "ip_pool" {
  description = "IP Pool Policy Name."
  value       = var.ip_pool != "" ? var.ip_pool : join("_", [var.organization, "ip_pool"])
}

variable "iqn_pool_a" {
  default     = ""
  description = "Intersight IQN Pool A Name.  Default name is {organization}_iqn_pool_a"
  type        = string
}
output "iqn_pool_a" {
  description = "IQN Pool A Policy Name."
  value       = var.iqn_pool_a != "" ? var.iqn_pool_a : join("_", [var.organization, "iqn_pool_a"])
}

variable "iqn_pool_b" {
  default     = ""
  description = "Intersight IQN Pool B Name.  Default name is {organization}_iqn_pool_b"
  type        = string
}
output "iqn_pool_b" {
  description = "IQN Pool B Policy Name."
  value       = var.iqn_pool_b != "" ? var.iqn_pool_b : join("_", [var.organization, "iqn_pool_b"])
}

variable "mac_pool_a" {
  default     = ""
  description = "MAC Pool A Policy Name.  Default name is {organization}_mac_pool_a."
  type        = string
}
output "mac_pool_a" {
  description = "MAC Pool A Policy Name."
  value       = var.mac_pool_a != "" ? var.mac_pool_a : join("_", [var.organization, "mac_pool_a"])
}

variable "mac_pool_b" {
  default     = ""
  description = "MAC Pool B Policy Name.  Default name is {organization}_mac_pool_b."
  type        = string
}
output "mac_pool_b" {
  description = "MAC Pool B Policy Name."
  value       = var.mac_pool_b != "" ? var.mac_pool_b : join("_", [var.organization, "mac_pool_b"])
}

variable "uuid_pool" {
  default     = ""
  description = "Intersight UUID Pool Name.  Default name is {organization}_uuid_pool"
  type        = string
}
output "uuid_pool" {
  description = "IP Pool Policy Name."
  value       = var.uuid_pool != "" ? var.uuid_pool : join("_", [var.organization, "uuid_pool"])
}

variable "wwnn_pool" {
  default     = ""
  description = "WWNN Pool Policy Name.  Default name is {organization}_wwnnpool."
  type        = string
}
output "wwnn_pool" {
  description = "WWNN Pool Policy Name."
  value       = var.wwpn_pool_a != "" ? var.wwpn_pool_a : join("_", [var.organization, "wwnnpool"])
}

variable "wwpn_pool_a" {
  default     = ""
  description = "WWPN Pool A Policy Name.  Default name is {organization}_wwpnpool_a."
  type        = string
}
output "wwpn_pool_a" {
  description = "WWPN Pool A Policy Name."
  value       = var.wwpn_pool_a != "" ? var.wwpn_pool_a : join("_", [var.organization, "wwpnpool_a"])
}

variable "wwpn_pool_b" {
  default     = ""
  description = "WWPN Pool B Policy Name.  Default name is {organization}_wwpnpool_b."
  type        = string
}
output "wwpn_pool_b" {
  description = "WWPN Pool B Policy Name."
  value       = var.wwpn_pool_b != "" ? var.wwpn_pool_b : join("_", [var.organization, "wwpnpool_b"])
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
