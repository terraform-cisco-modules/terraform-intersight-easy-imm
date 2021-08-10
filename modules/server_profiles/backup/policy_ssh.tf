#_________________________________________________________________________
#
# Intersight SSH Policies Variables
# GUI Location: Configure > Policies > Create Policy > SSH > Start
#_________________________________________________________________________

variable "policy_ssh" {
  default = {
    default = {
      ssh = {
          create      = true
          description = ""
          lockout     = false
          tags        = []
      }
    }
  }
  description = <<-EOT
  key - Name of the Intersight Organization
  1. devconn - SSH Policy.
    b. create - Flag to specify if the the Policy should be created in the Intersight Organization.
    c. description - Description to Assign to the Policy if wanting to change the default value.
    a. lockout - Enables configuration lockout on the endpoint.
    d. tags - List of Key/Value Pairs to Assign as Attributes to the Policy.
  EOT
  type = map(object(
    {
      ssh = optional(object(
        {
          create      = optional(bool)
          description = optional(string)
          lockout     = optional(bool)
          tags        = optional(list(map(string)))
        }
      ))
    }
  ))
}


#_________________________________________________________________________
#
# SSH Policies
# GUI Location: Configure > Policies > Create Policy > SSH > Start
#_________________________________________________________________________

module "policy_ssh" {
  depends_on = [
    local.org_moids,
    module.ucs_server_profile
  ]
  source      = "terraform-cisco-modules/imm/intersight//modules/policies_ssh"
  for_each = {
    for assign, policy_ssh in local.policy_ssh : assign => policy_ssh
    if policy_ssh.ssh.create == true
  }
  description = each.value.ssh.description != "" ? each.value.ssh.description : "${each.key} IMC Access Policy."
  imc_ip_pool = local.ip_pools[each.value.ssh.imc_ip_pool].moid
  enabled     = each.value.ssh.enabled
  port        = each.value.ssh.port
  name        = "${each.key}_ssh"
  org_moid    = local.org_moids[each.key].moid
  profiles    = [ for s in sort(keys(local.policy_ssh_profiles)) : module.ucs_server_profile[s].moid if local.policy_ssh_profiles[s].organization == each.key ]
  tags        = each.value.ssh.tags != [] ? each.value.ssh.tags : local.tags
  timeout     = each.value.ssh.timeout
}
