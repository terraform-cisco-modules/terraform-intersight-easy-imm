#____________________________________________________________
#
# Fibre Channel QoS Policy
# GUI Location: Policies > Create Policy > Fibre Channel QoS
#____________________________________________________________

variable "fibre_channel_qos_policies" {
  default {
    default = {
      burst               = 10240
      description         = ""
      max_data_field_size = 2112
      organization        = "default"
      rate_limit          = 0
      tags                = []
    }
  }
}

module "fibre_channel_qos_policies" {
  depends_on = [
    local.org_moids
  ]
  source              = "terraform-cisco-modules/imm/intersight//modules/fibre_channel_qos_policies"
  for_each            = local.san_connectivity_policies
  burst               = each.value.target_platform == "Standalone" ? each.value.qos_burst : 1024
  cos                 = each.value.target_platform == "FIAttached" ? each.value.qos_cos : 3
  description         = each.value.description != "" ? each.value.description : "${each.key} vHBA QoS Policy."
  max_data_field_size = each.value.qos_max_data_field_size
  name                = "${each.key}_qos"
  org_moid            = local.org_moids[each.value.organization].moid
  rate_limit          = each.value.qos_rate_limit
  tags                = length(each.value.tags) > 0 ? each.value.tags : local.tags
}
