#_________________________________________________________________________
#
# Intersight LDAP Policies Variables
# GUI Location: Configure > Policies > Create Policy > LDAP > Start
#_________________________________________________________________________

variable "ldap_password" {
  default     = ""
  description = "The password of the user for initial bind process. It can be any string that adheres to the following constraints. It can have character except spaces, tabs, line breaks. It cannot be more than 254 characters."
  sensitive   = true
  type        = string
}

variable "ldap_policies" {
  default = {
    default = {
      description                     = ""
      ldap_attribute                  = "CiscoAvPair"
      ldap_base_dn                    = "dc=example,dc=com"
      ldap_bind_dn                    = ""
      ldap_bind_method                = "LoginCredentials"
      ldap_domain                     = "example.com"
      ldap_enable_dns                 = false
      ldap_enable_encryption          = false
      ldap_enable_group_authorization = false
      ldap_enabled                    = true
      ldap_filter                     = "samAccountName"
      ldap_group_attribute            = "memberOf"
      ldap_groups = {
        "group1" = {
          group_role = "admin"
        }
        "group2" = {
          group_role = "read-only"
        }
      }
      ldap_nested_group_search_depth = 128
      ldap_nr_source                 = "Extracted"
      ldap_search_domain             = ""
      ldap_search_forest             = ""
      ldap_servers = {
        "server1" = {
          ldap_port   = 389
          ldap_server = "server1.example.com"
        }
        "server2" = {
          ldap_port   = 389
          ldap_server = "server2.example.com"
        }
      }
      ldap_timeout                = 0
      ldap_user_search_precedence = "LocalUserDb"
      organization                = "default"
      tags                        = []
    }
  }
  description = <<-EOT
  key - Name of the Persistent Memory Policy.
  * description - Description to Assign to the Policy.
  * ldap_attribute - Role and locale information of the user.
  * ldap_base_dn - Base Distinguished Name (DN). Starting point from where server will search for users and groups.
  * ldap_bind_dn - Distinguished Name (DN) of the user, that is used to authenticate against LDAP servers.
  * ldap_bind_method - Authentication method to access LDAP servers.
    - Anonymous - Requires no username and password. If this option is selected and the LDAP server is configured for Anonymous logins, then the user gains access.
    - ConfiguredCredentials - Requires a known set of credentials to be specified for the initial bind process. If the initial bind process succeeds, then the distinguished name (DN) of the user name is queried and re-used for the re-binding process. If the re-binding process fails, then the user is denied access.
    - LoginCredentials - Requires the user credentials. If the bind process fails, then user is denied access.
  * ldap_domain - The LDAP Base domain that all users must be in.
  * ldap_enable_dns - Enables DNS to access LDAP servers.
  * ldap_enable_encryption - If enabled, the endpoint encrypts all information it sends to the LDAP server.
  * ldap_enable_group_authorization - If enabled, user authorization is also done at the group level for LDAP users not in the local user database.
  * ldap_enabled - Flag to Enable or Disable the Policy.
  * ldap_filter - Criteria to identify entries in search requests.
  * ldap_group_attribute - Groups to which an LDAP user belongs.
  * ldap_groups - Map of Groups and Attributes.
    - key - Name of the Group
    - group_role - Role to assign to the group.
      1. admin
      2. readonly
      3. user
  * ldap_nested_group_search_depth - Search depth to look for a nested LDAP group in an LDAP group map.  Range is 1 to 128.
  * ldap_nr_source - Source of the domain name used for the DNS SRV request.
    - Configured - The configured-search domain.
    - ConfiguredExtracted - The domain name extracted from the login ID than the configured-search domain.
    - Extracted - The domain name extracted-domain from the login ID."
  * ldap_servers - Map of LDAP Servers.
    - ldap_port - Port to Assign to the LDAP Server.  Range is 1-65535.
    - ldap_server - Hostname or IP address of an LDAP Server.
  * ldap_search_domain - Domain name that acts as a source for a DNS query.
  * ldap_search_forest - Forest name that acts as a source for a DNS query.
  * ldap_timeout - LDAP authentication timeout duration, in seconds.  Range is 0 to 180.
  * ldap_user_search_precedence - Search precedence between local user database and LDAP user database.
    - LocalUserDb - Precedence is given to local user database while searching.
    - LDAPUserDb - Precedence is given to LADP user database while searching.
  * organization - Name of the Intersight Organization to assign this Policy to.
    - https://intersight.com/an/settings/organizations/
  * tags - List of Key/Value Pairs to Assign as Attributes to the Policy.
  EOT
  type = map(object(
    {
      description                     = optional(string)
      ldap_attribute                  = optional(string)
      ldap_base_dn                    = optional(string)
      ldap_bind_dn                    = optional(string)
      ldap_bind_method                = optional(string)
      ldap_domain                     = optional(string)
      ldap_enable_dns                 = optional(bool)
      ldap_enable_encryption          = optional(bool)
      ldap_enable_group_authorization = optional(bool)
      ldap_enabled                    = optional(bool)
      ldap_filter                     = optional(string)
      ldap_group_attribute            = optional(string)
      ldap_groups = optional(map(object(
        {
          group_role = optional(string)
        }
      )))
      ldap_nested_group_search_depth = optional(number)
      ldap_nr_source                 = optional(string)
      ldap_servers = optional(map(object(
        {
          ldap_port   = optional(number)
          ldap_server = optional(string)
        }
      )))
      ldap_search_domain          = optional(string)
      ldap_search_forest          = optional(string)
      ldap_timeout                = optional(number)
      ldap_user_search_precedence = optional(string)
      organization                = optional(string)
      tags                        = optional(list(map(string)))
    }
  ))
}


#_________________________________________________________________________
#
# LDAP Policies
# GUI Location: Configure > Policies > Create Policy > LDAP > Start
#_________________________________________________________________________

#______________________________________________
#
# LDAP Policy
#______________________________________________

module "ldap_policies" {
  depends_on = [
    local.org_moids,
    module.ucs_server_profiles,
    module.ucs_server_profile_templates
  ]
  source                     = "terraform-cisco-modules/imm/intersight//modules/ldap_policies"
  for_each                   = local.ldap_policies
  attribute                  = each.value.ldap_attribute
  base_dn                    = each.value.ldap_base_dn
  bind_dn                    = each.value.ldap_bind_dn
  bind_method                = each.value.ldap_bind_method
  description                = each.value.description != "" ? each.value.description : "${each.key} LDAP Policy."
  domain                     = each.value.ldap_domain
  enable_encryption          = each.value.ldap_enable_encryption
  enable_dns                 = each.value.ldap_enable_dns
  enable_group_authorization = each.value.ldap_enable_group_authorization
  enabled                    = each.value.ldap_enabled
  filter                     = each.value.ldap_filter
  group_attribute            = each.value.ldap_group_attribute
  name                       = each.key
  nested_group_search_depth  = each.value.ldap_nested_group_search_depth
  nr_source                  = each.value.ldap_nr_source
  org_moid                   = local.org_moids[each.value.organization].moid
  password                   = var.ldap_password
  search_domain              = each.value.ldap_search_domain
  search_forest              = each.value.ldap_search_forest
  tags                       = length(each.value.tags) > 0 ? each.value.tags : local.tags
  timeout                    = each.value.ldap_timeout
  user_search_precedence     = each.value.ldap_user_search_precedence
  profiles = {
    for k, v in local.merged_server_moids : k => {
      moid        = v.moid
      object_type = v.object_type
    }
    if local.merged_server_moids[k].ldap_policy == each.key
  }
}

#______________________________________________
#
# LDAP Provider
#______________________________________________

module "ldap_provider" {
  depends_on = [
    local.org_moids,
    module.ldap_policies
  ]
  for_each         = local.ldap_servers.ldap_servers
  source           = "terraform-cisco-modules/imm/intersight//modules/ldap_add_server"
  ldap_policy_moid = module.ldap_policies[each.value.policy].moid
  ldap_port        = each.value.ldap_port
  ldap_server      = each.value.ldap_server
}

#______________________________________________
#
# LDAP Groups
#______________________________________________

module "ldap_groups" {
  depends_on = [
    local.org_moids,
    module.ldap_policies
  ]
  source           = "terraform-cisco-modules/imm/intersight//modules/ldap_add_group"
  for_each         = local.ldap_groups.ldap_groups
  group_role       = each.value.group_role
  ldap_domain      = each.value.ldap_domain
  ldap_group       = each.value.ldap_group
  ldap_policy_moid = module.ldap_policies[each.value.policy].moid
}
