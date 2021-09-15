#__________________________________________________________
#
# Terraform Cloud Workspaces - UCS Domain Profiles
#__________________________________________________________

module "workspaces" {
  source                    = "terraform-cisco-modules/modules/tfe//modules/tfc_workspace"
  for_each                  = local.workspaces
  allow_destroy_plan        = each.value.allow_destroy_plan
  auto_apply                = each.value.auto_apply
  branch                    = each.value.branch
  description               = each.value.description
  global_remote_state       = each.value.global_remote_state
  name                      = each.key
  queue_all_runs            = each.value.queue_all_runs
  remote_state_consumer_ids = each.value.remote_state_consumer_ids
  speculative_enabled       = each.value.speculative_enabled
  terraform_version         = var.terraform_version
  tfc_oauth_token           = var.tfc_oauth_token
  tfc_org_name              = var.tfc_organization
  vcs_repo                  = var.vcs_repo
  working_directory         = each.value.working_directory
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
    if length(regexall("(policies)", local.workspaces[k].workspace_type)) > 0
  }
  category     = "terraform"
  workspace_id = module.workspaces[each.key].workspace.id
  variable_list = {
    access_community_string_1 = {
      description = "The default SNMPv1, SNMPv2c community name or SNMPv3 username to include on any trap messages sent to the SNMP host. The name can be 18 characters long."
      key         = "access_community_string_1"
      sensitive   = true
      value       = var.access_community_string_1
    },
    access_community_string_2 = {
      description = "The default SNMPv1, SNMPv2c community name or SNMPv3 username to include on any trap messages sent to the SNMP host. The name can be 18 characters long."
      key         = "access_community_string_2"
      sensitive   = true
      value       = var.access_community_string_2
    },
    access_community_string_3 = {
      description = "The default SNMPv1, SNMPv2c community name or SNMPv3 username to include on any trap messages sent to the SNMP host. The name can be 18 characters long."
      key         = "access_community_string_3"
      sensitive   = true
      value       = var.access_community_string_3
    },
    access_community_string_4 = {
      description = "The default SNMPv1, SNMPv2c community name or SNMPv3 username to include on any trap messages sent to the SNMP host. The name can be 18 characters long."
      key         = "access_community_string_4"
      sensitive   = true
      value       = var.access_community_string_4
    },
    access_community_string_5 = {
      description = "The default SNMPv1, SNMPv2c community name or SNMPv3 username to include on any trap messages sent to the SNMP host. The name can be 18 characters long."
      key         = "access_community_string_5"
      sensitive   = true
      value       = var.access_community_string_5
    },
    snmp_auth_password_1 = {
      description = "SNMPv3 User Authentication Password."
      key         = "snmp_auth_password_1"
      sensitive   = true
      value       = var.snmp_auth_password_1
    },
    snmp_auth_password_2 = {
      description = "SNMPv3 User Authentication Password."
      key         = "snmp_auth_password_2"
      sensitive   = true
      value       = var.snmp_auth_password_2
    },
    snmp_auth_password_3 = {
      description = "SNMPv3 User Authentication Password."
      key         = "snmp_auth_password_3"
      sensitive   = true
      value       = var.snmp_auth_password_3
    },
    snmp_auth_password_4 = {
      description = "SNMPv3 User Authentication Password."
      key         = "snmp_auth_password_4"
      sensitive   = true
      value       = var.snmp_auth_password_4
    },
    snmp_auth_password_5 = {
      description = "SNMPv3 User Authentication Password."
      key         = "snmp_auth_password_5"
      sensitive   = true
      value       = var.snmp_auth_password_5
    },
    snmp_privacy_password_1 = {
      description = "SNMPv3 User Privacy Password."
      key         = "snmp_privacy_password_1"
      sensitive   = true
      value       = var.snmp_privacy_password_1
    },
    snmp_privacy_password_2 = {
      description = "SNMPv3 User Privacy Password."
      key         = "snmp_privacy_password_2"
      sensitive   = true
      value       = var.snmp_privacy_password_2
    },
    snmp_privacy_password_3 = {
      description = "SNMPv3 User Privacy Password."
      key         = "snmp_privacy_password_3"
      sensitive   = true
      value       = var.snmp_privacy_password_3
    },
    snmp_privacy_password_4 = {
      description = "SNMPv3 User Privacy Password."
      key         = "snmp_privacy_password_4"
      sensitive   = true
      value       = var.snmp_privacy_password_4
    },
    snmp_privacy_password_5 = {
      description = "SNMPv3 User Privacy Password."
      key         = "snmp_privacy_password_5"
      sensitive   = true
      value       = var.snmp_privacy_password_5
    },
    snmp_trap_community_1 = {
      description = "Community for a Trap Destination."
      key         = "snmp_trap_community_1"
      sensitive   = true
      value       = var.snmp_trap_community_1
    },
    snmp_trap_community_2 = {
      description = "Community for a Trap Destination."
      key         = "snmp_trap_community_2"
      sensitive   = true
      value       = var.snmp_trap_community_2
    },
    snmp_trap_community_3 = {
      description = "Community for a Trap Destination."
      key         = "snmp_trap_community_3"
      sensitive   = true
      value       = var.snmp_trap_community_3
    },
    snmp_trap_community_4 = {
      description = "Community for a Trap Destination."
      key         = "snmp_trap_community_4"
      sensitive   = true
      value       = var.snmp_trap_community_4
    },
    snmp_trap_community_5 = {
      description = "Community for a Trap Destination."
      key         = "snmp_trap_community_5"
      sensitive   = true
      value       = var.snmp_trap_community_5
    },
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
    if length(regexall("(policies)", local.workspaces[k].workspace_type)) > 0
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
  }
}
