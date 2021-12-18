# Intersight UCS Server Profiles Deployment Module

## Use this module to create UCS Server Profiles in Intersight

## Usage

```hcl
module "profiles_servers" {

  source = "terraform-cisco-modules/easy-imm/intersight//modules/profiles_servers"

  # omitted...
}
```

This module will create UCS Server Profiles in Intersight.  

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_intersight"></a> [intersight](#requirement\_intersight) | >=1.0.13 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_ucs_server_firmware"></a> [ucs\_server\_firmware](#module\_ucs\_server\_firmware) | terraform-cisco-modules/imm/intersight//modules/ucs_server_firmware | >=0.9.6 |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_apikey"></a> [apikey](#input\_apikey) | Intersight API Key. | `string` | n/a | yes |
| <a name="input_auth_password_direct"></a> [auth\_password\_direct](#input\_auth\_password\_direct) | Password for Direct Download Authentication. | `string` | `""` | no |
| <a name="input_auth_password_filesrv"></a> [auth\_password\_filesrv](#input\_auth\_password\_filesrv) | Password for File Server Authentication. | `string` | `""` | no |
| <a name="input_endpoint"></a> [endpoint](#input\_endpoint) | Intersight URL. | `string` | `"https://intersight.com"` | no |
| <a name="input_firmware_upgrade_server"></a> [firmware\_upgrade\_server](#input\_firmware\_upgrade\_server) | key - Version of UCS Software to Apply to the environment.  I.e 4.1(3c)<br>* auth\_username - Username used to authenticate to any service; i.e. cifs, direct, nfs and www.<br>* exclude\_components    - An Array of Elements to Exclude from the Upgrade Proceedure.<br>* file\_location - ""<br>* file\_server - ""<br>* http\_image\_url - ""<br>* image\_source - "cisco"<br>* map\_type - "www"<br>* mount\_options - ""<br>* organization - "default"<br>* skip\_estimate\_impact - false<br>* server\_names - []<br>* tags - []<br>* upgrade\_type - "direct\_upgrade"<br>* upgradeoption\_direct - "upgrade\_full"<br>* upgradeoption\_filesrv - "nw\_upgrade\_full"<br>* com\_port - Communications Port to Assign to the Policy.  Options are:<br>  - com0<br>  - com1<br>* description - Description to Assign to the Policy.<br>* enabled - Flag to Enable or Disable the Policy.<br>* organization - Name of the Intersight Organization to assign this Policy to.<br>  - https://intersight.com/an/settings/organizations/<br>* ssh\_port - SSH Port to Assign to the Policy.  Range is between 1024-65535.<br>* tags - List of Key/Value Pairs to Assign as Attributes to the Policy. | <pre>map(object(<br>    {<br>      baud_rate    = optional(number)<br>      com_port     = optional(string)<br>      description  = optional(string)<br>      enabled      = optional(bool)<br>      organization = optional(string)<br>      ssh_port     = optional(number)<br>      tags         = optional(list(map(string)))<br>    }<br>  ))</pre> | <pre>{<br>  "default": {<br>    "auth_username": "**REQUIRED**",<br>    "exclude_components": [],<br>    "file_location": "",<br>    "file_server": "",<br>    "http_image_url": "",<br>    "image_source": "cisco",<br>    "map_type": "www",<br>    "mount_options": "",<br>    "organization": "default",<br>    "server_names": [],<br>    "skip_estimate_impact": false,<br>    "tags": [],<br>    "upgrade_type": "direct_upgrade",<br>    "upgradeoption_direct": "upgrade_full",<br>    "upgradeoption_filesrv": "nw_upgrade_full"<br>  }<br>}</pre> | no |
| <a name="input_organizations"></a> [organizations](#input\_organizations) | Intersight Organization Names. | `set(string)` | <pre>[<br>  "default"<br>]</pre> | no |
| <a name="input_secretkey"></a> [secretkey](#input\_secretkey) | Intersight Secret Key. | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | List of Key/Value Pairs to Assign as Attributes to the Policy. | `list(map(string))` | `[]` | no |
| <a name="input_tfc_organization"></a> [tfc\_organization](#input\_tfc\_organization) | Terraform Cloud Organization. | `string` | n/a | yes |
| <a name="input_ws_pools"></a> [ws\_pools](#input\_ws\_pools) | Pools Workspace Name. | `string` | n/a | yes |

## Outputs

No outputs.
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
