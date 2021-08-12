#____________________________________________________________
#
# SMTP Policy
# GUI Location: Policies > Create Policy
#____________________________________________________________

module "smtp" {
  depends_on = [
    data.intersight_organization_organization.org_moid
  ]
  source          = "terraform-cisco-modules/imm/intersight//modules/policies_smtp"
  description     = local.smtp_policy != "" ? "${local.smtp_policy} SMTP Policy." : "${local.org_name} SMTP Policy."
  name            = local.smtp_policy != "" ? local.smtp_policy : local.org_name
  org_moid        = local.org_moid
  sender_email    = "admin@example.com"
  smtp_recipients = ["server_admins@example.com"]
  smtp_server     = "smtp-relay.example.com"
  tags            = var.tags
}


