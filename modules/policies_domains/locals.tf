#__________________________________________________________
#
# Local Variables Section
#__________________________________________________________

#__________________________________________________________
#
# Assign Global Attributes from global_vars Workspace
#__________________________________________________________

locals {
  # Intersight Organization Variables
  org_name = data.terraform_remote_state.global.outputs.organization
  org_moid = data.intersight_organization_organization.org_moid.results.0.moid

  # Intersight Provider Variables
  endpoint = data.terraform_remote_state.global.outputs.endpoint

  # Variables for making unique names/pool/values
  Cluster_ID      = data.terraform_remote_state.global.outputs.Cluster_ID
  Organization_ID = data.terraform_remote_state.global.outputs.Organization_ID
  Site_ID         = data.terraform_remote_state.global.outputs.Site_ID
  cluster_name  = data.terraform_remote_state.global.outputs.cluster_name

  # Intersight UCS Domain Variables
  domain_profile_a = data.terraform_remote_state.domain.outputs.domain_profile_a
  domain_profile_b = data.terraform_remote_state.domain.outputs.domain_profile_b
  server_port_list = data.terraform_remote_state.global.outputs.server_port_list
  lan_port_channel = data.terraform_remote_state.global.outputs.lan_port_channel
  san_port_channel = data.terraform_remote_state.global.outputs.san_port_channel

  # Intersight VLAN Policy Variables
  native_vlan = data.terraform_remote_state.global.outputs.native_vlan
  vlan_list   = data.terraform_remote_state.global.outputs.vlan_list
  vlan_policy = data.terraform_remote_state.global.outputs.vlan_policy

  # Intersight VSAN Policy Varialbes for Each Fabric
  vsan_fabric_a = data.terraform_remote_state.global.outputs.vsan_fabric_a
  vsan_fabric_b = data.terraform_remote_state.global.outputs.vsan_fabric_b
  vsan_policy   = data.terraform_remote_state.global.outputs.vsan_policy

  # Intersight UCS Domain Profile Policy Name Variables
  flow_control_policy   = data.terraform_remote_state.global.outputs.flow_control_policy
  link_aggregation_plcy = data.terraform_remote_state.global.outputs.link_aggregation_plcy
  link_control_policy   = data.terraform_remote_state.global.outputs.link_control_policy
  multicast_policy      = data.terraform_remote_state.global.outputs.multicast_policy
  port_policy           = data.terraform_remote_state.global.outputs.port_policy
  switch_control_policy = data.terraform_remote_state.global.outputs.switch_control_policy
  system_qos_policy     = data.terraform_remote_state.global.outputs.system_qos_policy

  # Network Connectivity Policy (DNS) Variables
  domain_name    = data.terraform_remote_state.global.outputs.domain_name
  dns_servers_v4 = data.terraform_remote_state.global.outputs.dns_servers_v4
  dns_policy     = data.terraform_remote_state.global.outputs.netwrk_connect_policy

  # NTP Policy Variables
  ntp_policy  = data.terraform_remote_state.global.outputs.ntp_policy
  ntp_servers = data.terraform_remote_state.global.outputs.ntp_servers
  timezone    = data.terraform_remote_state.global.outputs.timezone

  # SNMP Policy Variables
  snmp_policy            = data.terraform_remote_state.global.outputs.snmp_policy
  snmp_trap_destinations = data.terraform_remote_state.global.outputs.snmp_trap_destinations
  system_contact         = data.terraform_remote_state.global.outputs.system_contact
  system_location        = data.terraform_remote_state.global.outputs.system_location

  # Syslog Policy Variables
  syslog_destinations = data.terraform_remote_state.global.outputs.syslog_destinations
  syslog_policy       = data.terraform_remote_state.global.outputs.syslog_policy
  syslog_severity     = data.terraform_remote_state.global.outputs.syslog_severity

  # Intersight UCS Server Profile Policy Name Variables
  bios_policy           = data.terraform_remote_state.global.outputs.bios_policy
  boot_policy           = data.terraform_remote_state.global.outputs.boot_policy
  device_connector_plcy = data.terraform_remote_state.global.outputs.device_connector_plcy
  disk_group_policy     = data.terraform_remote_state.global.outputs.disk_group_policy
  imc_access_policy     = data.terraform_remote_state.global.outputs.imc_access_policy
  ipmi_over_lan_policy  = data.terraform_remote_state.global.outputs.ipmi_over_lan_policy
  ldap_policy           = data.terraform_remote_state.global.outputs.ldap_policy
  local_user_policy     = data.terraform_remote_state.global.outputs.local_user_policy
  persist_memory_plcy   = data.terraform_remote_state.global.outputs.persist_memory_plcy
  sd_card_policy        = data.terraform_remote_state.global.outputs.sd_card_policy
  serial_over_lan_plcy  = data.terraform_remote_state.global.outputs.serial_over_lan_plcy
  smtp_policy           = data.terraform_remote_state.global.outputs.smtp_policy
  ssh_policy            = data.terraform_remote_state.global.outputs.ssh_policy
  storage_policy        = data.terraform_remote_state.global.outputs.storage_policy
  virtual_kvm_policy    = data.terraform_remote_state.global.outputs.virtual_kvm_policy
  virtual_media_policy  = data.terraform_remote_state.global.outputs.virtual_media_policy
  vhba_adapter_policy   = data.terraform_remote_state.global.outputs.vhba_adapter_policy
  vhba_network_policy   = data.terraform_remote_state.global.outputs.vhba_network_policy
  vhba_qos_policy       = data.terraform_remote_state.global.outputs.vhba_qos_policy
  vhba_sanconnect_plcy  = data.terraform_remote_state.global.outputs.vhba_sanconnect_plcy
  vic_adapter_policy    = data.terraform_remote_state.global.outputs.vic_adapter_policy
  vnic_adapter_plcy     = data.terraform_remote_state.global.outputs.vnic_adapter_policy
  vnic_iscsiadapt_plcy  = data.terraform_remote_state.global.outputs.vnic_iscsiadapt_plcy
  vnic_iscsiboot_plcy   = data.terraform_remote_state.global.outputs.vnic_iscsiboot_plcy
  vnic_iscsitarget_plcy = data.terraform_remote_state.global.outputs.vnic_iscsitarget_plcy
  vnic_lanconnect_plcy  = data.terraform_remote_state.global.outputs.vnic_lanconnect_plcy
  vnic_netctrl_policy   = data.terraform_remote_state.global.outputs.vnic_netctrl_policy
  vnic_netgrp_policy    = data.terraform_remote_state.global.outputs.vnic_netgrp_policy
  vnic_network_policy   = data.terraform_remote_state.global.outputs.vnic_network_policy
  vnic_qos_policy       = data.terraform_remote_state.global.outputs.vnic_qos_policy

  # Tags for Deployment
  tags = data.terraform_remote_state.global.outputs.tags
}

