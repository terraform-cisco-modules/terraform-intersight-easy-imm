#__________________________________________________________
#
# Terraform Cloud Workspaces - UCS Domain Profiles
#__________________________________________________________

module "workspaces" {
  source              = "terraform-cisco-modules/modules/tfe//modules/tfc_workspace"
  for_each            = local.workspaces
  auto_apply          = each.value.auto_apply
  description         = each.value.description
  global_remote_state = each.value.remote_state
  name                = each.key
  terraform_version   = var.terraform_version
  tfc_oauth_token     = var.tfc_oauth_token
  tfc_org_name        = var.tfc_organization
  vcs_repo            = var.vcs_repo
  working_directory   = each.value.working_directory
}

output "workspaces" {
  description = "Terraform Cloud Workspace IDs and Names."
  value       = { for v in sort(keys(module.workspaces)) : v => module.workspaces[v] }
}


#__________________________________________________________
#
# Intersight Sensitive Variables
#__________________________________________________________

module "sensitive_intersight_variables" {
  source = "terraform-cisco-modules/modules/tfe//modules/tfc_variables"
  depends_on = [
    module.workspaces
  ]
  for_each     = local.workspaces
  category     = "terraform"
  workspace_id = module.workspaces[each.key].workspace.id
  variable_list = {
    apikey = {
      description = "Intersight API Key."
      key         = "apikey"
      sensitive   = true
      value       = var.apikey
    },
    secretkey = {
      description = "Intersight Secret Key."
      key         = "secretkey"
      sensitive   = true
      value       = var.secretkey
    },
  }
}


#__________________________________________________________
#
# Intersight SNMP Policy Sensitive Variables
#__________________________________________________________

module "sensitive_snmp_variables" {
  source = "terraform-cisco-modules/modules/tfe//modules/tfc_variables"
  depends_on = [
    module.workspaces
  ]
  for_each = {
    for k, v in local.workspaces : k => v
    if length(regexall("(chassis|domain|server)", local.workspaces[k].workspace_type)) > 0
  }
  category     = "terraform"
  workspace_id = module.workspaces[each.key].workspace.id
  variable_list = {
    snmp_community = {
      description = "The default SNMPv1, SNMPv2c community name or SNMPv3 username to include on any trap messages sent to the SNMP host. The name can be 18 characters long."
      key         = "snmp_community"
      sensitive   = true
      value       = var.snmp_community
    },
    snmp_trap_community = {
      description = "The default SNMPv1, SNMPv2c community name or SNMPv3 username to include on any trap messages sent to the SNMP host. The name can be 18 characters long."
      key         = "snmp_trap_community"
      sensitive   = true
      value       = var.snmp_trap_community
    },
    snmp_user_1_auth_password = {
      description = "Authorization password for the user."
      key         = "snmp_user_1_auth_password"
      sensitive   = true
      value       = var.snmp_user_1_auth_password
    },
    snmp_user_1_privacy_password = {
      description = "Privacy password for the user."
      key         = "snmp_user_1_privacy_password"
      sensitive   = true
      value       = var.snmp_user_1_privacy_password
    },
    snmp_user_2_auth_password = {
      description = "Authorization password for the user."
      key         = "snmp_user_2_auth_password"
      sensitive   = true
      value       = var.snmp_user_2_auth_password
    },
    snmp_user_2_privacy_password = {
      description = "Privacy password for the user."
      key         = "snmp_user_2_privacy_password"
      sensitive   = true
      value       = var.snmp_user_2_privacy_password
    }
  }
}


#__________________________________________________________
#
# Intersight UCS Server Policy Sensitive Variables
#__________________________________________________________

module "sensitive_server_variables" {
  source = "terraform-cisco-modules/modules/tfe//modules/tfc_variables"
  depends_on = [
    module.workspaces
  ]
  for_each = {
    for k, v in local.workspaces : k => v
    if length(regexall("(server)", local.workspaces[k].workspace_type)) > 0
  }
  category     = "terraform"
  workspace_id = module.workspaces[each.key].workspace.id
  variable_list = {
    ipmi_key_1 = {
      description = "Encryption key to use for IPMI communication. It should have an even number of hexadecimal characters and not exceed 40 characters."
      key         = "ipmi_key_1"
      sensitive   = true
      value       = var.ipmi_key_1
    },
    ldap_password = {
      description = "The password of the user for initial bind process. It can be any string that adheres to the following constraints. It can have character except spaces, tabs, line breaks. It cannot be more than 254 characters."
      key         = "ldap_password"
      sensitive   = true
      value       = var.ldap_password
    },
    local_user_password_1 = {
      description = "Password to assign to a local user.  Sensitive Variables cannot be added to a for_each loop so these are added seperately."
      key         = "local_user_password_1"
      sensitive   = true
      value       = var.local_user_password_1
    },
    local_user_password_2 = {
      description = "Password to assign to a local user.  Sensitive Variables cannot be added to a for_each loop so these are added seperately."
      key         = "local_user_password_2"
      sensitive   = true
      value       = var.local_user_password_2
    },
    local_user_password_3 = {
      description = "Password to assign to a local user.  Sensitive Variables cannot be added to a for_each loop so these are added seperately."
      key         = "local_user_password_3"
      sensitive   = true
      value       = var.local_user_password_3
    },
    local_user_password_4 = {
      description = "Password to assign to a local user.  Sensitive Variables cannot be added to a for_each loop so these are added seperately."
      key         = "local_user_password_4"
      sensitive   = true
      value       = var.local_user_password_4
    },
    local_user_password_5 = {
      description = "Password to assign to a local user.  Sensitive Variables cannot be added to a for_each loop so these are added seperately."
      key         = "local_user_password_5"
      sensitive   = true
      value       = var.local_user_password_5
    },
    persistent_passphrase = {
      description = "Secure passphrase to be applied on the Persistent Memory Modules on the server. The allowed characters are a-z, A to Z, 0-9, and special characters =, \u0021, &, #, $, %, +, ^, @, _, *, -."
      key         = "persistent_passphrase"
      sensitive   = true
      value       = var.persistent_passphrase
    },
    snmp_user_1_privacy_password = {
      description = "Privacy password for the user."
      key         = "snmp_user_1_privacy_password"
      sensitive   = true
      value       = var.snmp_user_1_privacy_password
    },
    snmp_user_2_auth_password = {
      description = "Authorization password for the user."
      key         = "snmp_user_2_auth_password"
      sensitive   = true
      value       = var.snmp_user_2_auth_password
    },
    snmp_user_2_privacy_password = {
      description = "Privacy password for the user."
      key         = "snmp_user_2_privacy_password"
      sensitive   = true
      value       = var.snmp_user_2_privacy_password
    }
  }
}
