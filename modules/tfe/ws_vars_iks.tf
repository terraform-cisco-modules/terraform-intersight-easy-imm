#__________________________________________________________
#
# Required Variables
#__________________________________________________________


#______________________________________________
#
# Kubernetes Network CIDR/System Policies
#______________________________________________

variable "k8s_pod_cidr" {
  default     = "100.65.0.0/16"
  description = "Pod CIDR Block to be used to assign Pod IP Addresses."
  type        = string
}

variable "k8s_service_cidr" {
  default     = "100.64.0.0/16"
  description = "Service CIDR Block used to assign Cluster Service IP Addresses."
  type        = string
}

variable "k8s_version" {
  default     = "1.19.5"
  description = "Kubernetes Version to Deploy."
  type        = string
}

#______________________________________________
#
# Kubernetes Runtime Variables
#______________________________________________

variable "docker_no_proxy" {
  default     = "[]"
  description = "Docker no proxy list, when using internet proxy.  Default is no list."
  type        = string
}

variable "proxy_http_hostname" {
  default     = ""
  description = "HTTP Proxy Server Name or IP Address."
  type        = string
}

variable "proxy_http_password" {
  default     = ""
  description = "Password for the HTTP Proxy Server, If required."
  sensitive   = true
  type        = string
}

variable "proxy_http_port" {
  default     = "8080"
  description = "Proxy HTTP Port."
  type        = string
}

variable "proxy_http_protocol" {
  default     = "http"
  description = "Proxy HTTP Protocol."
  type        = string
}

variable "proxy_http_username" {
  default     = ""
  description = "HTTP Proxy Username."
  type        = string
}

variable "proxy_https_hostname" {
  default     = ""
  description = "HTTPS Proxy Server Name or IP Address."
  type        = string
}

variable "proxy_https_password" {
  default     = ""
  description = "Password for the HTTPS Proxy Server, If required."
  sensitive   = true
  type        = string
}

variable "proxy_https_port" {
  default     = "8443"
  description = "Proxy HTTP Port."
  type        = string
}

variable "proxy_https_protocol" {
  default     = "https"
  description = "Proxy HTTP Protocol."
  type        = string
}

variable "proxy_https_username" {
  default     = ""
  description = "HTTPS Proxy Username."
  type        = string
}


#______________________________________________
#
# K8S VM Infrastructure Policy Variables
#______________________________________________
#
variable "vsphere_password" {
  description = "vSphere Password.  Note: this is the password of the Credentials used to register the vSphere Target."
  sensitive   = true
  type        = string
}

variable "vsphere_cluster" {
  default     = "hx-demo"
  description = "vSphere Cluster to assign the K8S Cluster Deployment."
  type        = string
}

variable "vsphere_datastore" {
  default     = "hx-demo-ds1"
  description = "vSphere Datastore to assign the K8S Cluster Deployment."
  type        = string
}

variable "vsphere_portgroup" {
  default     = "[Management]"
  description = "vSphere Port Group to assign the K8S Cluster Deployment."
  type        = string
}

variable "vsphere_resource_pool" {
  default     = ""
  description = "vSphere Resource Pool to assign the K8S Cluster Deployment."
  type        = string
}

#______________________________________________
#
# Trusted Registries Variables
#______________________________________________

variable "root_ca_registries" {
  default     = "[]"
  description = "List of root CA Signed Registries."
  type        = string
}

variable "unsigned_registries" {
  default     = "[]"
  description = "List of unsigned registries to be supported."
  type        = string
}

#______________________________________________
#
# Intersight Tags
#______________________________________________

variable "tags" {
  default     = "[]"
  description = "Tags to be Associated with Objects Created in Intersight."
  type        = string
}


#______________________________________________
#
# Intersight Kubernetes Cluster Variables
#______________________________________________

variable "action" {
  default     = "Deploy"
  description = "Action to perform on the Intersight Kubernetes Cluster.  Options are {Deploy|Ready|Unassign}."
  type        = string
}

variable "load_balancers" {
  default     = 3
  description = "Intersight Kubernetes Load Balancer count."
  type        = string
}

variable "ssh_user" {
  default     = "iksadmin"
  description = "Intersight Kubernetes Service Cluster Default User."
  type        = string
}

variable "ssh_key" {
  description = "Intersight Kubernetes Service Cluster SSH Public Key."
  sensitive   = false
  type        = string
}

#______________________________________________
#
# Master Node Profile Variables
#______________________________________________

variable "master_instance_type" {
  default     = "small"
  description = "K8S Master Virtual Machine Instance Type.  Options are {small|medium|large}."
  type        = string
}

variable "master_desired_size" {
  default     = 1
  description = "K8S Master Desired Cluster Size."
  type        = string
}

variable "master_max_size" {
  default     = 1
  description = "K8S Master Maximum Cluster Size."
  type        = string
}

#______________________________________________
#
# Worker Node Profile Variables
#______________________________________________

variable "worker_instance_type" {
  default     = "small"
  description = "K8S Worker Virtual Machine Instance Type.  Options are {small|medium|large}."
  type        = string
}

variable "worker_desired_size" {
  default     = 1
  description = "K8S Worker Desired Cluster Size."
  type        = string
}

variable "worker_max_size" {
  default     = 4
  description = "K8S Worker Maximum Cluster Size."
  type        = string
}


#__________________________________________________________
#
# Terraform Cloud Workspace Variables: iks
#__________________________________________________________

module "tfc_variables_iks" {
  source = "terraform-cisco-modules/modules/tfe//modules/tfc_variables"
  depends_on = [
    module.tfc_workspaces
  ]
  category     = "terraform"
  workspace_id = module.tfc_workspaces.tfe_workspace_id.iks
  variable_list = [
    #---------------------------
    # Terraform Cloud Variables
    #---------------------------
    {
      description = "Terraform Cloud Organization."
      hcl         = false
      key         = "tfc_organization"
      sensitive   = false
      value       = var.tfc_organization
    },
    {
      description = "global_vars Workspace."
      hcl         = false
      key         = "ws_global_vars"
      sensitive   = false
      value       = "${var.cluster_name}_global_vars"
    },
    #---------------------------
    # Intersight Variables
    #---------------------------
    {
      description = "Intersight API Key."
      hcl         = false
      key         = "apikey"
      sensitive   = true
      value       = var.apikey
    },
    {
      description = "Intersight Secret Key."
      hcl         = false
      key         = "secretkey"
      sensitive   = true
      value       = var.secretkey
    },
    #-----------------------------
    # Kubernetes Policy Variables
    #-----------------------------
    {
      description = "Kubernetes Network Pod CIDR."
      hcl         = false
      key         = "k8s_pod_cidr"
      sensitive   = false
      value       = var.k8s_pod_cidr
    },
    {
      description = "Kubernetes Network Service CIDR."
      hcl         = false
      key         = "k8s_service_cidr"
      sensitive   = false
      value       = var.k8s_service_cidr
    },
    {
      description = "Kubernetes Version."
      hcl         = false
      key         = "k8s_version"
      sensitive   = false
      value       = var.k8s_version
    },
    {
      description = "Docker no proxy list, when using internet proxy.  Default is no list."
      hcl         = true
      key         = "docker_no_proxy"
      sensitive   = false
      value       = var.docker_no_proxy
    },
    {
      description = "Password for the HTTP Proxy Server, If required."
      hcl         = false
      key         = "proxy_http_password"
      sensitive   = true
      value       = var.proxy_http_password
    },
    {
      description = "Proxy HTTP Port."
      hcl         = false
      key         = "proxy_http_port"
      sensitive   = false
      value       = var.proxy_http_port
    },
    {
      description = "Proxy HTTP Protocol."
      hcl         = false
      key         = "proxy_http_protocol"
      sensitive   = false
      value       = var.proxy_http_protocol
    },
    {
      description = "Password for the HTTPS Proxy Server, If required."
      hcl         = false
      key         = "proxy_https_password"
      sensitive   = true
      value       = var.proxy_https_password
    },
    {
      description = "Proxy HTTPS Port."
      hcl         = false
      key         = "proxy_https_port"
      sensitive   = false
      value       = var.proxy_https_port
    },
    {
      description = "Proxy HTTPS Protocol."
      hcl         = false
      key         = "proxy_https_protocol"
      sensitive   = false
      value       = var.proxy_https_protocol
    },
    {
      description = "vSphere Password.  Note: this is the password of the Credentials used to register the vSphere Target."
      hcl         = false
      key         = "vsphere_password"
      sensitive   = true
      value       = var.vsphere_password
    },
    {
      description = "vSphere Cluster to assign the K8S Cluster Deployment."
      hcl         = false
      key         = "vsphere_cluster"
      sensitive   = false
      value       = var.vsphere_cluster
    },
    {
      description = "vSphere Datastore to assign the K8S Cluster Deployment."
      hcl         = false
      key         = "vsphere_datastore"
      sensitive   = false
      value       = var.vsphere_datastore
    },
    {
      description = "vSphere Port Group to assign the K8S Cluster Deployment."
      hcl         = true
      key         = "vsphere_portgroup"
      sensitive   = false
      value       = var.vsphere_portgroup
    },
    {
      description = "vSphere Resource Pool to assign the K8S Cluster Deployment."
      hcl         = false
      key         = "vsphere_resource_pool"
      sensitive   = false
      value       = var.vsphere_resource_pool
    },
    {
      description = "List of root CA Signed Registries."
      hcl         = true
      key         = "root_ca_registries"
      sensitive   = false
      value       = var.root_ca_registries
    },
    {
      description = "List of unsigned registries to be supported."
      hcl         = true
      key         = "unsigned_registries"
      sensitive   = false
      value       = var.unsigned_registries
    },
    {
      description = "Tags to be Associated with Objects Created in Intersight."
      hcl         = true
      key         = "tags"
      sensitive   = false
      value       = var.tags
    },
    #---------------------------
    # IKS Cluster Variables
    #---------------------------
    {
      description = "Action to perform on the Intersight Kubernetes Cluster.  Options are {Delete|Deploy|Ready|Unassign}."
      hcl         = false
      key         = "action"
      sensitive   = false
      value       = var.action
    },
    {
      description = "Intersight Kubernetes Load Balancer count."
      hcl         = false
      key         = "load_balancers"
      sensitive   = false
      value       = var.load_balancers
    },
    {
      description = "Intersight Kubernetes Service Cluster Default User."
      hcl         = false
      key         = "ssh_user"
      sensitive   = false
      value       = var.ssh_user
    },
    {
      description = "Intersight Kubernetes Service Cluster Default User."
      hcl         = false
      key         = "ssh_key"
      sensitive   = true
      value       = var.ssh_key
    },
    {
      description = "K8S Master Virtual Machine Instance Type.  Options are {small|medium|large}."
      hcl         = false
      key         = "master_instance_type"
      sensitive   = false
      value       = var.master_instance_type
    },
    {
      description = "K8S Master Desired Cluster Size."
      hcl         = false
      key         = "master_desired_size"
      sensitive   = false
      value       = var.master_desired_size
    },
    {
      description = "K8S Master Maximum Cluster Size."
      hcl         = false
      key         = "master_max_size"
      sensitive   = false
      value       = var.master_max_size
    },
    {
      description = "K8S Worker Virtual Machine Instance Type.  Options are {small|medium|large}."
      hcl         = false
      key         = "worker_instance_type"
      sensitive   = false
      value       = var.worker_instance_type
    },
    {
      description = "K8S Worker Desired Cluster Size."
      hcl         = false
      key         = "worker_desired_size"
      sensitive   = false
      value       = var.worker_desired_size
    },
    {
      description = "K8S Worker Maximum Cluster Size."
      hcl         = false
      key         = "worker_max_size"
      sensitive   = false
      value       = var.worker_max_size
    },
  ]
}
