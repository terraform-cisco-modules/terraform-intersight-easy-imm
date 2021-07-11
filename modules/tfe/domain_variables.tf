#__________________________________________________________
#
# UCS Domain Variables
#__________________________________________________________

variable "domain_list" {
  description = "List of UCS Domain Names to Create workspaces for."
  type    = set(string)
}

variable "action" {
  default     = "No-op"
  description = "Action to Perform on the Switch Profile Assignment.  Options are {Deploy|No-op|Unassign}."
  type        = string
}

variable "assign_switches" {
  default     = true
  description = "Setting this Flag to True will Assign Switches to Profile."
  type        = bool
}

#__________________________________________________________
#
# Terraform Cloud Workspace Variables: domain
#__________________________________________________________

module "tfc_variables" {
  source = "terraform-cisco-modules/modules/tfe//modules/tfc_variables"
  depends_on = [
    module.tfc_workspaces
  ]
  for_each     = var.domain_list
  category     = "terraform"
  workspace_id = module.tfc_workspaces["${each.value}"].workspace.id
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
    #---------------------------
    # UCS Domain Variables
    #---------------------------
    {
      description = "Action to Perform on the Switch Profile Assignment.  Options are {Deploy|No-op|Unassign}."
      hcl         = false
      key         = "action"
      sensitive   = false
      value       = var.action
    },
    {
      description = "Setting this Flag to True will Assign Switches to Profile."
      hcl         = false
      key         = "assign_switches"
      sensitive   = false
      value       = var.assign_switches
    },
    {
      description = "UCS Domain Profile Name."
      hcl         = false
      key         = "cluster_name"
      sensitive   = false
      value       = each.value
    },
    {
      description = "Terraform Cloud HCL Block for Additional Variables."
      hcl         = true
      key         = "variables_tfc"
      sensitive   = false
      value       = ""
    },
  ]
}
