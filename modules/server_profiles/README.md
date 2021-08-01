# Intersight Management Mode Deployment Module

## Use this module to create IMM Domain Profiles in Intersight

Run the plan from the Terraform cloud Workspace.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_intersight"></a> [intersight](#requirement\_intersight) | >=1.0.11 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_intersight"></a> [intersight](#provider\_intersight) | 1.0.12 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_ucs_server_profile"></a> [ucs\_server\_profile](#module\_ucs\_server\_profile) | ../../../terraform-intersight-imm/modules/server_profile | n/a |

## Resources

| Name | Type |
|------|------|
| [intersight_compute_physical_summary.server](https://registry.terraform.io/providers/CiscoDevNet/intersight/latest/docs/data-sources/compute_physical_summary) | data source |
| [intersight_organization_organization.org_moid](https://registry.terraform.io/providers/CiscoDevNet/intersight/latest/docs/data-sources/organization_organization) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_apikey"></a> [apikey](#input\_apikey) | Intersight API Key. | `string` | n/a | yes |
| <a name="input_endpoint"></a> [endpoint](#input\_endpoint) | Intersight URL. | `string` | `"https://intersight.com"` | no |
| <a name="input_organizations"></a> [organizations](#input\_organizations) | Intersight Organization Names. | `set(string)` | <pre>[<br>  "default"<br>]</pre> | no |
| <a name="input_secretkey"></a> [secretkey](#input\_secretkey) | Intersight Secret Key. | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | List of Key/Value Pairs to Assign as Attributes to the Policy. | `list(map(string))` | `[]` | no |
| <a name="input_ucs_server_profile"></a> [ucs\_server\_profile](#input\_ucs\_server\_profile) | Intersight UCS Server Profile Variable Map.<br>1. organization - Name of the Intersight Organization to assign this pool to:<br>  *  https://intersight.com/an/settings/organizations/<br>2. For the remainder of the option documentation refer to these sources:<br>  * https://github.com/terraform-cisco-modules/terraform-intersight-imm/tree/master/modules/server_profile | <pre>map(object(<br>    {<br>      action              = optional(string)<br>      assign_server       = optional(bool)<br>      description         = optional(string)<br>      name                = optional(string)<br>      operating_system    = optional(string)<br>      organization        = optional(string)<br>      policy_bucket       = optional(list(map(string)))<br>      src_template        = optional(set(string))<br>      tags                = optional(list(map(string)))<br>      target_platform     = optional(string)<br>      type                = optional(string)<br>      wait_for_completion = optional(bool)<br>    }<br>  ))</pre> | <pre>{<br>  "default": {<br>    "action": "No-op",<br>    "assign_server": false,<br>    "description": "",<br>    "name": "",<br>    "operating_system": "vmware",<br>    "organization": "default",<br>    "policy_bucket": [],<br>    "src_template": [],<br>    "tags": [],<br>    "target_platform": "FIAttached",<br>    "type": "instance",<br>    "wait_for_completion": false<br>  }<br>}</pre> | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_physical_servers"></a> [physical\_servers](#output\_physical\_servers) | Moid of the Physical Servers in the Account. |
| <a name="output_ucs_server_profiles"></a> [ucs\_server\_profiles](#output\_ucs\_server\_profiles) | moid of the UCS Server Profiles. |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
