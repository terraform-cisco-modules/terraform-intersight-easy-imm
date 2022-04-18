terraform {
  experiments = [module_variable_optional_attrs]
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
# Identity Provider Variables
#__________________________________________________________

variable "identity_providers" {
  default     = ["default"]
  description = "Intersight Identity Providers."
  type        = list(string)
}

#__________________________________________________________
#
# Orgnaizations Variables - Including:
# - Groups
# - Resource Groups
# - Roles
#__________________________________________________________

variable "organizations" {
  default = {
    default = {
      create_org  = false
      description = ""
      groups = [
        {
          description                     = ""
          group_name_in_identity_provider = "**REQUIRED**"
          identity_provider               = "Cisco"
          name                            = "**REQUIRED**"
          roles                           = ["**REQUIRED**"]
        }
      ]
      resource_groups = [
        {
          description = ""
          qualifier   = "Allow-Selectors"
          selectors   = []
        }
      ]
      roles = [
        {
          name        = "**REQUIRED**"
          description = ""
          privileges  = ["**REQUIRED**"]
        }
      ]
    }
  }
  description = <<-EOT
  Key - The name of the organization. There can be multiple organizations under an account.
  * create_org - Flag to decide if it is an existing organization or to create the organization
  * description - The informative description about the usage of this organization.
  * groups - Map of User Groups to assign to the Organization
    - group_name_in_identity_provider - Group Name assigned from the Identity Provider.  i.e. memberOf
    - identity_provider - The name of the Identity Provider.  Default is Cisco.
    - name - The name of the user group which the dynamic user will belong to.
    - roles - A List of Roles to assign to the user.
  * resource_groups - Map of Resource Groups to Create in Intersight.
    - description - The informative description about the usage of this Resource Group.
    - qualifier - Qualifier shall be used to specify if we want to organize resources using multiple resource group or single For an account, resource groups can be of only one of the above types. (Both the types are mutually exclusive for an account.).
      * Allow-Selectors - Resources will be added to resource groups based on ODATA filter. Multiple resource group can be created to organize resources.
      * Allow-All - All resources will become part of the Resource Group. Only one resource group can be created to organize resources.
    - selectors - An OData $filter expression which describes the REST resource to be referenced. This field maybe set instead of 'moid' by clients.1. If 'moid' is set this field is ignored.1. If 'selector' is set and 'moid' is empty/absent from the request, Intersight determines the Moid of theresource matching the filter expression and populates it in the MoRef that is part of the objectinstance being inserted/updated to fulfill the REST request.An error is returned if the filter matches zero or more than one REST resource.An example filter string is: Serial eq '3AA8B7T11'.
      * Exmaple ["/api/v1/asset/DeviceRegistrations?$filter=Moid in(\"intersight_asset_device_registrations_registeration1.id\")"]
  * roles - Map of Roles to assign users or groups to.
    - description - The informative description for each role.
    - name - Name of the Role to create.
    - privileges - The Intersight priviges to assign to the User Group.  Below is the List of Available Privileges:
      * Account Administrator
      * Audit Log Viewer
      * Device Administrator
      * Device Technician
      * HyperFlex Cluster Administrator
      * Kubernetes Administrator
      * Kubernetes Operator
      * Network Administrator
      * Network Operator
      * Read-Only
      * SAN Administrator
      * SAN Operator
      * Server Administrator
      * Storage Administrator
      * Virtualization Administrator
      * Workflow Designer
      * Workload Optimizer Administrator
      * Workload Optimizer Advisor
      * Workload Optimizer Automator
      * Workload Optimizer Deployer
      * Workload Optimizer Observer
      * UCS Domain Administrator
      * User Access Administrator
    * roles - List of Roles to assign to the User Group.  Currently a Maximum of 5 Roles can be assigned.
  EOT
  type = map(object(
    {
      create_org  = optional(bool)
      description = optional(string)
      groups = list(object(
        {
          description                     = optional(string)
          group_name_in_identity_provider = string
          identity_provider               = optional(string)
          name                            = string
          roles                           = list(string)
        }
      ))
      resource_groups = optional(list(object(
        {
          description = optional(string)
          qualifier   = optional(string)
          selectors   = optional(list(string))
        }
      )))
      roles = list(object(
        {
          name        = string
          description = optional(string)
          privileges  = list(string)
        }
      ))
    }
  ))
}
