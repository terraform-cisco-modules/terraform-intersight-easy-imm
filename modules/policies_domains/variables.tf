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

#__________________________________________________________
#
# Intersight Port Policy Variables
#__________________________________________________________

#______________________________________________
#
# LAN Port-Channel Variables
#______________________________________________

variable "lan_port_channel" {
  default     = [53, 54]
  description = "List of LAN Uplinks to Configure in a Port-Channel."
  type        = list(number)
}

#______________________________________________
#
# SAN Port-Channel Variables
#______________________________________________

variable "san_port_channel" {
  default     = [1, 2]
  description = "List of SAN Uplinks to Configure in a Port-Channel."
  type        = list(number)
}

#______________________________________________
#
# Server Port Variables
#______________________________________________

variable "server_port_range" {
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
# VLAN Variables
#______________________________________________

variable "domain_native_vlan" {
  default     = 1
  description = "Native VLAN ID for the Domain.  Note: Exclude this VLAN from your domain_vlan_list Below."
  type        = number
}

variable "domain_vlan_list" {
  default     = "2-5,7-10"
  description = "List of VLANs to add to the Domain.\r\n  Important Note: Make sure to exclude the Native domain_native_vlan and VSANs for Fabric_A/Fabric_B as the FCoE VLAN will be the same as the VSAN ID."
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


#______________________________________________
#
# Intersight UCS Domain Profile Policy Names
#______________________________________________

variable "flow_control_policy" {
  default     = ""
  description = "Intersight Flow Control Policy Name.  Default name is {cluster_name}"
  type        = string
}

variable "link_aggregation_plcy" {
  default     = ""
  description = "Intersight Link Aggregation Policy Name.  Default name is {cluster_name}"
  type        = string
}

variable "link_control_policy" {
  default     = ""
  description = "Intersight Link Control Policy Name.  Default name is {cluster_name}"
  type        = string
}

variable "multicast_policy" {
  default     = ""
  description = "Intersight Multicast Policy Name.  Default name is {organization}_multicast"
  type        = string
}

variable "port_policy" {
  default     = ""
  description = "Intersight Port Policy Name.  Default name is {organization}_ports"
  type        = string
}

variable "switch_control_policy" {
  default     = ""
  description = "Intersight Switch Control Policy Name.  Default name is {organization}_swctrl"
  type        = string
}

variable "system_qos_policy" {
  default     = ""
  description = "Intersight System QoS Policy Name.  Default name is {organization}_qos"
  type        = string
}

variable "vlan_policy" {
  default     = ""
  description = "Intersight VLAN Policy Name.  Default name is {organization}_vlan"
  type        = string
}

variable "vsan_policy" {
  default     = ""
  description = "Intersight VSAN Policy Name.  Default name is {organization}_vsan"
  type        = string
}
