#____________________________________________________________
#
# Persistent Memory Policy
# GUI Location: Policies > Create Policy
#____________________________________________________________

module "persistent_memory" {
  depends_on = [
    data.intersight_organization_organization.org_moid
  ]
  source            = "terraform-cisco-modules/imm/intersight//modules/policies_persistent_memory"
  description       = local.persistent_memory_policy != "" ? "${local.persistent_memory_policy} Persistent Memory Policy." : "${local.org_name} Persistent Memory Policy."
  name              = local.persistent_memory_policy != "" ? local.persistent_memory_policy : local.org_name
  org_moid          = local.org_moid
  profiles          = []
  retain_namespaces = local.retain_namespaces
  secure_passphrase = var.persistent_passphrase
  tags              = var.tags
  logical_namespaces = [
    {
      capacity         = 512
      mode             = "raw"
      name             = "example_1"
      socket_id        = 1
      socket_memory_id = "Not Applicable"
    }
  ]
}


