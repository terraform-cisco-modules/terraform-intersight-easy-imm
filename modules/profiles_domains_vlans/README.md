# pools - Intersight Management Mode IP Pool Deployment Module

## Use this module to create IMM Domain Profiles in Intersight

## Usage

```hcl
module "switch_profile" {

  source = "terraform-cisco-modules/easy-imm/intersight//modules/pools"

  # omitted...
}
```

This module will create Pool resources in Intersight.  These pools can be assigned to Policies and Profiles.  

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_intersight"></a> [intersight](#requirement\_intersight) | >=1.0.11 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_intersight"></a> [intersight](#provider\_intersight) | 1.0.12 |
| <a name="provider_terraform"></a> [terraform](#provider\_terraform) | n/a |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_multicast"></a> [multicast](#module\_multicast) | terraform-cisco-modules/imm/intersight//modules/domain_multicast | n/a |
| <a name="module_native_vlan"></a> [native\_vlan](#module\_native\_vlan) | terraform-cisco-modules/imm/intersight//modules/domain_vlan | n/a |
| <a name="module_vlan_list"></a> [vlan\_list](#module\_vlan\_list) | terraform-cisco-modules/imm/intersight//modules/domain_vlan_list | n/a |

## Resources

| Name | Type |
|------|------|
| [intersight_organization_organization.org_moid](https://registry.terraform.io/providers/CiscoDevNet/intersight/latest/docs/data-sources/organization_organization) | data source |
| [terraform_remote_state.domain](https://registry.terraform.io/providers/hashicorp/terraform/latest/docs/data-sources/remote_state) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_apikey"></a> [apikey](#input\_apikey) | Intersight API Key. | `string` | n/a | yes |
| <a name="input_endpoint"></a> [endpoint](#input\_endpoint) | Intersight URL. | `string` | `"https://intersight.com"` | no |
| <a name="input_organizations"></a> [organizations](#input\_organizations) | Intersight Organization Names to Apply Policy to.  https://intersight.com/an/settings/organizations/. | `string` | `"[\"default\"]"` | no |
| <a name="input_secretkey"></a> [secretkey](#input\_secretkey) | Intersight Secret Key. | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | Tags to be Associated with Objects Created in Intersight. | `string` | `"[]"` | no |
| <a name="input_tfc_organization"></a> [tfc\_organization](#input\_tfc\_organization) | Terraform Cloud Organization Name. | `string` | n/a | yes |
| <a name="input_ucs_domain_profile"></a> [ucs\_domain\_profile](#input\_ucs\_domain\_profile) | Please Refer to the ucs\_domain\_profile variable information in the tfe module.  In the domains module the variable is accepted as a string from terraform cloud in the terraform.auto.tfvars and extracted using locals. | `string` | n/a | yes |
| <a name="input_ws_domain"></a> [ws\_domain](#input\_ws\_domain) | Name of the domain workspace. | `string` | `"Kubernetes_Policies"` | no |

## Outputs

No outputs.
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
