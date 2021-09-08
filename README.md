# Intersight Module - Easy Intersight Managed Mode

## Use Cases

* Build Workspaces in TFCB to support Infrastructure as Code Provisioning.
* Use TFCB to provision Intersight Pools.
* Use TFCB to provision Intersight IMM Policies.
* Use TFCB to provision UCS Domains in IMM Mode.
* Use TFCB to provision UCS Server Profiles in IMM Mode.

### Pools - module/pools

* Fibre-Channel Pools (WWNN/WWPN)
* IP Pools
* IQN Pools
* MAC Pools
* UUID Pools

### Domain Policies - module/domains and module/domain_vlans

* Ethernet Network Control (CDP/LLDP)
* Ethernet Network Group (VLAN Groups)
* Flow Control
* Link Aggregation
* Link Control
* Multicast
* Network Connectivity (DNS)
* NTP
* Port
* SNMP
* Switch Control
* Syslog
* System QoS
* VLAN
* VSAN

### Server Policies - module/policies

* Adapter Configuration (Standalone Servers)
* BIOS
* Boot Order
* Certificate Management (under development)
* Device Connector
* Disk Group
* Ethernet Adapter (vnIC Adapter Policy)
* Ethernet Network (Standalone Servers)
* Ethernet Network Control (CDP/LLDP)
* Ethernet Network Group (VLAN Groups)
* Ethernet QoS (vNIC QoS)
* Fibre Channel Adapter (vHBA Adapter Policy)
* Fibre Channel Network
* Fibre Channel QoS (vHBA QoS)
* IMC Access
* IPMI Over LAN
* iSCSI Adapter
* iSCSI Boot
* iSCSI Static Target
* LAN Connectivity
* LDAP (Standalone Servers)
* Local User
* Network Connectivity
* NTP
* Persistent Memory
* Power
* SAN Connectivity
* SD Card
* Serial Over LAN
* SMTP
* SNMP
* SSH
* Storage
* Syslog
* Virtual KVM
* Virtual Media

### Pre-requisites and Guidelines

1. Sign up for a user account on Intersight.com. You will need at least one Advantage Tier license as well as a Intersight Workload Optimizer license to complete this use case. Log in to intersight.com and generate API/Secret Keys.  Both licensing requirements can utilize the available demo licensing if you don't have the subscription levels.

2. Sign up for a TFCB (Terraform for Cloud Business) at <https://app.terraform.io/>. Log in and generate the User API Key. You will need this when you create the TF Cloud Target in Intersight.  If not a paid version, you will need to enable the trial account.

3. Clone this repository to your own VCS Repository for the VCS Integration with Terraform Cloud.

4. Integrate your VCS Repository into the TFCB Orgnization following these instructions: <https://www.terraform.io/docs/cloud/vcs/index.html>.  Be sure to copy the OAth Token which you will use later on for Workspace provisioning.

## VERY IMPORTANT NOTE: The Terraform Cloud provider stores terraform state in plain text.  Do not remove the .gitignore that is protecting you from uploading the state files to a public repository in this base directory.  The rest of the modules don't have this same risk

## Obtain tokens and keys

### Terraform Cloud Variables

* terraform_cloud_token

  instructions: <https://www.terraform.io/docs/cloud/users-teams-organizations/api-tokens.html>

* tfc_oath_token

  instructions: <https://www.terraform.io/docs/cloud/vcs/index.html>

* tfc_organization (TFCB Organization Name)
* tfc_email (Must be an Email Assigned to the TFCB Account)
* agent_pool (The Name of the Agent Pool in the TFCB Account)
* vcs_repo (The Name of your Version Control Repository. i.e. CiscoDevNet/intersight-tfb-iks)

### Intersight Variables

* apikey
* secretkey

  instructions: <https://community.cisco.com/t5/data-center-documents/intersight-api-overview/ta-p/3651994>

### Import the Variables into your Environment before Running the Terraform Cloud Provider module(s) in this directory

Modify the terraform.tfvars file to the unique attributes of your environment for your domain and server profiles and policies.

Once finished with the modification commit the changes to your reposotiry.

The Following examples are for a Linux based Operating System.  Note that the TF_VAR_ prefix is used as a notification to the terraform engine that the environment variable will be consumed by terraform.

* Terraform Cloud Variables

```bash
export TF_VAR_terraform_cloud_token="your_cloud_token"
export TF_VAR_tfc_oauth_token="your_oath_token"
```

* Intersight apikey and secretkey

```bash
export TF_VAR_apikey="your_api_key"
export TF_VAR_secretkey=`../../../../intersight_secretkey.txt`
```

### SNMP Secure Variables

Use the following environment variables based on your deployment for SNMP Settings

* SNMP User Attributes

```bash
export TF_VAR_snmp_user_1_auth_password="your_password"
export TF_VAR_snmp_user_1_privacy_password="your_password"
export TF_VAR_snmp_user_2_auth_password="your_password"
export TF_VAR_snmp_user_2_privacy_password="your_password"
```

* SNMP Communities

```bash
export TF_VAR_snmp_community="your_community"
export TF_VAR_trap_community="your_community"
```

### Execute the Terraform Plan

Once all Variables have been imported into your environment, run the plan in the tfe folder:

* Execute the Plan

```bash
terraform plan -out=main.plan
terraform apply main.plan
```

When run, this module will Create the Terraform Cloud Workspace(s) and Assign the Variables to the workspace(s).

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_tfe"></a> [tfe](#requirement\_tfe) | 0.25.3 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_sensitive_intersight_variables"></a> [sensitive\_intersight\_variables](#module\_sensitive\_intersight\_variables) | terraform-cisco-modules/modules/tfe//modules/tfc_variables | n/a |
| <a name="module_sensitive_server_variables"></a> [sensitive\_server\_variables](#module\_sensitive\_server\_variables) | terraform-cisco-modules/modules/tfe//modules/tfc_variables | n/a |
| <a name="module_sensitive_snmp_variables"></a> [sensitive\_snmp\_variables](#module\_sensitive\_snmp\_variables) | terraform-cisco-modules/modules/tfe//modules/tfc_variables | n/a |
| <a name="module_workspaces"></a> [workspaces](#module\_workspaces) | terraform-cisco-modules/modules/tfe//modules/tfc_workspace | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_access_community_string_1"></a> [access\_community\_string\_1](#input\_access\_community\_string\_1) | The default SNMPv1, SNMPv2c community name or SNMPv3 username to include on any trap messages sent to the SNMP host. The name can be 18 characters long. | `string` | `""` | no |
| <a name="input_access_community_string_2"></a> [access\_community\_string\_2](#input\_access\_community\_string\_2) | The default SNMPv1, SNMPv2c community name or SNMPv3 username to include on any trap messages sent to the SNMP host. The name can be 18 characters long. | `string` | `""` | no |
| <a name="input_access_community_string_3"></a> [access\_community\_string\_3](#input\_access\_community\_string\_3) | The default SNMPv1, SNMPv2c community name or SNMPv3 username to include on any trap messages sent to the SNMP host. The name can be 18 characters long. | `string` | `""` | no |
| <a name="input_access_community_string_4"></a> [access\_community\_string\_4](#input\_access\_community\_string\_4) | The default SNMPv1, SNMPv2c community name or SNMPv3 username to include on any trap messages sent to the SNMP host. The name can be 18 characters long. | `string` | `""` | no |
| <a name="input_access_community_string_5"></a> [access\_community\_string\_5](#input\_access\_community\_string\_5) | The default SNMPv1, SNMPv2c community name or SNMPv3 username to include on any trap messages sent to the SNMP host. The name can be 18 characters long. | `string` | `""` | no |
| <a name="input_apikey"></a> [apikey](#input\_apikey) | Intersight API Key. | `string` | n/a | yes |
| <a name="input_ipmi_key_1"></a> [ipmi\_key\_1](#input\_ipmi\_key\_1) | Encryption key to use for IPMI communication. It should have an even number of hexadecimal characters and not exceed 40 characters. | `string` | `""` | no |
| <a name="input_ldap_password"></a> [ldap\_password](#input\_ldap\_password) | The password of the user for initial bind process. It can be any string that adheres to the following constraints. It can have character except spaces, tabs, line breaks. It cannot be more than 254 characters. | `string` | `""` | no |
| <a name="input_local_user_password_1"></a> [local\_user\_password\_1](#input\_local\_user\_password\_1) | Password to assign to a local user.  Sensitive Variables cannot be added to a for\_each loop so these are added seperately. | `string` | `""` | no |
| <a name="input_local_user_password_2"></a> [local\_user\_password\_2](#input\_local\_user\_password\_2) | Password to assign to a local user.  Sensitive Variables cannot be added to a for\_each loop so these are added seperately. | `string` | `""` | no |
| <a name="input_local_user_password_3"></a> [local\_user\_password\_3](#input\_local\_user\_password\_3) | Password to assign to a local user.  Sensitive Variables cannot be added to a for\_each loop so these are added seperately. | `string` | `""` | no |
| <a name="input_local_user_password_4"></a> [local\_user\_password\_4](#input\_local\_user\_password\_4) | Password to assign to a local user.  Sensitive Variables cannot be added to a for\_each loop so these are added seperately. | `string` | `""` | no |
| <a name="input_local_user_password_5"></a> [local\_user\_password\_5](#input\_local\_user\_password\_5) | Password to assign to a local user.  Sensitive Variables cannot be added to a for\_each loop so these are added seperately. | `string` | `""` | no |
| <a name="input_persistent_passphrase"></a> [persistent\_passphrase](#input\_persistent\_passphrase) | Secure passphrase to be applied on the Persistent Memory Modules on the server. The allowed characters are a-z, A to Z, 0-9, and special characters =, !, &, #, $, %, +, ^, @, \_, *, -. | `string` | `""` | no |
| <a name="input_secretkey"></a> [secretkey](#input\_secretkey) | Intersight Secret Key. | `string` | n/a | yes |
| <a name="input_snmp_auth_password_1"></a> [snmp\_auth\_password\_1](#input\_snmp\_auth\_password\_1) | SNMPv3 User Authentication Password. | `string` | `""` | no |
| <a name="input_snmp_auth_password_2"></a> [snmp\_auth\_password\_2](#input\_snmp\_auth\_password\_2) | SNMPv3 User Authentication Password. | `string` | `""` | no |
| <a name="input_snmp_auth_password_3"></a> [snmp\_auth\_password\_3](#input\_snmp\_auth\_password\_3) | SNMPv3 User Authentication Password. | `string` | `""` | no |
| <a name="input_snmp_auth_password_4"></a> [snmp\_auth\_password\_4](#input\_snmp\_auth\_password\_4) | SNMPv3 User Authentication Password. | `string` | `""` | no |
| <a name="input_snmp_auth_password_5"></a> [snmp\_auth\_password\_5](#input\_snmp\_auth\_password\_5) | SNMPv3 User Authentication Password. | `string` | `""` | no |
| <a name="input_snmp_privacy_password_1"></a> [snmp\_privacy\_password\_1](#input\_snmp\_privacy\_password\_1) | SNMPv3 User Privacy Password. | `string` | `""` | no |
| <a name="input_snmp_privacy_password_2"></a> [snmp\_privacy\_password\_2](#input\_snmp\_privacy\_password\_2) | SNMPv3 User Privacy Password. | `string` | `""` | no |
| <a name="input_snmp_privacy_password_3"></a> [snmp\_privacy\_password\_3](#input\_snmp\_privacy\_password\_3) | SNMPv3 User Privacy Password. | `string` | `""` | no |
| <a name="input_snmp_privacy_password_4"></a> [snmp\_privacy\_password\_4](#input\_snmp\_privacy\_password\_4) | SNMPv3 User Privacy Password. | `string` | `""` | no |
| <a name="input_snmp_privacy_password_5"></a> [snmp\_privacy\_password\_5](#input\_snmp\_privacy\_password\_5) | SNMPv3 User Privacy Password. | `string` | `""` | no |
| <a name="input_snmp_trap_community_1"></a> [snmp\_trap\_community\_1](#input\_snmp\_trap\_community\_1) | Community for a Trap Destination. | `string` | `""` | no |
| <a name="input_snmp_trap_community_2"></a> [snmp\_trap\_community\_2](#input\_snmp\_trap\_community\_2) | Community for a Trap Destination. | `string` | `""` | no |
| <a name="input_snmp_trap_community_3"></a> [snmp\_trap\_community\_3](#input\_snmp\_trap\_community\_3) | Community for a Trap Destination. | `string` | `""` | no |
| <a name="input_snmp_trap_community_4"></a> [snmp\_trap\_community\_4](#input\_snmp\_trap\_community\_4) | Community for a Trap Destination. | `string` | `""` | no |
| <a name="input_snmp_trap_community_5"></a> [snmp\_trap\_community\_5](#input\_snmp\_trap\_community\_5) | Community for a Trap Destination. | `string` | `""` | no |
| <a name="input_terraform_cloud_token"></a> [terraform\_cloud\_token](#input\_terraform\_cloud\_token) | Token to Authenticate to the Terraform Cloud. | `string` | n/a | yes |
| <a name="input_terraform_version"></a> [terraform\_version](#input\_terraform\_version) | Terraform Target Version. | `string` | `"1.0.3"` | no |
| <a name="input_tfc_oauth_token"></a> [tfc\_oauth\_token](#input\_tfc\_oauth\_token) | Terraform Cloud OAuth Token for VCS\_Repo Integration. | `string` | n/a | yes |
| <a name="input_tfc_organization"></a> [tfc\_organization](#input\_tfc\_organization) | Terraform Cloud Organization Name. | `string` | n/a | yes |
| <a name="input_trap_community_string_1"></a> [trap\_community\_string\_1](#input\_trap\_community\_string\_1) | The default SNMPv1, SNMPv2c community name or SNMPv3 username to include on any trap messages sent to the SNMP host. The name can be 18 characters long. | `string` | `""` | no |
| <a name="input_trap_community_string_2"></a> [trap\_community\_string\_2](#input\_trap\_community\_string\_2) | The default SNMPv1, SNMPv2c community name or SNMPv3 username to include on any trap messages sent to the SNMP host. The name can be 18 characters long. | `string` | `""` | no |
| <a name="input_trap_community_string_3"></a> [trap\_community\_string\_3](#input\_trap\_community\_string\_3) | The default SNMPv1, SNMPv2c community name or SNMPv3 username to include on any trap messages sent to the SNMP host. The name can be 18 characters long. | `string` | `""` | no |
| <a name="input_trap_community_string_4"></a> [trap\_community\_string\_4](#input\_trap\_community\_string\_4) | The default SNMPv1, SNMPv2c community name or SNMPv3 username to include on any trap messages sent to the SNMP host. The name can be 18 characters long. | `string` | `""` | no |
| <a name="input_trap_community_string_5"></a> [trap\_community\_string\_5](#input\_trap\_community\_string\_5) | The default SNMPv1, SNMPv2c community name or SNMPv3 username to include on any trap messages sent to the SNMP host. The name can be 18 characters long. | `string` | `""` | no |
| <a name="input_vcs_repo"></a> [vcs\_repo](#input\_vcs\_repo) | Version Control System Repository. | `string` | n/a | yes |
| <a name="input_workspaces"></a> [workspaces](#input\_workspaces) | Map of Workspaces to create in Terraform Cloud.<br>key - Name of the Workspace to Create.<br>* description - A Description for the Workspace.<br>* working\_directory - The Directory of the Version Control Repository that contains the Terraform code for UCS Domain Profiles for this Workspace.<br>* workspace\_type - What Type of Workspace will this Create.  Options are:<br>  - chassis<br>  - domain<br>  - pool<br>  - server<br>  - vlan | <pre>map(object(<br>    {<br>      auto_apply        = optional(bool)<br>      description       = optional(string)<br>      working_directory = optional(string)<br>      workspace_type    = optional(string)<br>    }<br>  ))</pre> | <pre>{<br>  "default": {<br>    "auto_apply": true,<br>    "description": "",<br>    "working_directory": "modules/pools",<br>    "workspace_type": "pool"<br>  }<br>}</pre> | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_workspaces"></a> [workspaces](#output\_workspaces) | Terraform Cloud Workspace IDs and Names. |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
