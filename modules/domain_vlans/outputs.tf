#__________________________________________________________
#
# Intersight Ouptuts
#__________________________________________________________

output "endpoint" {
  description = "Intersight URL."
  value       = var.endpoint
}

output "org_moids" {
  value = {
    for v in sort(keys(data.intersight_organization_organization.org_moid)) : v => {
      moid = data.intersight_organization_organization.org_moid[v].results[0].moid
    }
  }
}

#__________________________________________________________
#
# Global Variable Outputs
#__________________________________________________________

output "tags" {
  description = "Tags to be Associated with Objects Created in Intersight."
  value       = local.tags
}
