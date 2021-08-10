#____________________________________________________________
#
# SD Card Policies
# GUI Location: Policies > Create Policy
#____________________________________________________________

module "sd_card_m4" {
  depends_on = [
    data.intersight_organization_organization.org_moid
  ]
  source      = "terraform-cisco-modules/imm/intersight//modules/policies_sd_card"
  description = local.sdcard_policy != "" ? "${local.sdcard_policy} M4 SD Card Policy." : "${local.org_name} M4 SD Card Policy."
  name        = local.sdcard_policy != "" ? "${local.sdcard_policy}_m4" : "${local.org_name}_m4"
  org_moid    = local.org_moid
  tags        = var.tags
}

module "sd_card_m5" {
  depends_on = [
    data.intersight_organization_organization.org_moid
  ]
  source      = "terraform-cisco-modules/imm/intersight//modules/policies_sd_card"
  description = var.sdcard_policy != "" ? "${var.sdcard_policy} M5 SD Card Policy without FlexUtil." : "${local.org_name} M5 SD Card Policy without FlexUtil."
  name        = var.sdcard_policy != "" ? "${var.sdcard_policy}_m5" : "${local.org_name}_m5"
  org_moid    = local.org_moid
  tags        = var.tags
}

module "sd_card_m5_flexutil" {
  depends_on = [
    data.intersight_organization_organization.org_moid
  ]
  source      = "terraform-cisco-modules/imm/intersight//modules/policies_sd_card"
  description = local.sdcard_policy != "" ? "${local.sdcard_policy} M5 SD Card Policy with FlexUtil." : "${local.org_name} M5 SD Card Policy with FlexUtil."
  name        = local.sdcard_policy != "" ? "${local.sdcard_policy}_m5flexutil" : "${local.org_name}_m5flexutil"
  org_moid    = local.org_moid
  tags        = var.tags
}


