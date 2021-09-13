#__________________________________________________________
#
# Local Variables Section
#__________________________________________________________

locals {
  # Intersight Organization Variables
  organizations = var.organizations
  org_moids = {
    for v in sort(keys(data.intersight_organization_organization.org_moid)) : v => {
      moid = data.intersight_organization_organization.org_moid[v].results[0].moid
    }
  }
  # Intersight Provider Variables
  endpoint = var.endpoint

  # Tags for Deployment
  tags = var.tags

  # UCS Domain Outputs
  merge_all_moids = data.terraform_remote_state.domain.outputs.merge_all_moids

  #__________________________________________________________
  #
  # Flow Control Policy Section - Locals
  #__________________________________________________________

  flow_control_policies = {
    for k, v in var.flow_control_policies : k => {
      description  = v.description != null ? v.description : ""
      priority     = v.priority != null ? v.priority : "auto"
      organization = v.organization != null ? v.organization : "default"
      receive      = v.receive != null ? v.receive : "Disabled"
      send         = v.send != null ? v.send : "Disabled"
      tags         = v.tags != null ? v.tags : []
    }
  }


  #__________________________________________________________
  #
  # Link Aggregation Policy Section - Locals
  #__________________________________________________________

  link_aggregation_policies = {
    for k, v in var.link_aggregation_policies : k => {
      description        = v.description != null ? v.description : ""
      lacp_rate          = v.lacp_rate != null ? v.lacp_rate : "normal"
      organization       = v.organization != null ? v.organization : "default"
      suspend_individual = v.suspend_individual != null ? v.suspend_individual : false
      tags               = v.tags != null ? v.tags : []
    }
  }


  #__________________________________________________________
  #
  # Link Control Policy Section - Locals
  #__________________________________________________________

  link_control_policies = {
    for k, v in var.link_control_policies : k => {
      admin_state  = v.admin_state != null ? v.admin_state : "Enabled"
      description  = v.description != null ? v.description : ""
      mode         = v.mode != null ? v.mode : "normal"
      organization = v.organization != null ? v.organization : "default"
      tags         = v.tags != null ? v.tags : []
    }
  }


  #______________________________________________
  #
  # Multicast Variables Locals
  #______________________________________________
  multicast_policies = {
    for k, v in var.multicast_policies : k => {
      description             = v.description != null ? v.description : ""
      organization            = v.organization != null ? v.organization : "default"
      querier_ip_address      = v.querier_ip_address != null ? v.querier_ip_address : ""
      querier_ip_address_peer = v.querier_ip_address_peer != null ? v.querier_ip_address_peer : ""
      querier_state           = v.querier_state != null ? v.querier_state : "Disabled"
      snooping_state          = v.snooping_state != null ? v.snooping_state : "Enabled"
      tags                    = v.tags != null ? v.tags : []
    }
  }

  #__________________________________________________________
  #
  # Port Policy Section - Locals
  #__________________________________________________________

  port_policies = {
    for k, v in var.port_policies : k => {
      description                   = v.description != null ? v.description : ""
      device_model                  = v.device_model != null ? v.device_model : "UCS-FI-6454"
      organization                  = v.organization != null ? v.organization : "default"
      port_channel_appliances       = v.port_channel_appliances != null ? v.port_channel_appliances : {}
      port_channel_ethernet_uplinks = v.port_channel_ethernet_uplinks != null ? v.port_channel_ethernet_uplinks : {}
      port_channel_fc_uplinks       = v.port_channel_fc_uplinks != null ? v.port_channel_fc_uplinks : {}
      port_channel_fcoe_uplinks     = v.port_channel_fcoe_uplinks != null ? v.port_channel_fcoe_uplinks : {}
      port_modes                    = v.port_modes != null ? v.port_modes : []
      port_role_appliances          = v.port_role_appliances != null ? v.port_role_appliances : {}
      port_role_ethernet_uplinks    = v.port_role_ethernet_uplinks != null ? v.port_role_ethernet_uplinks : {}
      port_role_fc_uplinks          = v.port_role_fc_uplinks != null ? v.port_role_fc_uplinks : {}
      port_role_fcoe_uplinks        = v.port_role_fcoe_uplinks != null ? v.port_role_fcoe_uplinks : {}
      port_role_servers             = v.port_role_servers != null ? v.port_role_servers : {}
      tags                          = v.tags != null ? v.tags : []
    }
  }

  #__________________________________________________________
  #
  # Port Policy > Port Modes - Section - Locals
  #__________________________________________________________

  port_modes_loop = flatten([
    for key, value in local.port_policies : [
      for k, v in value.port_modes : {
        custom_mode  = v.custom_mode != null ? v.custom_mode : "FibreChannel"
        organization = value.organization != null ? value.organization : "default"
        port_list    = v.port_list != null ? v.port_list : [1, 4]
        port_policy  = key
        slot_id      = v.slot_id != null ? v.slot_id : null
        tags         = value.tags != null ? value.tags : []
      }
    ]
  ])

  port_modes = {
    for k, v in local.port_modes_loop : k => v
  }

  #__________________________________________________________
  #
  # Port Policy > Port Channels > Appliance Section - Locals
  #__________________________________________________________

  port_channel_appliances_loop = flatten([
    for key, value in local.port_policies : [
      for k, v in value.port_channel_appliances : {
        admin_speed                     = v.admin_speed != null ? v.admin_speed : "Auto"
        ethernet_network_control_policy = v.ethernet_network_control_policy
        ethernet_network_group_policy   = v.ethernet_network_group_policy
        interfaces                      = v.interfaces != null ? v.interfaces : []
        mode                            = v.mode != null ? v.mode : "trunk"
        pc_id                           = k
        port_policy                     = key
        priority                        = v.priority != null ? v.priority : "Best Effort"
        tags                            = value.tags != null ? value.tags : []
      }
    ]
  ])

  port_channel_appliances = {
    for k, v in local.port_channel_appliances_loop : "${v.port_policy}_${v.pc_id}" => v
  }


  #_________________________________________________________________
  #
  # Port Policy > Port Channels > Ethernet Uplinks Section - Locals
  #_________________________________________________________________

  port_channel_ethernet_uplinks_loop = flatten([
    for key, value in local.port_policies : [
      for k, v in value.port_channel_ethernet_uplinks : {
        admin_speed             = v.admin_speed != null ? v.admin_speed : "Auto"
        flow_control_policy     = v.flow_control_policy != null ? v.flow_control_policy : ""
        interfaces              = v.interfaces != null ? v.interfaces : []
        link_aggregation_policy = v.link_aggregation_policy != null ? v.link_aggregation_policy : ""
        link_control_policy     = v.link_control_policy != null ? v.link_control_policy : ""
        pc_id                   = k
        port_policy             = key
        tags                    = value.tags != null ? value.tags : []
      }
    ]
  ])

  port_channel_ethernet_uplinks = {
    for k, v in local.port_channel_ethernet_uplinks_loop : "${v.port_policy}_${v.pc_id}" => v
  }


  #______________________________________________________________________
  #
  # Port Policy > Port Channels > Fibre-Channel Uplinks Section - Locals
  #______________________________________________________________________

  port_channel_fc_uplinks_loop = flatten([
    for key, value in local.port_policies : [
      for k, v in value.port_channel_fc_uplinks : {
        admin_speed  = v.admin_speed != null ? v.admin_speed : "16Gbps"
        fill_pattern = v.fill_pattern != null ? v.fill_pattern : "Arbff"
        interfaces   = v.interfaces != null ? v.interfaces : []
        pc_id        = k
        port_policy  = key
        tags         = value.tags != null ? value.tags : []
        vsan_id      = v.vsan_id
      }
    ]
  ])

  port_channel_fc_uplinks = {
    for k, v in local.port_channel_fc_uplinks_loop : "${v.port_policy}_${v.pc_id}" => v
  }


  #_________________________________________________________________
  #
  # Port Policy > Port Channels > FCoE Uplinks Section - Locals
  #_________________________________________________________________

  port_channel_fcoe_uplinks_loop = flatten([
    for key, value in local.port_policies : [
      for k, v in value.port_channel_fcoe_uplinks : {
        admin_speed             = v.admin_speed != null ? v.admin_speed : "Auto"
        interfaces              = v.interfaces != null ? v.interfaces : []
        link_aggregation_policy = v.link_aggregation_policy != null ? v.link_aggregation_policy : ""
        link_control_policy     = v.link_control_policy != null ? v.link_control_policy : ""
        pc_id                   = k
        port_policy             = key
        tags                    = value.tags != null ? value.tags : []
      }
    ]
  ])

  port_channel_fcoe_uplinks = {
    for k, v in local.port_channel_fcoe_uplinks_loop : "${v.port_policy}_${v.pc_id}" => v
  }


  #__________________________________________________________
  #
  # Port Policy > Port Roles > Appliance Section - Locals
  #__________________________________________________________

  port_role_appliances_loop = flatten([
    for key, value in local.port_policies : [
      for k, v in value.port_role_appliances : {
        admin_speed                     = v.admin_speed != null ? v.admin_speed : "Auto"
        breakout_port_id                = v.breakout_port_id != null ? v.breakout_port_id : 0
        ethernet_network_control_policy = v.ethernet_network_control_policy
        ethernet_network_group_policy   = v.ethernet_network_group_policy
        fec                             = v.fec != null ? v.fec : "Auto"
        key                             = k
        mode                            = v.mode != null ? v.mode : "trunk"
        port_list                       = v.port_list
        port_policy                     = key
        priority                        = v.priority != null ? v.priority : "Best Effort"
        slot_id                         = v.slot_id != null ? v.slot_id : 1
        tags                            = value.tags != null ? value.tags : []
      }
    ]
  ])

  port_role_appliances = {
    for k, v in local.port_role_appliances_loop : "${v.port_policy}_${v.key}" => v
  }


  #_________________________________________________________________
  #
  # Port Policy > Port Roles > Ethernet Uplinks Section - Locals
  #_________________________________________________________________

  port_role_ethernet_uplinks_loop = flatten([
    for key, value in local.port_policies : [
      for k, v in value.port_role_ethernet_uplinks : {
        admin_speed         = v.admin_speed != null ? v.admin_speed : "Auto"
        breakout_port_id    = v.breakout_port_id != null ? v.breakout_port_id : 0
        fec                 = v.fec != null ? v.fec : "Auto"
        flow_control_policy = v.flow_control_policy != null ? v.flow_control_policy : ""
        key                 = k
        link_control_policy = v.link_control_policy != null ? v.link_control_policy : ""
        port_list           = v.port_list
        port_policy         = key
        slot_id             = v.slot_id != null ? v.slot_id : 1
        tags                = value.tags != null ? value.tags : []
      }
    ]
  ])

  port_role_ethernet_uplinks = {
    for k, v in local.port_role_ethernet_uplinks_loop : "${v.port_policy}_${v.key}" => v
  }


  #______________________________________________________________________
  #
  # Port Policy > Port Roles > Fibre-Channel Uplinks Section - Locals
  #______________________________________________________________________

  port_role_fc_uplinks_loop = flatten([
    for key, value in local.port_policies : [
      for k, v in value.port_role_fc_uplinks : {
        admin_speed      = v.admin_speed != null ? v.admin_speed : "16Gbps"
        breakout_port_id = v.breakout_port_id != null ? v.breakout_port_id : 0
        fill_pattern     = v.fill_pattern != null ? v.fill_pattern : "Arbff"
        key              = k
        port_list        = v.port_list
        port_policy      = key
        slot_id          = v.slot_id != null ? v.slot_id : 1
        tags             = value.tags != null ? value.tags : []
        vsan_id          = v.vsan_id
      }
    ]
  ])

  port_role_fc_uplinks = {
    for k, v in local.port_role_fc_uplinks_loop : "${v.port_policy}_${v.key}" => v
  }


  #_________________________________________________________________
  #
  # Port Policy > Port Roles > FCoE Uplinks Section - Locals
  #_________________________________________________________________

  port_role_fcoe_uplinks_loop = flatten([
    for key, value in local.port_policies : [
      for k, v in value.port_role_fcoe_uplinks : {
        admin_speed         = v.admin_speed != null ? v.admin_speed : "Auto"
        breakout_port_id    = v.breakout_port_id != null ? v.breakout_port_id : 0
        fec                 = v.fec != null ? v.fec : "Auto"
        key                 = k
        link_control_policy = v.link_control_policy != null ? v.link_control_policy : ""
        port_list           = v.port_list
        port_policy         = key
        slot_id             = v.slot_id != null ? v.slot_id : 1
        tags                = value.tags != null ? value.tags : []
      }
    ]
  ])

  port_role_fcoe_uplinks = {
    for k, v in local.port_role_fcoe_uplinks_loop : "${v.port_policy}_${v.key}" => v
  }


  #_________________________________________________________________
  #
  # Port Policy > Port Roles > FCoE Uplinks Section - Locals
  #_________________________________________________________________

  port_role_servers_loop = flatten([
    for key, value in local.port_policies : [
      for k, v in value.port_role_servers : {
        breakout_port_id = v.breakout_port_id != null ? v.breakout_port_id : 0
        key              = k
        port_list        = v.port_list
        port_policy      = key
        slot_id          = v.slot_id != null ? v.slot_id : 1
        tags             = value.tags != null ? value.tags : []
      }
    ]
  ])

  port_role_servers = {
    for k, v in local.port_role_servers_loop : "${v.port_policy}_${v.key}" => v
  }


  #__________________________________________________________
  #
  # Switch Control Policy Section - Locals
  #__________________________________________________________

  switch_control_policies = {
    for k, v in var.switch_control_policies : k => {
      description                  = v.description != null ? v.description : ""
      mac_address_table_aging      = v.mac_address_table_aging != null ? v.mac_address_table_aging : "Default"
      mac_aging_time               = v.mac_aging_time != null ? v.mac_aging_time : 14500
      organization                 = v.organization != null ? v.organization : "default"
      tags                         = v.tags != null ? v.tags : []
      udld_message_interval        = v.udld_message_interval != null ? v.udld_message_interval : 15
      udld_recovery_action         = v.udld_recovery_action != null ? v.udld_recovery_action : "none"
      vlan_port_count_optimization = v.vlan_port_count_optimization != null ? v.vlan_port_count_optimization : false
    }
  }


  #__________________________________________________________
  #
  # VLAN Policy Section Locals
  #__________________________________________________________

  vlan_policies = {
    for k, v in var.vlan_policies : k => {
      description  = v.description != null ? v.description : ""
      organization = v.organization != null ? v.organization : "default"
      tags         = v.tags != null ? v.tags : []
      vlans        = v.vlans != null ? v.vlans : {}
    }
  }

  vlans_loop = flatten([
    for key, value in var.vlan_policies : [
      for v in value.vlans : {
        auto_allow_on_uplinks = v.auto_allow_on_uplinks != null ? v.auto_allow_on_uplinks : true
        multicast_policy      = v.multicast_policy != null ? v.multicast_policy : ""
        name                  = v.name != null ? v.name : ""
        native_vlan           = v.native_vlan != null ? v.native_vlan : false
        vlan_list             = v.vlan_list != null ? v.vlan_list : ""
        vlan_policy           = key
      }
    ]
  ])

  vlans = {
    for k, v in local.vlans_loop : k => v
  }


  #__________________________________________________________
  #
  # VSAN Policy Section Locals
  #__________________________________________________________

  vsan_policies = {
    for k, v in var.vsan_policies : k => {
      description     = v.description != null ? v.description : ""
      organization    = v.organization != null ? v.organization : "default"
      tags            = v.tags != null ? v.tags : []
      uplink_trunking = v.uplink_trunking != null ? v.uplink_trunking : false
      vsans           = v.vsans != null ? v.vsans : {}
    }
  }

  vsans_loop = flatten([
    for key, value in var.vsan_policies : [
      for v in value.vsans : {
        default_zoning = v.default_zoning != null ? v.default_zoning : "Disabled"
        fcoe_vlan_id   = v.fcoe_vlan_id != null ? v.fcoe_vlan_id : 4
        name           = v.name != null ? v.name : "vsan-${v.vsan_id}"
        vsan_id        = v.vsan_id != null ? v.vsan_id : 4
        vsan_policy    = key
      }
    ]
  ])

  vsans = {
    for k, v in local.vsans_loop : k => v
  }
}
