#__________________________________________________________
#
# Global Variables
#__________________________________________________________

variable "organization" {
  default     = "default"
  description = "Intersight Organization Name."
  type        = string
}

variable "cluster_name" {
  default     = "iks"
  description = "Intersight Kubernetes Service Cluster Name."
  type        = string
}

#______________________________________________
#
# DNS Variables
#______________________________________________

variable "domain_name" {
  default     = "demo.intra"
  description = "Domain Name for Kubernetes Sysconfig Policy."
  type        = string
}

variable "dns_servers" {
  default     = "[\"10.200.0.100\"]"
  description = "DNS Servers for Kubernetes Sysconfig Policy."
  type        = string
}

#______________________________________________
#
# Time Variables
#______________________________________________

variable "ntp_servers" {
  default     = "[]"
  description = "NTP Servers for Kubernetes Sysconfig Policy."
  type        = string
}

variable "timezone" {
  default     = "America/New_York"
  description = "Timezone for Kubernetes Sysconfig Policy."
  type        = string
}


#______________________________________________
#
# IP Pool Variables
#______________________________________________

variable "network_prefix" {
  default     = "10.200.0"
  description = "IP Pool Gateway last Octet.  The var.network_prefix will be combined with ip_pool_gateway for the Gateway Address."
  type        = string
}

variable "ip_pool_gateway" {
  default     = "254"
  description = "IP Pool Gateway last Octet.  The var.network_prefix will be combined with ip_pool_gateway for the Gateway Address."
  type        = string
}

variable "ip_pool_from" {
  default     = "20"
  description = "IP Pool Starting IP last Octet.  The var.network_prefix will be combined with ip_pool_from for the Gateway Address."
  type        = string
}

#______________________________________________
#
# Kubernetes Add-ons List
#______________________________________________

variable "addons_list" {
  default     = "[]"
  description = "List of Add-ons to be added to Cluster."
  type        = string
}

#______________________________________________
#
# Kubernetes VM Infra Policy Variables
#______________________________________________

variable "vsphere_target" {
  default     = "210"
  description = "vSphere Server registered as a Target in Intersight.  The default, 210, only works if this is for the DevNet Sandbox."
  type        = string
}

#__________________________________________________________
#
# Terraform Cloud Workspace Variables: global_vars
#__________________________________________________________

module "tfc_variables_global" {
  source = "terraform-cisco-modules/modules/tfe//modules/tfc_variables"
  depends_on = [
    module.tfc_workspaces
  ]
  category     = "terraform"
  workspace_id = module.tfc_workspaces.tfe_workspace_id.global_vars
  variable_list = [
    {
      description = "Intersight Organization."
      hcl         = false
      key         = "organization"
      sensitive   = false
      value       = var.organization
    },
    {
      description = "Domain Name."
      hcl         = false
      key         = "domain_name"
      sensitive   = false
      value       = var.domain_name
    },
    {
      description = "DNS Servers."
      hcl         = true
      key         = "dns_servers"
      sensitive   = false
      value       = var.dns_servers
    },
    {
      description = "NTP Servers."
      hcl         = true
      key         = "ntp_servers"
      sensitive   = false
      value       = var.ntp_servers
    },
    {
      description = "IKS Cluster Name."
      hcl         = false
      key         = "cluster_name"
      sensitive   = false
      value       = var.cluster_name
    },
    {
      description = "Kubernetes Add-ons Policy List."
      hcl         = true
      key         = "addons_list"
      sensitive   = false
      value       = var.addons_list
    },
    {
      description = "Network Prefix for IP Pool Policy."
      hcl         = false
      key         = "network_prefix"
      sensitive   = false
      value       = var.network_prefix
    },
    {
      description = "IP Pool Gateway last Octet."
      hcl         = false
      key         = "ip_pool_gateway"
      sensitive   = false
      value       = var.ip_pool_gateway
    },
    {
      description = "IP Pool Starting Address."
      hcl         = false
      key         = "ip_pool_from"
      sensitive   = false
      value       = var.ip_pool_from
    },
    {
      description = "HTTP Proxy Server Name or IP Address."
      hcl         = false
      key         = "proxy_http_hostname"
      sensitive   = false
      value       = var.proxy_http_hostname
    },
    {
      description = "HTTP Proxy Username."
      hcl         = false
      key         = "proxy_http_username"
      sensitive   = false
      value       = var.proxy_http_username
    },
    {
      description = "HTTPS Proxy Server Name or IP Address."
      hcl         = false
      key         = "proxy_https_hostname"
      sensitive   = false
      value       = var.proxy_https_hostname
    },
    {
      description = "HTTPS Proxy Username."
      hcl         = false
      key         = "proxy_https_username"
      sensitive   = false
      value       = var.proxy_https_username
    },
    {
      description = "vSphere Server registered as a Target in Intersight."
      hcl         = false
      key         = "vsphere_target"
      sensitive   = false
      value       = var.vsphere_target
    },
  ]
}
