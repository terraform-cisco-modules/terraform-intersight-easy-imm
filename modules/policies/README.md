# policies - Intersight Management Mode Policies Deployment Module

## Use this module to create Intersight Managed Mode Policies in Intersight

## Usage

```hcl
module "policies" {

  source = "terraform-cisco-modules/easy-imm/intersight//modules/policies"

  # omitted...
}
```

This module will create Policy resources in Intersight.  These Policies can be assigned to Server and UCS Domain Profiles.  

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_intersight"></a> [intersight](#requirement\_intersight) | >=1.0.11 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_intersight"></a> [intersight](#provider\_intersight) | 1.0.11 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_bios_blade_virtualization"></a> [bios\_blade\_virtualization](#module\_bios\_blade\_virtualization) | terraform-cisco-modules/imm/intersight//modules/policies_bios | n/a |
| <a name="module_bios_nvmeof"></a> [bios\_nvmeof](#module\_bios\_nvmeof) | terraform-cisco-modules/imm/intersight//modules/policies_bios | n/a |
| <a name="module_boot_uefi_m2pch"></a> [boot\_uefi\_m2pch](#module\_boot\_uefi\_m2pch) | terraform-cisco-modules/imm/intersight//modules/policies_boot_order | n/a |
| <a name="module_boot_uefi_m2raid"></a> [boot\_uefi\_m2raid](#module\_boot\_uefi\_m2raid) | terraform-cisco-modules/imm/intersight//modules/policies_boot_order | n/a |
| <a name="module_boot_uefi_sdcard"></a> [boot\_uefi\_sdcard](#module\_boot\_uefi\_sdcard) | terraform-cisco-modules/imm/intersight//modules/policies_boot_order | n/a |
| <a name="module_device_connector"></a> [device\_connector](#module\_device\_connector) | terraform-cisco-modules/imm/intersight//modules/policies_device_connector | n/a |
| <a name="module_disk_group_raid1"></a> [disk\_group\_raid1](#module\_disk\_group\_raid1) | terraform-cisco-modules/imm/intersight//modules/policies_disk_group | n/a |
| <a name="module_disk_group_raid10"></a> [disk\_group\_raid10](#module\_disk\_group\_raid10) | terraform-cisco-modules/imm/intersight//modules/policies_disk_group | n/a |
| <a name="module_disk_group_raid5"></a> [disk\_group\_raid5](#module\_disk\_group\_raid5) | terraform-cisco-modules/imm/intersight//modules/policies_disk_group | n/a |
| <a name="module_dns"></a> [dns](#module\_dns) | terraform-cisco-modules/imm/intersight//modules/policies_network_connectivity | n/a |
| <a name="module_imc_access"></a> [imc\_access](#module\_imc\_access) | terraform-cisco-modules/imm/intersight//modules/policies_imc_access | n/a |
| <a name="module_ipmi_over_lan"></a> [ipmi\_over\_lan](#module\_ipmi\_over\_lan) | terraform-cisco-modules/imm/intersight//modules/policies_ipmi_over_lan | n/a |
| <a name="module_ldap_groups"></a> [ldap\_groups](#module\_ldap\_groups) | terraform-cisco-modules/imm/intersight//modules/policies_ldap_group | n/a |
| <a name="module_ldap_policy"></a> [ldap\_policy](#module\_ldap\_policy) | terraform-cisco-modules/imm/intersight//modules/policies_ldap_policy | n/a |
| <a name="module_ldap_provider"></a> [ldap\_provider](#module\_ldap\_provider) | terraform-cisco-modules/imm/intersight//modules/policies_ldap_provider | n/a |
| <a name="module_local_user_policy"></a> [local\_user\_policy](#module\_local\_user\_policy) | terraform-cisco-modules/imm/intersight//modules/policies_local_user_policy | n/a |
| <a name="module_local_users"></a> [local\_users](#module\_local\_users) | terraform-cisco-modules/imm/intersight//modules/policies_local_user | n/a |
| <a name="module_ntp"></a> [ntp](#module\_ntp) | terraform-cisco-modules/imm/intersight//modules/policies_ntp | n/a |
| <a name="module_persistent_memory"></a> [persistent\_memory](#module\_persistent\_memory) | terraform-cisco-modules/imm/intersight//modules/policies_persistent_memory | n/a |
| <a name="module_sd_card_m4"></a> [sd\_card\_m4](#module\_sd\_card\_m4) | terraform-cisco-modules/imm/intersight//modules/policies_sd_card | n/a |
| <a name="module_sd_card_m5"></a> [sd\_card\_m5](#module\_sd\_card\_m5) | terraform-cisco-modules/imm/intersight//modules/policies_sd_card | n/a |
| <a name="module_sd_card_m5_flexutil"></a> [sd\_card\_m5\_flexutil](#module\_sd\_card\_m5\_flexutil) | terraform-cisco-modules/imm/intersight//modules/policies_sd_card | n/a |
| <a name="module_serial_over_lan"></a> [serial\_over\_lan](#module\_serial\_over\_lan) | terraform-cisco-modules/imm/intersight//modules/policies_serial_over_lan | n/a |
| <a name="module_smtp"></a> [smtp](#module\_smtp) | terraform-cisco-modules/imm/intersight//modules/policies_smtp | n/a |
| <a name="module_snmp"></a> [snmp](#module\_snmp) | terraform-cisco-modules/imm/intersight//modules/policies_snmp | n/a |
| <a name="module_ssh_disable"></a> [ssh\_disable](#module\_ssh\_disable) | terraform-cisco-modules/imm/intersight//modules/policies_ssh | n/a |
| <a name="module_ssh_enable"></a> [ssh\_enable](#module\_ssh\_enable) | terraform-cisco-modules/imm/intersight//modules/policies_ssh | n/a |
| <a name="module_storage"></a> [storage](#module\_storage) | terraform-cisco-modules/imm/intersight//modules/policies_storage | n/a |
| <a name="module_syslog"></a> [syslog](#module\_syslog) | terraform-cisco-modules/imm/intersight//modules/policies_syslog | n/a |
| <a name="module_vhba_adapter"></a> [vhba\_adapter](#module\_vhba\_adapter) | terraform-cisco-modules/imm/intersight//modules/policies_vhba_adapter | n/a |
| <a name="module_vhba_network_a"></a> [vhba\_network\_a](#module\_vhba\_network\_a) | terraform-cisco-modules/imm/intersight//modules/policies_vhba_network | n/a |
| <a name="module_vhba_network_b"></a> [vhba\_network\_b](#module\_vhba\_network\_b) | terraform-cisco-modules/imm/intersight//modules/policies_vhba_network | n/a |
| <a name="module_vhba_qos"></a> [vhba\_qos](#module\_vhba\_qos) | terraform-cisco-modules/imm/intersight//modules/policies_vhba_qos | n/a |
| <a name="module_virtual_kvm"></a> [virtual\_kvm](#module\_virtual\_kvm) | terraform-cisco-modules/imm/intersight//modules/policies_virtual_kvm | n/a |
| <a name="module_virtual_media"></a> [virtual\_media](#module\_virtual\_media) | terraform-cisco-modules/imm/intersight//modules/policies_virtual_media | n/a |
| <a name="module_vnic_adapter_linux"></a> [vnic\_adapter\_linux](#module\_vnic\_adapter\_linux) | terraform-cisco-modules/imm/intersight//modules/policies_vnic_adapter | n/a |
| <a name="module_vnic_adapter_nvmeof"></a> [vnic\_adapter\_nvmeof](#module\_vnic\_adapter\_nvmeof) | terraform-cisco-modules/imm/intersight//modules/policies_vnic_adapter | n/a |
| <a name="module_vnic_adapter_vmware"></a> [vnic\_adapter\_vmware](#module\_vnic\_adapter\_vmware) | terraform-cisco-modules/imm/intersight//modules/policies_vnic_adapter | n/a |
| <a name="module_vnic_adapter_windows"></a> [vnic\_adapter\_windows](#module\_vnic\_adapter\_windows) | terraform-cisco-modules/imm/intersight//modules/policies_vnic_adapter | n/a |
| <a name="module_vnic_lan_connectivity"></a> [vnic\_lan\_connectivity](#module\_vnic\_lan\_connectivity) | terraform-cisco-modules/imm/intersight//modules/policies_vnic_lan_connectivity | n/a |
| <a name="module_vnic_loop"></a> [vnic\_loop](#module\_vnic\_loop) | terraform-cisco-modules/imm/intersight//modules/policies_vnic_loop | n/a |
| <a name="module_vnic_netctrl_policy"></a> [vnic\_netctrl\_policy](#module\_vnic\_netctrl\_policy) | terraform-cisco-modules/imm/intersight//modules/policies_vnic_network_control | n/a |
| <a name="module_vnic_netctrl_policy_cdp"></a> [vnic\_netctrl\_policy\_cdp](#module\_vnic\_netctrl\_policy\_cdp) | terraform-cisco-modules/imm/intersight//modules/policies_vnic_network_control | n/a |
| <a name="module_vnic_netctrl_policy_lldp"></a> [vnic\_netctrl\_policy\_lldp](#module\_vnic\_netctrl\_policy\_lldp) | terraform-cisco-modules/imm/intersight//modules/policies_vnic_network_control | n/a |
| <a name="module_vnic_qos_best_effort"></a> [vnic\_qos\_best\_effort](#module\_vnic\_qos\_best\_effort) | terraform-cisco-modules/imm/intersight//modules/policies_vnic_qos | n/a |
| <a name="module_vnic_qos_bronze"></a> [vnic\_qos\_bronze](#module\_vnic\_qos\_bronze) | terraform-cisco-modules/imm/intersight//modules/policies_vnic_qos | n/a |
| <a name="module_vnic_qos_gold"></a> [vnic\_qos\_gold](#module\_vnic\_qos\_gold) | terraform-cisco-modules/imm/intersight//modules/policies_vnic_qos | n/a |
| <a name="module_vnic_qos_platinum"></a> [vnic\_qos\_platinum](#module\_vnic\_qos\_platinum) | terraform-cisco-modules/imm/intersight//modules/policies_vnic_qos | n/a |
| <a name="module_vnic_qos_silver"></a> [vnic\_qos\_silver](#module\_vnic\_qos\_silver) | terraform-cisco-modules/imm/intersight//modules/policies_vnic_qos | n/a |
| <a name="module_vnic_vlan_group_livem"></a> [vnic\_vlan\_group\_livem](#module\_vnic\_vlan\_group\_livem) | terraform-cisco-modules/imm/intersight//modules/policies_vnic_network_group | n/a |
| <a name="module_vnic_vlan_group_mgmt"></a> [vnic\_vlan\_group\_mgmt](#module\_vnic\_vlan\_group\_mgmt) | terraform-cisco-modules/imm/intersight//modules/policies_vnic_network_group | n/a |
| <a name="module_vnic_vlan_group_stg"></a> [vnic\_vlan\_group\_stg](#module\_vnic\_vlan\_group\_stg) | terraform-cisco-modules/imm/intersight//modules/policies_vnic_network_group | n/a |
| <a name="module_vnic_vlan_group_vms"></a> [vnic\_vlan\_group\_vms](#module\_vnic\_vlan\_group\_vms) | terraform-cisco-modules/imm/intersight//modules/policies_vnic_network_group | n/a |

## Resources

| Name | Type |
|------|------|
| [intersight_organization_organization.org_moid](https://registry.terraform.io/providers/CiscoDevNet/intersight/latest/docs/data-sources/organization_organization) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_Cluster_ID"></a> [Cluster\_ID](#input\_Cluster\_ID) | A single digit Cluster Identifier between 0 and 256 in Hex. (0-9, A, B, C, D, E, F). | `string` | `"0"` | no |
| <a name="input_Organization_ID"></a> [Organization\_ID](#input\_Organization\_ID) | A single digit site identifier between 0 and 15 in Hex. (0-9, A, B, C, D, E, F). | `string` | `"0"` | no |
| <a name="input_Site_ID"></a> [Site\_ID](#input\_Site\_ID) | A single digit site identifier between 0 and 15 in Hex. (0-9, A, B, C, D, E, F). | `string` | `"0"` | no |
| <a name="input_apikey"></a> [apikey](#input\_apikey) | Intersight API Key. | `string` | n/a | yes |
| <a name="input_bios_policy"></a> [bios\_policy](#input\_bios\_policy) | Intersight BIOS Policy Name.  Default name is {organization} | `string` | `""` | no |
| <a name="input_boot_policy"></a> [boot\_policy](#input\_boot\_policy) | Intersight Boot Policy Name.  Default name is {organization} | `string` | `""` | no |
| <a name="input_device_connector_policy"></a> [device\_connector\_policy](#input\_device\_connector\_policy) | Intersight Device Connector Policy Name.  Default name is {organization} | `string` | `""` | no |
| <a name="input_disk_group_policy"></a> [disk\_group\_policy](#input\_disk\_group\_policy) | Intersight Disk Group Policy Name.  Default name is {organization} | `string` | `""` | no |
| <a name="input_dns_policy"></a> [dns\_policy](#input\_dns\_policy) | Intersight Network Connectivity (DNS) Policy Name.  Default name is {organization} | `string` | `""` | no |
| <a name="input_dns_servers_v4"></a> [dns\_servers\_v4](#input\_dns\_servers\_v4) | List of IPv4 DNS Server(s) for Deployment.  Can be one or two servers. | `list(string)` | <pre>[<br>  "208.67.222.222",<br>  "208.67.220.220"<br>]</pre> | no |
| <a name="input_dns_servers_v6"></a> [dns\_servers\_v6](#input\_dns\_servers\_v6) | List of IPv6 DNS Server(s) for Deployment.  Can be one or two servers. | `list(string)` | <pre>[<br>  "empty"<br>]</pre> | no |
| <a name="input_domain_workspace"></a> [domain\_workspace](#input\_domain\_workspace) | Domain Workspace Name. | `string` | n/a | yes |
| <a name="input_dynamic_dns"></a> [dynamic\_dns](#input\_dynamic\_dns) | Flag to Enable or Disable Dynamic DNS on the Policy.  Meaning obtain DNS Servers from DHCP Service. | `bool` | `false` | no |
| <a name="input_endpoint"></a> [endpoint](#input\_endpoint) | Intersight URL. | `string` | `"https://intersight.com"` | no |
| <a name="input_imc_access_policy"></a> [imc\_access\_policy](#input\_imc\_access\_policy) | Intersight IMC Access Policy Name.  Default name is {organization} | `string` | `""` | no |
| <a name="input_ipmi_over_lan_policy"></a> [ipmi\_over\_lan\_policy](#input\_ipmi\_over\_lan\_policy) | Intersight IPMI over LAN Policy Name.  Default name is {organization} | `string` | `""` | no |
| <a name="input_ipv4_enable"></a> [ipv4\_enable](#input\_ipv4\_enable) | Flag to Enable or Disable IPv4 for the deployment. | `bool` | `true` | no |
| <a name="input_ipv6_enable"></a> [ipv6\_enable](#input\_ipv6\_enable) | Flag to Enable or Disable IPv6 for the deployment. | `bool` | `false` | no |
| <a name="input_ldap_policy"></a> [ldap\_policy](#input\_ldap\_policy) | Intersight LDAP Policy Name.  Default name is {organization} | `string` | `""` | no |
| <a name="input_local_user_policy"></a> [local\_user\_policy](#input\_local\_user\_policy) | Intersight Local User Policy Name.  Default name is {organization} | `string` | `""` | no |
| <a name="input_ntp_policy"></a> [ntp\_policy](#input\_ntp\_policy) | Intersight NTP Policy Name.  Default name is {organization} | `string` | `""` | no |
| <a name="input_ntp_servers"></a> [ntp\_servers](#input\_ntp\_servers) | List of NTP Server for Deployment.  If undefined then the dns\_servers will be used. | `list(string)` | <pre>[<br>  "time-a-g.nist.gov",<br>  "time-b-g.nist.gov"<br>]</pre> | no |
| <a name="input_organizations"></a> [organizations](#input\_organizations) | Intersight Organization Names to Apply Policy to.  https://intersight.com/an/settings/organizations/. | `set(string)` | n/a | yes |
| <a name="input_persist_memory_plcy"></a> [persist\_memory\_plcy](#input\_persist\_memory\_plcy) | Intersight Persistent Memory Policy Name.  Default name is {organization} | `string` | `""` | no |
| <a name="input_sd_card_policy"></a> [sd\_card\_policy](#input\_sd\_card\_policy) | Intersight SD Card Policy Name.  Default name is {organization} | `string` | `""` | no |
| <a name="input_secretkey"></a> [secretkey](#input\_secretkey) | Intersight Secret Key. | `string` | n/a | yes |
| <a name="input_serial_over_lan_plcy"></a> [serial\_over\_lan\_plcy](#input\_serial\_over\_lan\_plcy) | Intersight Serial over LAN Policy Name.  Default name is {organization} | `string` | `""` | no |
| <a name="input_smtp_policy"></a> [smtp\_policy](#input\_smtp\_policy) | Intersight SMTP Policy Name.  Default name is {organization} | `string` | `""` | no |
| <a name="input_snmp_auth_password"></a> [snmp\_auth\_password](#input\_snmp\_auth\_password) | SNMP User Authentication Password. | `string` | `""` | no |
| <a name="input_snmp_community"></a> [snmp\_community](#input\_snmp\_community) | The default SNMPv1, SNMPv2c community name or SNMPv3 username to include on any trap messages sent to the SNMP host. The name can be 18 characters long. | `string` | `""` | no |
| <a name="input_snmp_policy"></a> [snmp\_policy](#input\_snmp\_policy) | Intersight SNMP Policy Name.  Default name is {organization} | `string` | `""` | no |
| <a name="input_snmp_trap_destinations"></a> [snmp\_trap\_destinations](#input\_snmp\_trap\_destinations) | SNMP Trap Destinations Settings. | `list(map(string))` | `[]` | no |
| <a name="input_snmp_users"></a> [snmp\_users](#input\_snmp\_users) | List of SNMP User Settings. | `list(map(string))` | `[]` | no |
| <a name="input_ssh_policy"></a> [ssh\_policy](#input\_ssh\_policy) | Intersight SSH Policy Name.  Default name is {organization} | `string` | `""` | no |
| <a name="input_storage_policy"></a> [storage\_policy](#input\_storage\_policy) | Intersight Storage Policy Name.  Default name is {organization} | `string` | `""` | no |
| <a name="input_syslog_destinations"></a> [syslog\_destinations](#input\_syslog\_destinations) | Configure up to 2 remote syslog servers. | `list(map(string))` | `[]` | no |
| <a name="input_syslog_policy"></a> [syslog\_policy](#input\_syslog\_policy) | Intersight Syslog Policy Name.  Default name is {organization} | `string` | `""` | no |
| <a name="input_syslog_severity"></a> [syslog\_severity](#input\_syslog\_severity) | Lowest level of messages to be included in the local log.<br> * warning - Use logging level warning for logs classified as warning.<br> * emergency - Use logging level emergency for logs classified as emergency.<br> * alert - Use logging level alert for logs classified as alert.<br> * critical - Use logging level critical for logs classified as critical.<br> * error - Use logging level error for logs classified as error.<br> * notice - Use logging level notice for logs classified as notice.<br> * informational - Use logging level informational for logs classified as informational.<br> * debug - Use logging level debug for logs classified as debug. | `string` | `"warning"` | no |
| <a name="input_system_contact"></a> [system\_contact](#input\_system\_contact) | SNMP System Contact. | `string` | `""` | no |
| <a name="input_system_location"></a> [system\_location](#input\_system\_location) | SNMP System Location. | `string` | `""` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Tags to be Associated with Objects Created in Intersight. | `list(map(string))` | `[]` | no |
| <a name="input_tfc_organization"></a> [tfc\_organization](#input\_tfc\_organization) | Terraform Cloud Organization. | `string` | n/a | yes |
| <a name="input_timezone"></a> [timezone](#input\_timezone) | Timezone for Deployment.  For a List of supported timezones see the following URL.<br> https://github.com/terraform-cisco-modules/terraform-intersight-imm/blob/master/modules/policies_ntp/README.md. | `string` | `"Etc/GMT"` | no |
| <a name="input_trap_community"></a> [trap\_community](#input\_trap\_community) | The default SNMPv1, SNMPv2c community name or SNMPv3 username to include on any trap messages sent to the SNMP host. The name can be 18 characters long. | `string` | `""` | no |
| <a name="input_update_domain"></a> [update\_domain](#input\_update\_domain) | Name of the Domain to Update when using Dynamic DNS for the Policy. | `string` | `""` | no |
| <a name="input_vhba_adapter_policy"></a> [vhba\_adapter\_policy](#input\_vhba\_adapter\_policy) | Intersight vHBA Adapter Policy Name.  Default name is {organization} | `string` | `""` | no |
| <a name="input_vhba_network_policy"></a> [vhba\_network\_policy](#input\_vhba\_network\_policy) | Intersight vHBA Network Policy Name.  Default name is {organization} | `string` | `""` | no |
| <a name="input_vhba_qos_policy"></a> [vhba\_qos\_policy](#input\_vhba\_qos\_policy) | Intersight vHBA QoS Policy Name.  Default name is {organization} | `string` | `""` | no |
| <a name="input_vhba_san_connectivity"></a> [vhba\_san\_connectivity](#input\_vhba\_san\_connectivity) | Intersight vHBA SAN Connectivity Policy Name.  Default name is {organization} | `string` | `""` | no |
| <a name="input_vic_adapter_policy"></a> [vic\_adapter\_policy](#input\_vic\_adapter\_policy) | Intersight VIC Adapter Policy Name (Standalone).  Default name is {organization} | `string` | `""` | no |
| <a name="input_vic_fec_mode_int0"></a> [vic\_fec\_mode\_int0](#input\_vic\_fec\_mode\_int0) | Interface 0 Forward Error Correction (FEC) mode setting for the DCE interfaces of the adapter. FEC mode setting is supported only for Cisco VIC 14xx adapters. FEC mode 'cl74' is unsupported for Cisco VIC 1495/1497. This setting will be ignored for unsupported adapters and for unavailable DCE interfaces.<br> * cl74 - Use cl74 standard as FEC mode setting. 'Clause 74' aka FC-FEC ('FireCode' FEC) offers simple, low-latency protection against 1 burst/sparse bit error, but it is not good for random errors.<br> * cl91 - Use cl91 standard as FEC mode setting. 'Clause 91' aka RS-FEC ('ReedSolomon' FEC) offers better error protection against bursty and random errors but adds latency.<br> * Off - Disable FEC mode on the DCE Interface. | `string` | `"cl91"` | no |
| <a name="input_vic_fec_mode_int1"></a> [vic\_fec\_mode\_int1](#input\_vic\_fec\_mode\_int1) | Interface 1 Forward Error Correction (FEC) mode setting for the DCE interfaces of the adapter. FEC mode setting is supported only for Cisco VIC 14xx adapters. FEC mode 'cl74' is unsupported for Cisco VIC 1495/1497. This setting will be ignored for unsupported adapters and for unavailable DCE interfaces.<br> * cl74 - Use cl74 standard as FEC mode setting. 'Clause 74' aka FC-FEC ('FireCode' FEC) offers simple, low-latency protection against 1 burst/sparse bit error, but it is not good for random errors.<br> * cl91 - Use cl91 standard as FEC mode setting. 'Clause 91' aka RS-FEC ('ReedSolomon' FEC) offers better error protection against bursty and random errors but adds latency.<br> * Off - Disable FEC mode on the DCE Interface. | `string` | `"cl91"` | no |
| <a name="input_vic_fec_mode_int2"></a> [vic\_fec\_mode\_int2](#input\_vic\_fec\_mode\_int2) | Interface 2 Forward Error Correction (FEC) mode setting for the DCE interfaces of the adapter. FEC mode setting is supported only for Cisco VIC 14xx adapters. FEC mode 'cl74' is unsupported for Cisco VIC 1495/1497. This setting will be ignored for unsupported adapters and for unavailable DCE interfaces.<br> * cl74 - Use cl74 standard as FEC mode setting. 'Clause 74' aka FC-FEC ('FireCode' FEC) offers simple, low-latency protection against 1 burst/sparse bit error, but it is not good for random errors.<br> * cl91 - Use cl91 standard as FEC mode setting. 'Clause 91' aka RS-FEC ('ReedSolomon' FEC) offers better error protection against bursty and random errors but adds latency.<br> * Off - Disable FEC mode on the DCE Interface. | `string` | `"cl91"` | no |
| <a name="input_vic_fec_mode_int3"></a> [vic\_fec\_mode\_int3](#input\_vic\_fec\_mode\_int3) | Interface 3 Forward Error Correction (FEC) mode setting for the DCE interfaces of the adapter. FEC mode setting is supported only for Cisco VIC 14xx adapters. FEC mode 'cl74' is unsupported for Cisco VIC 1495/1497. This setting will be ignored for unsupported adapters and for unavailable DCE interfaces.<br> * cl74 - Use cl74 standard as FEC mode setting. 'Clause 74' aka FC-FEC ('FireCode' FEC) offers simple, low-latency protection against 1 burst/sparse bit error, but it is not good for random errors.<br> * cl91 - Use cl91 standard as FEC mode setting. 'Clause 91' aka RS-FEC ('ReedSolomon' FEC) offers better error protection against bursty and random errors but adds latency.<br> * Off - Disable FEC mode on the DCE Interface. | `string` | `"cl91"` | no |
| <a name="input_vic_fip_enabled"></a> [vic\_fip\_enabled](#input\_vic\_fip\_enabled) | Enables advanced filtering on the interface. | `bool` | `true` | no |
| <a name="input_vic_lldp_enabled"></a> [vic\_lldp\_enabled](#input\_vic\_lldp\_enabled) | Status of Accelerated Receive Flow Steering on the virtual ethernet interface. | `bool` | `true` | no |
| <a name="input_vic_portchannel"></a> [vic\_portchannel](#input\_vic\_portchannel) | When Port Channel is enabled, two vNICs and two vHBAs are available for use on the adapter card. When disabled, four vNICs and four vHBAs are available for use on the adapter card. Disabling port channel reboots the server. Port Channel is supported only for Cisco VIC 1455/1457 adapters. | `bool` | `true` | no |
| <a name="input_virtual_kvm_policy"></a> [virtual\_kvm\_policy](#input\_virtual\_kvm\_policy) | Intersight Virtual KVM Name.  Default name is {organization} | `string` | `""` | no |
| <a name="input_virtual_media_policy"></a> [virtual\_media\_policy](#input\_virtual\_media\_policy) | Intersight Virtual Media Policy Name.  Default name is {organization} | `string` | `""` | no |
| <a name="input_vkvm_enabled"></a> [vkvm\_enabled](#input\_vkvm\_enabled) | Flag to Enable or Disable the Policy. | `bool` | `true` | no |
| <a name="input_vkvm_local_server_video"></a> [vkvm\_local\_server\_video](#input\_vkvm\_local\_server\_video) | If enabled, displays KVM session on any monitor attached to the server. | `bool` | `true` | no |
| <a name="input_vkvm_maximum_sessions"></a> [vkvm\_maximum\_sessions](#input\_vkvm\_maximum\_sessions) | The maximum number of concurrent KVM sessions allowed. Range is 1 to 4. | `number` | `4` | no |
| <a name="input_vkvm_remote_port"></a> [vkvm\_remote\_port](#input\_vkvm\_remote\_port) | The port used for KVM communication. Range is 1 to 65535. | `number` | `2068` | no |
| <a name="input_vkvm_video_encryption"></a> [vkvm\_video\_encryption](#input\_vkvm\_video\_encryption) | If enabled, encrypts all video information sent through KVM. | `bool` | `true` | no |
| <a name="input_vmedia_enabled"></a> [vmedia\_enabled](#input\_vmedia\_enabled) | Flag to Enable or Disable the Policy. | `bool` | `true` | no |
| <a name="input_vmedia_encryption"></a> [vmedia\_encryption](#input\_vmedia\_encryption) | If enabled, allows encryption of all Virtual Media communications. | `bool` | `false` | no |
| <a name="input_vmedia_mappings"></a> [vmedia\_mappings](#input\_vmedia\_mappings) | List of Properties to Assign to the Virtual Media Policy. | `list(map(string))` | `[]` | no |
| <a name="input_vnic_adapter_policy"></a> [vnic\_adapter\_policy](#input\_vnic\_adapter\_policy) | Intersight vNIC Adapter Policy Name.  Default name is {organization} | `string` | `""` | no |
| <a name="input_vnic_lan_connectivity"></a> [vnic\_lan\_connectivity](#input\_vnic\_lan\_connectivity) | Intersight vNIC LAN Connectivity Policy Name.  Default name is {organization} | `string` | `""` | no |
| <a name="input_vnic_netctrl_policy"></a> [vnic\_netctrl\_policy](#input\_vnic\_netctrl\_policy) | Intersight vNIC Network Control Policy Name.  Default name is {organization} | `string` | `""` | no |
| <a name="input_vnic_netgrp_policy"></a> [vnic\_netgrp\_policy](#input\_vnic\_netgrp\_policy) | Intersight vNIC Network Group Policy Name.  Default name is {organization} | `string` | `""` | no |
| <a name="input_vnic_network_policy"></a> [vnic\_network\_policy](#input\_vnic\_network\_policy) | Intersight vNIC Network Policy Name (Standalone).  Default name is {organization} | `string` | `""` | no |
| <a name="input_vnic_qos_policy"></a> [vnic\_qos\_policy](#input\_vnic\_qos\_policy) | Intersight vNIC QoS Policy Name.  Default name is {organization} | `string` | `""` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_Site_ID"></a> [Site\_ID](#output\_Site\_ID) | Site Identifier. |
| <a name="output_endpoint"></a> [endpoint](#output\_endpoint) | Intersight URL. |
| <a name="output_org_moids"></a> [org\_moids](#output\_org\_moids) | n/a |
| <a name="output_tags"></a> [tags](#output\_tags) | Tags to be Associated with Objects Created in Intersight. |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
