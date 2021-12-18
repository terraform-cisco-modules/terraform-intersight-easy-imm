terraform {
  experiments = [module_variable_optional_attrs]
}

#__________________________________________________________
#
# Terraform Cloud Variables
#__________________________________________________________

variable "terraform_cloud_token" {
  description = "Token to Authenticate to the Terraform Cloud."
  sensitive   = true
  type        = string
}

variable "tfc_oauth_token" {
  description = "Terraform Cloud OAuth Token for VCS_Repo Integration."
  sensitive   = true
  type        = string
}

variable "tfc_organization" {
  description = "Terraform Cloud Organization Name."
  type        = string
}

variable "terraform_version" {
  default     = "1.0.3"
  description = "Terraform Target Version."
  type        = string
}

variable "vcs_repo" {
  description = "Version Control System Repository."
  type        = string
}


#__________________________________________________________
#
# Intersight Sensitive Variables
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


#__________________________________________________________
#
# IPMI over LAN Sensitive Variable
#__________________________________________________________

variable "ipmi_key_1" {
  default     = ""
  description = "Encryption key to use for IPMI communication. It should have an even number of hexadecimal characters and not exceed 40 characters."
  sensitive   = true
  type        = string
}


#__________________________________________________________
#
# LDAP Policy Sensitive Variable
#__________________________________________________________

variable "binding_parameters_password" {
  default     = ""
  description = "The password of the user for initial bind process. It can be any string that adheres to the following constraints. It can have character except spaces, tabs, line breaks. It cannot be more than 254 characters."
  sensitive   = true
  type        = string
}


#__________________________________________________________
#
# Local User Policy Sensitive Variables
#__________________________________________________________

variable "local_user_password_1" {
  default     = ""
  description = "Password to assign to a local user.  Sensitive Variables cannot be added to a for_each loop so these are added seperately."
  sensitive   = true
  type        = string
}

variable "local_user_password_2" {
  default     = ""
  description = "Password to assign to a local user.  Sensitive Variables cannot be added to a for_each loop so these are added seperately."
  sensitive   = true
  type        = string
}

variable "local_user_password_3" {
  default     = ""
  description = "Password to assign to a local user.  Sensitive Variables cannot be added to a for_each loop so these are added seperately."
  sensitive   = true
  type        = string
}

variable "local_user_password_4" {
  default     = ""
  description = "Password to assign to a local user.  Sensitive Variables cannot be added to a for_each loop so these are added seperately."
  sensitive   = true
  type        = string
}

variable "local_user_password_5" {
  default     = ""
  description = "Password to assign to a local user.  Sensitive Variables cannot be added to a for_each loop so these are added seperately."
  sensitive   = true
  type        = string
}


#__________________________________________________________
#
# Persistent Memory Policy Sensitive Variables
#__________________________________________________________

variable "secure_passphrase" {
  default     = ""
  description = "Secure passphrase to be applied on the Persistent Memory Modules on the server. The allowed characters are a-z, A to Z, 0-9, and special characters =, \u0021, &, #, $, %, +, ^, @, _, *, -."
  sensitive   = true
  type        = string
}

#__________________________________________________________
#
# SNMP Policy Sensitive Variables
#__________________________________________________________

variable "access_community_string_1" {
  default     = ""
  description = "The default SNMPv1, SNMPv2c community name or SNMPv3 username to include on any trap messages sent to the SNMP host. The name can be 18 characters long."
  sensitive   = true
  type        = string
}

variable "access_community_string_2" {
  default     = ""
  description = "The default SNMPv1, SNMPv2c community name or SNMPv3 username to include on any trap messages sent to the SNMP host. The name can be 18 characters long."
  sensitive   = true
  type        = string
}

variable "access_community_string_3" {
  default     = ""
  description = "The default SNMPv1, SNMPv2c community name or SNMPv3 username to include on any trap messages sent to the SNMP host. The name can be 18 characters long."
  sensitive   = true
  type        = string
}

variable "access_community_string_4" {
  default     = ""
  description = "The default SNMPv1, SNMPv2c community name or SNMPv3 username to include on any trap messages sent to the SNMP host. The name can be 18 characters long."
  sensitive   = true
  type        = string
}

variable "access_community_string_5" {
  default     = ""
  description = "The default SNMPv1, SNMPv2c community name or SNMPv3 username to include on any trap messages sent to the SNMP host. The name can be 18 characters long."
  sensitive   = true
  type        = string
}

variable "snmp_auth_password_1" {
  default     = ""
  description = "SNMPv3 User Authentication Password."
  sensitive   = true
  type        = string
}

variable "snmp_auth_password_2" {
  default     = ""
  description = "SNMPv3 User Authentication Password."
  sensitive   = true
  type        = string
}

variable "snmp_auth_password_3" {
  default     = ""
  description = "SNMPv3 User Authentication Password."
  sensitive   = true
  type        = string
}

variable "snmp_auth_password_4" {
  default     = ""
  description = "SNMPv3 User Authentication Password."
  sensitive   = true
  type        = string
}

variable "snmp_auth_password_5" {
  default     = ""
  description = "SNMPv3 User Authentication Password."
  sensitive   = true
  type        = string
}

variable "snmp_privacy_password_1" {
  default     = ""
  description = "SNMPv3 User Privacy Password."
  sensitive   = true
  type        = string
}

variable "snmp_privacy_password_2" {
  default     = ""
  description = "SNMPv3 User Privacy Password."
  sensitive   = true
  type        = string
}

variable "snmp_privacy_password_3" {
  default     = ""
  description = "SNMPv3 User Privacy Password."
  sensitive   = true
  type        = string
}

variable "snmp_privacy_password_4" {
  default     = ""
  description = "SNMPv3 User Privacy Password."
  sensitive   = true
  type        = string
}

variable "snmp_privacy_password_5" {
  default     = ""
  description = "SNMPv3 User Privacy Password."
  sensitive   = true
  type        = string
}

variable "snmp_trap_community_1" {
  default     = ""
  description = "Community for a Trap Destination."
  sensitive   = true
  type        = string
}

variable "snmp_trap_community_2" {
  default     = ""
  description = "Community for a Trap Destination."
  sensitive   = true
  type        = string
}

variable "snmp_trap_community_3" {
  default     = ""
  description = "Community for a Trap Destination."
  sensitive   = true
  type        = string
}

variable "snmp_trap_community_4" {
  default     = ""
  description = "Community for a Trap Destination."
  sensitive   = true
  type        = string
}

variable "snmp_trap_community_5" {
  default     = ""
  description = "Community for a Trap Destination."
  sensitive   = true
  type        = string
}

variable "trap_community_string_1" {
  default     = ""
  description = "The default SNMPv1, SNMPv2c community name or SNMPv3 username to include on any trap messages sent to the SNMP host. The name can be 18 characters long."
  sensitive   = true
  type        = string
}

variable "trap_community_string_2" {
  default     = ""
  description = "The default SNMPv1, SNMPv2c community name or SNMPv3 username to include on any trap messages sent to the SNMP host. The name can be 18 characters long."
  sensitive   = true
  type        = string
}

variable "trap_community_string_3" {
  default     = ""
  description = "The default SNMPv1, SNMPv2c community name or SNMPv3 username to include on any trap messages sent to the SNMP host. The name can be 18 characters long."
  sensitive   = true
  type        = string
}

variable "trap_community_string_4" {
  default     = ""
  description = "The default SNMPv1, SNMPv2c community name or SNMPv3 username to include on any trap messages sent to the SNMP host. The name can be 18 characters long."
  sensitive   = true
  type        = string
}

variable "trap_community_string_5" {
  default     = ""
  description = "The default SNMPv1, SNMPv2c community name or SNMPv3 username to include on any trap messages sent to the SNMP host. The name can be 18 characters long."
  sensitive   = true
  type        = string
}

variable "workspaces" {
  default = {
    default = {
      allow_destroy_plan        = true
      auto_apply                = false
      branch                    = "master"
      description               = ""
      global_remote_state       = false
      queue_all_runs            = false
      remote_state_consumer_ids = []
      speculative_enabled       = true
      working_directory         = ""
      workspace_type            = ""
    }
  }
  description = <<-EOT
  Map of Workspaces to create in Terraform Cloud.
  key - Name of the Workspace to Create.
  * allow_destroy_plan - Default is true.
  * auto_apply - Defualt is false.  Automatically apply changes when a Terraform plan is successful. Plans that have no changes will not be applied. If this workspace is linked to version control, a push to the default branch of the linked repository will trigger a plan and apply.
  * branch - Default is "master".  The repository branch that Terraform will execute from. Default to master.
  * description - A Description for the Workspace.
  * global_remote_state - Whether the workspace allows all workspaces in the organization to access its state data during runs. If false, then only specifically approved workspaces can access its state (remote_state_consumer_ids)..
  * queue_all_runs - needs description.
  * remote_state_consumer_ids - The set of workspace IDs set as explicit remote state consumers for the given workspace.
  * working_directory - The Directory of the Version Control Repository that contains the Terraform code for UCS Domain Profiles for this Workspace.
  * workspace_type - What Type of Workspace will this Create.  Options are:
    - chassis
    - domain
    - pool
    - server
    - vlan
  EOT
  type = map(object(
    {
      allow_destroy_plan        = optional(bool)
      auto_apply                = optional(bool)
      branch                    = optional(string)
      description               = optional(string)
      global_remote_state       = optional(bool)
      queue_all_runs            = optional(bool)
      remote_state_consumer_ids = optional(list(string))
      speculative_enabled       = optional(bool)
      working_directory         = string
      workspace_type            = string
    }
  ))
}
