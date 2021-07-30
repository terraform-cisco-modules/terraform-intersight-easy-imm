# pools - Intersight Management Mode IP Pool Deployment Module

## Use this module to create IMM Domain Profiles in Intersight

## Usage

```hcl
module "pools" {

  source = "terraform-cisco-modules/easy-imm/intersight//modules/pools"

  # omitted...
}
```

This module will create Pool resources in Intersight.  These pools can be assigned to Policies and Profiles.  

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_intersight"></a> [intersight](#provider\_intersight) | 1.0.11 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_fc_pools"></a> [fc\_pools](#module\_fc\_pools) | terraform-cisco-modules/imm/intersight//modules/pools_fc | n/a |
| <a name="module_ip_pools"></a> [ip\_pools](#module\_ip\_pools) | terraform-cisco-modules/imm/intersight//modules/pools_ip | n/a |
| <a name="module_iqn_pools"></a> [iqn\_pools](#module\_iqn\_pools) | terraform-cisco-modules/imm/intersight//modules/pools_iqn | n/a |
| <a name="module_mac_pools"></a> [mac\_pools](#module\_mac\_pools) | terraform-cisco-modules/imm/intersight//modules/pools_mac | n/a |
| <a name="module_uuid_pools"></a> [uuid\_pools](#module\_uuid\_pools) | terraform-cisco-modules/imm/intersight//modules/pools_uuid | n/a |

## Resources

| Name | Type |
|------|------|
| [intersight_organization_organization.org_moid](https://registry.terraform.io/providers/CiscoDevNet/intersight/latest/docs/data-sources/organization_organization) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_apikey"></a> [apikey](#input\_apikey) | Intersight API Key. | `string` | n/a | yes |
| <a name="input_endpoint"></a> [endpoint](#input\_endpoint) | Intersight URL. | `string` | `"https://intersight.com"` | no |
| <a name="input_fc_pools_create"></a> [fc\_pools\_create](#input\_fc\_pools\_create) | Set this to True if you want to Create a Fibre-Channel Pool. | `bool` | `false` | no |
| <a name="input_fc_pools_map"></a> [fc\_pools\_map](#input\_fc\_pools\_map) | Please Refer to the fc\_pools\_map variable information in the tfe module.  In the pools module the variable is accepted as a string from terraform cloud in the terraform.auto.tfvars and extracted using locals. | `string` | n/a | yes |
| <a name="input_ip_pools_create"></a> [ip\_pools\_create](#input\_ip\_pools\_create) | Set this to True if you want to Create an IP Pool. | `bool` | `false` | no |
| <a name="input_ip_pools_map"></a> [ip\_pools\_map](#input\_ip\_pools\_map) | Please Refer to the ip\_pools\_map variable information in the tfe module.  In the pools module the variable is accepted as a string from terraform cloud in the terraform.auto.tfvars and extracted using locals. | `string` | n/a | yes |
| <a name="input_iqn_pools_create"></a> [iqn\_pools\_create](#input\_iqn\_pools\_create) | Set this to True if you want to Create an IQN Pool. | `bool` | `false` | no |
| <a name="input_iqn_pools_map"></a> [iqn\_pools\_map](#input\_iqn\_pools\_map) | Please Refer to the iqn\_pools\_map variable information in the tfe module.  In the pools module the variable is accepted as a string from terraform cloud in the terraform.auto.tfvars and extracted using locals. | `string` | n/a | yes |
| <a name="input_mac_pools_create"></a> [mac\_pools\_create](#input\_mac\_pools\_create) | Set this to True if you want to Create an MAC Pool. | `bool` | `false` | no |
| <a name="input_mac_pools_map"></a> [mac\_pools\_map](#input\_mac\_pools\_map) | Please Refer to the mac\_pools\_map variable information in the tfe module.  In the pools module the variable is accepted as a string from terraform cloud in the terraform.auto.tfvars and extracted using locals. | `string` | n/a | yes |
| <a name="input_organizations"></a> [organizations](#input\_organizations) | Intersight Organization Names to Apply Policy to.  https://intersight.com/an/settings/organizations/. | `string` | `"[\"default\"]"` | no |
| <a name="input_secretkey"></a> [secretkey](#input\_secretkey) | Intersight Secret Key. | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | Tags to be Associated with Objects Created in Intersight. | `string` | `"[]"` | no |
| <a name="input_uuid_pools_create"></a> [uuid\_pools\_create](#input\_uuid\_pools\_create) | Set this to True if you want to Create an MAC Pool. | `bool` | `false` | no |
| <a name="input_uuid_pools_map"></a> [uuid\_pools\_map](#input\_uuid\_pools\_map) | Please Refer to the uuid\_pools\_map variable information in the tfe module.  In the pools module the variable is accepted as a string from terraform cloud in the terraform.auto.tfvars and extracted using locals. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_endpoint"></a> [endpoint](#output\_endpoint) | Intersight URL. |
| <a name="output_fc_pools"></a> [fc\_pools](#output\_fc\_pools) | moid of the Fibre-Channel Pools. |
| <a name="output_ip_pools"></a> [ip\_pools](#output\_ip\_pools) | moid of the IP Pools. |
| <a name="output_iqn_pools"></a> [iqn\_pools](#output\_iqn\_pools) | moid of the IQN Pools. |
| <a name="output_mac_pools"></a> [mac\_pools](#output\_mac\_pools) | moid of the MAC Pools. |
| <a name="output_org_moids"></a> [org\_moids](#output\_org\_moids) | n/a |
| <a name="output_tags"></a> [tags](#output\_tags) | Tags to be Associated with Objects Created in Intersight. |
| <a name="output_uuid_pools"></a> [uuid\_pools](#output\_uuid\_pools) | moid of the UUID Pools. |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
