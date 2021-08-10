#____________________________________________________________
#
# SNMP Policy
# GUI Location: Policies > Create Policy
#____________________________________________________________

module "snmp" {
  depends_on = [
    data.intersight_organization_organization.org_moid
  ]
  source          = "terraform-cisco-modules/imm/intersight//modules/policies_snmp"
  description     = local.snmp_policy != "" ? "${local.snmp_policy} SNMP Policy." : "${local.org_name} SNMP Policy."
  name            = local.snmp_policy != "" ? local.snmp_policy : local.org_name
  org_moid        = local.org_moid
  snmp_community  = local.snmp_community
  snmp_traps      = local.snmp_trap_destinations
  snmp_users      = local.snmp_users
  system_contact  = local.system_contact
  system_location = local.system_location
  tags            = var.tags
  trap_community  = local.trap_community
}


