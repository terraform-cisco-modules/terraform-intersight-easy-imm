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
  org_name = yamldecode(data.terraform_remote_state.global.outputs.organization)
  org_moid = data.intersight_organization_organization.org_moid.results.0.moid

  # Intersight Provider Variables
  endpoint = yamldecode(data.terraform_remote_state.global.outputs.endpoint)

  # DNS Variables
  domain_name = yamldecode(data.terraform_remote_state.global.outputs.domain_name)
  dns_servers_v4 = data.terraform_remote_state.global.outputs.dns_servers_v4

  # Time Variables
  ntp_servers = data.terraform_remote_state.global.outputs.ntp_servers
  timezone    = yamldecode(data.terraform_remote_state.global.outputs.timezone)

  # Variables for making unique pool values
  Cluster_ID = yamldecode(data.terraform_remote_state.global.outputs.Cluster_ID)
  Organization_ID = yamldecode(data.terraform_remote_state.global.outputs.Organization_ID)
  Site_ID = yamldecode(data.terraform_remote_state.global.outputs.Site_ID)
  cluster_name = yamldecode(data.terraform_remote_state.global.outputs.cluster_name)

  # IP Pool Variables
  ip_pool_gateway = yamldecode(data.terraform_remote_state.global.outputs.ip_pool_gateway)
  ip_pool_netmask = yamldecode(data.terraform_remote_state.global.outputs.ip_pool_netmask)
  ip_pool_from    = yamldecode(data.terraform_remote_state.global.outputs.ip_pool_from)
  ip_pool_size    = yamldecode(data.terraform_remote_state.global.outputs.ip_pool_size)

  # Intersight Pool Name Variables
  ip_pool     = yamldecode(data.terraform_remote_state.global.outputs.ip_pool)
  iqn_pool_a  = yamldecode(data.terraform_remote_state.global.outputs.iqn_pool_a)
  iqn_pool_b  = yamldecode(data.terraform_remote_state.global.outputs.iqn_pool_b)
  mac_pool_a  = yamldecode(data.terraform_remote_state.global.outputs.mac_pool_a)
  mac_pool_b  = yamldecode(data.terraform_remote_state.global.outputs.mac_pool_b)
  uuid_pool   = yamldecode(data.terraform_remote_state.global.outputs.uuid_pool)
  wwnn_pool   = yamldecode(data.terraform_remote_state.global.outputs.wwnn_pool)
  wwpn_pool_a = yamldecode(data.terraform_remote_state.global.outputs.wwpn_pool_a)
  wwpn_pool_b = yamldecode(data.terraform_remote_state.global.outputs.wwpn_pool_b)

  # Intersight Policy Name Variables
  flowctrl_policy  = yamldecode(data.terraform_remote_state.global.outputs.flowctrl_policy)
  linkagg_policy   = yamldecode(data.terraform_remote_state.global.outputs.linkagg_policy)
  linkctrl_policy  = yamldecode(data.terraform_remote_state.global.outputs.linkctrl_policy)
  multicast_policy = yamldecode(data.terraform_remote_state.global.outputs.multicast_policy)
  netconn_policy   = yamldecode(data.terraform_remote_state.global.outputs.netconn_policy)
  ntp_policy       = yamldecode(data.terraform_remote_state.global.outputs.ntp_policy)
  port_policy      = yamldecode(data.terraform_remote_state.global.outputs.port_policy)
  snmp_policy      = yamldecode(data.terraform_remote_state.global.outputs.snmp_policy)
  swctrl_policy    = yamldecode(data.terraform_remote_state.global.outputs.swctrl_policy)
  syslog_policy    = yamldecode(data.terraform_remote_state.global.outputs.syslog_policy)
  systemqos_policy = yamldecode(data.terraform_remote_state.global.outputs.systemqos_policy)
  vlan_policy      = yamldecode(data.terraform_remote_state.global.outputs.vlan_policy)
  vsan_policy      = yamldecode(data.terraform_remote_state.global.outputs.vsan_policy)

  # UCS Domain Variables
  device_model = yamldecode(data.terraform_remote_state.global.outputs.device_model)
  sp_start     = yamldecode(data.terraform_remote_state.global.outputs.sp_start)
  sp_stop      = yamldecode(data.terraform_remote_state.global.outputs.sp_stop)
  lan_pc_list  = data.terraform_remote_state.global.outputs.lan_pc_list
  lan_pc_id    = yamldecode(data.terraform_remote_state.global.outputs.lan_pc_id)
  san_pc_list  = data.terraform_remote_state.global.outputs.san_pc_list
  san_pc_id    = yamldecode(data.terraform_remote_state.global.outputs.san_pc_id)

  # VLAN Variables
  native_vlan = yamldecode(data.terraform_remote_state.global.outputs.native_vlan)
  vlan_list   = data.terraform_remote_state.global.outputs.vlan_list

  # VSAN ID for Each Fabric
  vsan_fabric_a = yamldecode(data.terraform_remote_state.global.outputs.vsan_fabric_a)
  vsan_fabric_b = yamldecode(data.terraform_remote_state.global.outputs.vsan_fabric_b)

  # Tags for Deployment
  tags = data.terraform_remote_state.global.outputs.tags
}

#____________________________________________________________
#
# Create UCS Domain Switch Cluster
# GUI Location: Profiles > UCS Domain Profile > Create UCS Domain Profile
#____________________________________________________________

module "domain_profile" {
  depends_on = [
    data.intersight_organization_organization.org_moid
  ]
  source      = "terraform-cisco-modules/imm/intersight//modules/domain_profile_cluster"
  description = "${local.cluster_name} UCS Domain."
  name        = local.cluster_name
  org_moid    = local.org_moid
  tags        = local.tags
}

output "domain_profile" {
  description = "moid of the IP Pool"
  value       = module.domain_profile
}

#____________________________________________________________
#
# Create UCS Domain Switch Profiles
# GUI Location: Profiles > UCS Domain Profile > Create UCS Domain Profile
#____________________________________________________________

module "domain_profile_a" {
  depends_on = [
    data.intersight_network_element_summary.fabric_interconnect_a,
    data.intersight_organization_organization.org_moid,
    module.domain_profile
  ]
  source          = "terraform-cisco-modules/imm/intersight//modules/domain_profile_switch"
  description     = "${local.cluster_name} A Switch Profile."
  name            = "${local.cluster_name}_a"
  tags            = local.tags
  assigned_switch = [data.intersight_network_element_summary.fabric_interconnect_a.results.0.moid]
  cluster_moid    = [module.domain_profile.moid]
}

module "domain_profile_b" {
  depends_on = [
    data.intersight_network_element_summary.fabric_interconnect_b,
    data.intersight_organization_organization.org_moid,
    module.domain_profile,
    module.domain_profile_a
  ]
  source          = "terraform-cisco-modules/imm/intersight//modules/domain_profile_switch"
  description     = "${local.cluster_name} B Switch Profile."
  name            = "${local.cluster_name}_b"
  tags            = local.tags
  assigned_switch = [data.intersight_network_element_summary.fabric_interconnect_b.results.0.moid]
  cluster_moid    = [module.domain_profile.moid]
}

#____________________________________________________________
#
# Create Intersight Multicast Policy
# GUI Location: Policies > Create Policy
#____________________________________________________________

module "multicast" {
  depends_on = [
    data.intersight_organization_organization.org_moid
  ]
  source      = "terraform-cisco-modules/imm/intersight//modules/domain_multicast"
  description = "${local.cluster_name} Multicast Policy."
  name        = local.multicast_policy
  org_moid    = local.org_moid
  tags        = local.tags
}

#____________________________________________________________
#
# Create Intersight VLAN Policy and Assign to Cluster
# GUI Location: Policies > Create Policy
#____________________________________________________________

module "vlan_policy" {
  depends_on = [
    data.intersight_organization_organization.org_moid,
    module.domain_profile_a,
    module.domain_profile_b
  ]
  source      = "terraform-cisco-modules/imm/intersight//modules/domain_vlan_policy"
  description = "${local.cluster_name} VLAN Policy."
  name        = local.vlan_policy
  org_moid    = local.org_moid
  profiles = [
    module.domain_profile_a.moid,
    module.domain_profile_b.moid
  ]
  tags = local.tags
}

#______________________________________________
#
# Assign Native VLAN to VLAN Policy
#______________________________________________

module "native_vlan" {
  depends_on = [
    data.intersight_organization_organization.org_moid,
    module.multicast,
    module.vlan_policy
  ]
  source           = "../../../terraform-intersight-imm/modules/domain_vlan"
  is_native        = true
  multicast_moid   = module.multicast.moid
  vlan             = local.native_vlan
  vlan_policy_moid = module.vlan_policy.moid
  vlan_prefix      = local.cluster_name
}

#______________________________________________
#
# Assign VLAN List to VLAN Policy
#______________________________________________

module "vlan_list" {
  depends_on = [
    data.intersight_organization_organization.org_moid,
    module.multicast,
    module.vlan_policy
  ]
  source           = "../../../terraform-intersight-imm/modules/domain_vlan_list"
  is_native        = false
  multicast_moid   = module.multicast.moid
  vlan_list        = local.vlan_list
  vlan_policy_moid = module.vlan_policy.moid
  vlan_prefix      = local.cluster_name
}


#____________________________________________________________
#
# Create Intersight VSAN Policies and Assign to Cluster
# GUI Location: Policies > Create Policy
#____________________________________________________________

module "vsan_policy_a" {
  depends_on = [
    data.intersight_organization_organization.org_moid,
    module.domain_profile_a,
  ]
  source      = "terraform-cisco-modules/imm/intersight//modules/domain_vsan_policy"
  description = "${local.cluster_name} Fabric A VSAN Policy."
  name        = "${local.vsan_policy}_a"
  org_moid    = local.org_moid
  profiles    = [module.domain_profile_a.moid]
  tags        = local.tags
}

module "vsan_policy_b" {
  depends_on = [
    data.intersight_organization_organization.org_moid,
    module.domain_profile_b
  ]
  source      = "terraform-cisco-modules/imm/intersight//modules/domain_vsan_policy"
  description = "${local.cluster_name} Fabric B VSAN Policy."
  name        = "${local.vsan_policy}_b"
  org_moid    = local.org_moid
  profiles    = [module.domain_profile_b.moid]
  tags        = local.tags
}

#______________________________________________
#
# Assign VSAN to VSAN Fabric A Policy
#______________________________________________

module "vsan_a" {
  depends_on = [
    data.intersight_organization_organization.org_moid,
    module.vsan_policy_a
  ]
  source           = "terraform-cisco-modules/imm/intersight//modules/domain_vsan"
  vsan_policy_moid = module.vsan_policy_a.moid
  vsan_prefix      = local.cluster_name
  vsan_list = {
    vsan_a = {
      fcoe_vlan = local.vsan_fabric_a,
      vsan_id   = local.vsan_fabric_a
    }
  }
}

#______________________________________________
#
# Assign VSAN to VSAN Fabric B Policy
#______________________________________________

module "vsan_b" {
  depends_on = [
    data.intersight_organization_organization.org_moid,
    module.vsan_policy_b
  ]
  source           = "terraform-cisco-modules/imm/intersight//modules/domain_vsan"
  vsan_policy_moid = module.vsan_policy_b.moid
  vsan_prefix      = local.cluster_name
  vsan_list = {
    vsan_a = {
      fcoe_vlan = local.vsan_fabric_b,
      vsan_id   = local.vsan_fabric_b
    }
  }
}


#____________________________________________________________
#
# Create Intersight Port Policies
# GUI Location: Policies > Create Policy
#____________________________________________________________

module "port_policy_a" {
  depends_on = [
    data.intersight_network_element_summary.fabric_interconnect_a,
    data.intersight_organization_organization.org_moid,
    module.domain_profile_a
  ]
  source       = "terraform-cisco-modules/imm/intersight//modules/domain_port_policy"
  description  = "${local.cluster_name} Port Policy A."
  device_model = data.intersight_network_element_summary.fabric_interconnect_a.results.0.model
  name         = "${local.port_policy}_a"
  org_moid     = local.org_moid
  profiles     = [module.domain_profile_a.moid]
  tags = local.tags
}

module "port_policy_b" {
  depends_on = [
    data.intersight_network_element_summary.fabric_interconnect_b,
    data.intersight_organization_organization.org_moid,
    module.domain_profile_b
  ]
  source       = "terraform-cisco-modules/imm/intersight//modules/domain_port_policy"
  description  = "${local.cluster_name} Port Policy B."
  device_model = data.intersight_network_element_summary.fabric_interconnect_b.results.0.model
  name         = "${local.port_policy}_b"
  org_moid     = local.org_moid
  profiles     = [module.domain_profile_b.moid]
  tags = local.tags
}


#____________________________________________________________
#
# Create Intersight Port Mode Policies
# GUI Location: Policies > Create Policy
#____________________________________________________________

module "port_mode_a" {
  depends_on = [
    data.intersight_organization_organization.org_moid,
    module.port_policy_a
  ]
  source           = "terraform-cisco-modules/imm/intersight//modules/domain_port_mode"
  custom_mode      = "FibreChannel"
  port_policy_moid = module.port_policy_a.moid
  tags             = local.tags
}

module "port_mode_b" {
  depends_on = [
    data.intersight_organization_organization.org_moid,
    module.port_policy_b
  ]
  source           = "terraform-cisco-modules/imm/intersight//modules/domain_port_mode"
  custom_mode      = "FibreChannel"
  port_policy_moid = module.port_policy_b.moid
  tags             = local.tags
}


#____________________________________________________________
#
# Create Intersight Server Port Policies
# GUI Location: Policies > Create Policy
#____________________________________________________________

module "server_ports_a" {
  depends_on = [
    data.intersight_organization_organization.org_moid,
    module.port_policy_a
  ]
  source           = "terraform-cisco-modules/imm/intersight//modules/domain_port_server"
  port_list        = "5-12"
  port_policy_moid = module.port_policy_a.moid
  tags             = local.tags
}

module "server_ports_b" {
  depends_on = [
    data.intersight_organization_organization.org_moid,
    module.port_policy_b
  ]
  source           = "terraform-cisco-modules/imm/intersight//modules/domain_port_server"
  port_list        = "5-12"
  port_policy_moid = module.port_policy_b.moid
  tags             = local.tags
}


#____________________________________________________________
#
# Create Intersight LAN Port-Channel Policies
# GUI Location: Policies > Create Policy
#____________________________________________________________


#______________________________________________
#
# Create Flow Control Policy
#______________________________________________

module "flow_control" {
  depends_on = [
    data.intersight_organization_organization.org_moid
  ]
  source      = "terraform-cisco-modules/imm/intersight//modules/domain_flow_control"
  description = "${local.cluster_name} Flow Control Policy."
  name        = local.flowctrl_policy
  org_moid    = local.org_moid
  tags        = local.tags
}

#______________________________________________
#
# Create Link Aggregation Policy
#______________________________________________

module "link_aggregation" {
  depends_on = [
    data.intersight_organization_organization.org_moid
  ]
  source      = "terraform-cisco-modules/imm/intersight//modules/domain_link_aggregation"
  description = "${local.cluster_name} Link Aggregation Policy."
  lacp_rate   = "normal"
  name        = local.linkagg_policy
  org_moid    = local.org_moid
  tags        = local.tags
}

#______________________________________________
#
# Create Link Control Policy
#______________________________________________

module "link_control" {
  depends_on = [
    data.intersight_organization_organization.org_moid
  ]
  source      = "terraform-cisco-modules/imm/intersight//modules/domain_link_control"
  description = "${local.cluster_name} Link Control Policy."
  name        = local.linkctrl_policy
  org_moid    = local.org_moid
  tags        = local.tags
}

#______________________________________________
#
# Create Fabric A LAN Port Channel
#______________________________________________

module "lan_uplink_port_channel_a" {
  depends_on = [
    data.intersight_organization_organization.org_moid,
    module.flow_control,
    module.link_aggregation,
    module.link_control,
    module.port_policy_a
  ]
  source                = "terraform-cisco-modules/imm/intersight//modules/domain_uplink_lan_port_channel"
  flow_control_moid     = [module.flow_control.moid]
  lan_uplink_pc_id      = local.lan_pc_id
  lan_uplink_pc_ports   = local.lan_pc_list
  link_aggregation_moid = [module.link_aggregation.moid]
  link_control_moid     = [module.link_control.moid]
  port_policy_moid      = module.port_policy_a.moid
  tags                  = local.tags
}

#______________________________________________
#
# Create Fabric B LAN Port Channel
#______________________________________________

module "lan_uplink_port_channel_b" {
  depends_on = [
    data.intersight_organization_organization.org_moid,
    module.flow_control,
    module.link_aggregation,
    module.link_control,
    module.port_policy_b
  ]
  source                = "terraform-cisco-modules/imm/intersight//modules/domain_uplink_lan_port_channel"
  flow_control_moid     = [module.flow_control.moid]
  lan_uplink_pc_id      = local.lan_pc_id
  lan_uplink_pc_ports   = local.lan_pc_list
  link_aggregation_moid = [module.link_aggregation.moid]
  link_control_moid     = [module.link_control.moid]
  port_policy_moid      = module.port_policy_b.moid
  tags                  = local.tags
}


#____________________________________________________________
#
# Create Intersight SAN Port-Channel Policies
# GUI Location: Policies > Create Policy
#____________________________________________________________

#______________________________________________
#
# Create Fabric A SAN Port Channel
#______________________________________________

module "san_uplink_port_channel_a" {
  depends_on = [
    data.intersight_organization_organization.org_moid,
    module.port_mode_a,
    module.port_policy_a
  ]
  source              = "terraform-cisco-modules/imm/intersight//modules/domain_uplink_san_port_channel"
  san_uplink_pc_id    = local.san_pc_id
  san_uplink_pc_ports = local.san_pc_list
  san_uplink_speed    = "32Gbps"
  port_policy_moid    = module.port_policy_a.moid
  vsan_id             = local.vsan_fabric_a
  tags                = local.tags
}

#______________________________________________
#
# Create Fabric B SAN Port Channel
#______________________________________________

module "san_uplink_port_channel_b" {
  depends_on = [
    data.intersight_organization_organization.org_moid,
    module.port_mode_b,
    module.port_policy_b
  ]
  source              = "terraform-cisco-modules/imm/intersight//modules/domain_uplink_san_port_channel"
  san_uplink_pc_id    = local.san_pc_id
  san_uplink_pc_ports = local.san_pc_list
  san_uplink_speed    = "32Gbps"
  port_policy_moid    = module.port_policy_b.moid
  vsan_id             = local.vsan_fabric_b
  tags                = local.tags
}

#_______________________________________________________________
#
# Create Intersight Network Connectivity (DNS) Policy
# GUI Location: Policies > Create Policy
#_______________________________________________________________

module "dns" {
  depends_on = [
    data.intersight_organization_organization.org_moid,
    module.domain_profile_a,
    module.domain_profile_b
  ]
  source         = "terraform-cisco-modules/imm/intersight//modules/policies_network_connectivity"
  description    = "${local.cluster_name} DNS Policy."
  dns_servers_v4 = local.dns_servers_v4
  name           = local.netconn_policy
  org_moid       = local.org_moid
  tags           = local.tags
  profile_type   = "domain"
  profiles = [
    module.domain_profile_a.moid,
    module.domain_profile_b.moid
  ]
}


#____________________________________________________________
#
# Create Intersight NTP Policy
# GUI Location: Policies > Create Policy
#____________________________________________________________

module "ntp" {
  depends_on = [
    data.intersight_organization_organization.org_moid,
    module.domain_profile_a,
    module.domain_profile_b
  ]
  source       = "terraform-cisco-modules/imm/intersight//modules/policies_ntp"
  description  = "${local.cluster_name} NTP Policy."
  name         = local.ntp_policy
  ntp_servers  = local.ntp_servers
  org_moid     = local.org_moid
  profile_type = "domain"
  tags         = local.tags
  timezone     = local.timezone
  profiles = [
    module.domain_profile_a.moid,
    module.domain_profile_b.moid
  ]
}


#____________________________________________________________
#
# Create Intersight System QoS Policies Module
# GUI Location: Policies > Create Policy
#____________________________________________________________

module "system_qos_example" {
  depends_on = [
    data.intersight_organization_organization.org_moid,
    module.domain_profile_a,
    module.domain_profile_b
  ]
  source      = "../../../terraform-intersight-imm/modules/domain_system_qos"
  description = "${local.cluster_name} System QoS Policy."
  name        = local.systemqos_policy
  org_moid    = local.org_moid
  tags        = local.tags
  profiles = [
    module.domain_profile_a.moid,
    module.domain_profile_b.moid
  ]
  classes = [
    {
      admin_state         = "Disabled"
      bandwidth_percent   = 0
      cos                 = 5
      mtu                 = 1500
      multicast_optimize  = false
      name                = "Platinum"
      packet_drop         = true
      weight              = 10
    },
    {
      admin_state         = "Disabled"
      bandwidth_percent   = 0
      cos                 = 4
      mtu                 = 1500
      multicast_optimize  = false
      name                = "Gold"
      packet_drop         = true
      weight              = 9
    },
    {
      admin_state         = "Disabled"
      bandwidth_percent   = 0
      cos                 = 2
      mtu                 = 1500
      multicast_optimize  = false
      name                = "Silver"
      packet_drop         = true
      weight              = 8
    },
    {
      admin_state         = "Disabled"
      bandwidth_percent   = 0
      cos                 = 1
      mtu                 = 1500
      multicast_optimize  = false
      name                = "Bronze"
      packet_drop         = true
      weight              = 7
    },
    {
      admin_state         = "Enabled"
      bandwidth_percent   = 50
      cos                 = 255
      mtu                 = 9216
      multicast_optimize  = false
      name                = "Best Effort"
      packet_drop         = null
      weight              = 5
    },
    {
      admin_state         = "Enabled"
      bandwidth_percent   = 50
      cos                 = 3
      mtu                 = 2240
      multicast_optimize  = null
      name                = "FC"
      packet_drop         = false
      weight              = 5
    },
  ]
}


#____________________________________________________________
#
# Create Intersight Switch Control Policy
# GUI Location: Policies > Create Policy
#____________________________________________________________

module "switch_control" {
  depends_on = [
    data.intersight_organization_organization.org_moid,
    module.domain_profile_a,
    module.domain_profile_b
  ]
  source                = "terraform-cisco-modules/imm/intersight//modules/domain_switch_control"
  description           = "${local.cluster_name} Switch Control Policy."
  name                  = local.swctrl_policy
  mac_aging_option      = "Custom"
  mac_aging_time        = 1200
  udld_message_interval = 15
  udld_recovery_action  = "reset"
  vlan_optimization     = true
  org_moid              = local.org_moid
  tags                  = local.tags
  profiles = [
    module.domain_profile_a.moid,
    module.domain_profile_b.moid
  ]
}
