# Create User Privileges in Intersight

* Create Organizations
* Create Resource Groups
* Create Roles
* Create User Groups

## Use this module to create the above objects in Intersight

## Usage

```hcl
module "organizations" {

  source = "terraform-cisco-modules/easy-imm/intersight//modules/organizations"

  # omitted...
}
```

This module will create Pool resources in Intersight.  These pools can be assigned to Policies and Profiles.  

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_intersight"></a> [intersight](#requirement\_intersight) | >=1.0.26 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_intersight"></a> [intersight](#provider\_intersight) | >=1.0.26 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [intersight_iam_permission.roles](https://registry.terraform.io/providers/CiscoDevNet/intersight/latest/docs/resources/iam_permission) | resource |
| [intersight_iam_qualifier.iam_qualifiers](https://registry.terraform.io/providers/CiscoDevNet/intersight/latest/docs/resources/iam_qualifier) | resource |
| [intersight_iam_resource_roles.roles](https://registry.terraform.io/providers/CiscoDevNet/intersight/latest/docs/resources/iam_resource_roles) | resource |
| [intersight_iam_user_group.groups](https://registry.terraform.io/providers/CiscoDevNet/intersight/latest/docs/resources/iam_user_group) | resource |
| [intersight_organization_organization.organizations](https://registry.terraform.io/providers/CiscoDevNet/intersight/latest/docs/resources/organization_organization) | resource |
| [intersight_resource_group.resource_groups](https://registry.terraform.io/providers/CiscoDevNet/intersight/latest/docs/resources/resource_group) | resource |
| [intersight_iam_idp.identity_providers](https://registry.terraform.io/providers/CiscoDevNet/intersight/latest/docs/data-sources/iam_idp) | data source |
| [intersight_iam_role.privileges](https://registry.terraform.io/providers/CiscoDevNet/intersight/latest/docs/data-sources/iam_role) | data source |
| [intersight_organization_organization.organizations](https://registry.terraform.io/providers/CiscoDevNet/intersight/latest/docs/data-sources/organization_organization) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_apikey"></a> [apikey](#input\_apikey) | Intersight API Key. | `string` | n/a | yes |
| <a name="input_endpoint"></a> [endpoint](#input\_endpoint) | Intersight URL. | `string` | `"https://intersight.com"` | no |
| <a name="input_identity_providers"></a> [identity\_providers](#input\_identity\_providers) | Intersight Identity Providers. | `list(string)` | <pre>[<br>  "default"<br>]</pre> | no |
| <a name="input_organizations"></a> [organizations](#input\_organizations) | Key - The name of the organization. There can be multiple organizations under an account.<br>* create\_org - Flag to decide if it is an existing organization or to create the organization<br>* description - The informative description about the usage of this organization.<br>* groups - Map of User Groups to assign to the Organization<br>  - group\_name\_in\_identity\_provider - Group Name assigned from the Identity Provider.  i.e. memberOf<br>  - identity\_provider - The name of the Identity Provider.  Default is Cisco.<br>  - name - The name of the user group which the dynamic user will belong to.<br>  - roles - A List of Roles to assign to the user.<br>* resource\_groups - Map of Resource Groups to Create in Intersight.<br>  - description - The informative description about the usage of this Resource Group.<br>  - qualifier - Qualifier shall be used to specify if we want to organize resources using multiple resource group or single For an account, resource groups can be of only one of the above types. (Both the types are mutually exclusive for an account.).<br>    * Allow-Selectors - Resources will be added to resource groups based on ODATA filter. Multiple resource group can be created to organize resources.<br>    * Allow-All - All resources will become part of the Resource Group. Only one resource group can be created to organize resources.<br>  - selectors - An OData $filter expression which describes the REST resource to be referenced. This field maybe set instead of 'moid' by clients.1. If 'moid' is set this field is ignored.1. If 'selector' is set and 'moid' is empty/absent from the request, Intersight determines the Moid of theresource matching the filter expression and populates it in the MoRef that is part of the objectinstance being inserted/updated to fulfill the REST request.An error is returned if the filter matches zero or more than one REST resource.An example filter string is: Serial eq '3AA8B7T11'.<br>    * Exmaple ["/api/v1/asset/DeviceRegistrations?$filter=Moid in(\"intersight\_asset\_device\_registrations\_registeration1.id\")"]<br>* roles - Map of Roles to assign users or groups to.<br>  - description - The informative description for each role.<br>  - name - Name of the Role to create.<br>  - privileges - The Intersight priviges to assign to the User Group.  Below is the List of Available Privileges:<br>    * Account Administrator<br>    * Audit Log Viewer<br>    * Device Administrator<br>    * Device Technician<br>    * HyperFlex Cluster Administrator<br>    * Kubernetes Administrator<br>    * Kubernetes Operator<br>    * Network Administrator<br>    * Network Operator<br>    * Read-Only<br>    * SAN Administrator<br>    * SAN Operator<br>    * Server Administrator<br>    * Storage Administrator<br>    * Virtualization Administrator<br>    * Workflow Designer<br>    * Workload Optimizer Administrator<br>    * Workload Optimizer Advisor<br>    * Workload Optimizer Automator<br>    * Workload Optimizer Deployer<br>    * Workload Optimizer Observer<br>    * UCS Domain Administrator<br>    * User Access Administrator<br>  * roles - List of Roles to assign to the User Group.  Currently a Maximum of 5 Roles can be assigned. | <pre>map(object(<br>    {<br>      create_org  = optional(bool)<br>      description = optional(string)<br>      groups = list(object(<br>        {<br>          description                     = optional(string)<br>          group_name_in_identity_provider = string<br>          identity_provider               = optional(string)<br>          name                            = string<br>          roles                           = list(string)<br>        }<br>      ))<br>      resource_groups = optional(list(object(<br>        {<br>          description = optional(string)<br>          qualifier   = optional(string)<br>          selectors   = optional(list(string))<br>        }<br>      )))<br>      roles = list(object(<br>        {<br>          name        = string<br>          description = optional(string)<br>          privileges  = list(string)<br>        }<br>      ))<br>    }<br>  ))</pre> | <pre>{<br>  "default": {<br>    "create_org": false,<br>    "description": "",<br>    "groups": [<br>      {<br>        "description": "",<br>        "group_name_in_identity_provider": "**REQUIRED**",<br>        "identity_provider": "Cisco",<br>        "name": "**REQUIRED**",<br>        "roles": [<br>          "**REQUIRED**"<br>        ]<br>      }<br>    ],<br>    "resource_groups": [<br>      {<br>        "description": "",<br>        "qualifier": "Allow-Selectors",<br>        "selectors": []<br>      }<br>    ],<br>    "roles": [<br>      {<br>        "description": "",<br>        "name": "**REQUIRED**",<br>        "privileges": [<br>          "**REQUIRED**"<br>        ]<br>      }<br>    ]<br>  }<br>}</pre> | no |
| <a name="input_secretkey"></a> [secretkey](#input\_secretkey) | Intersight Secret Key. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_created_organizations"></a> [created\_organizations](#output\_created\_organizations) | n/a |
| <a name="output_data_organizations"></a> [data\_organizations](#output\_data\_organizations) | n/a |
| <a name="output_identity_providers"></a> [identity\_providers](#output\_identity\_providers) | n/a |
| <a name="output_privileges"></a> [privileges](#output\_privileges) | n/a |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
