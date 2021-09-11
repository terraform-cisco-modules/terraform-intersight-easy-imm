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
  # Tags for Deployment
  tags = var.tags

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
      port_modes                    = v.port_modes != null ? v.port_modes : {}
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
  # Port Policy > Port Channels > Appliance Section - Locals
  #__________________________________________________________

  port_channel_appliances_loop = flatten([
    for key, value in local.port_policies : [
      for k, v in value.port_channel_appliances : {
        admin_speed                     = v.admin_speed != null ? v.admin_speed : "Auto"
        breakout_port_id                = v.breakout_port_id != null ? v.breakout_port_id : 0
        ethernet_network_control_policy = v.ethernet_network_control_policy
        ethernet_network_group_policy   = v.ethernet_network_group_policy
        mode                            = v.mode != null ? v.mode : "trunk"
        pc_id                           = k
        port_list                       = v.port_list
        port_policy                     = key
        priority                        = v.priority != null ? v.priority : "Best Effort"
        slot_id                         = v.slot_id != null ? v.slot_id : 1
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
        breakout_port_id        = v.breakout_port_id != null ? v.breakout_port_id : 0
        flow_control_policy     = v.flow_control_policy != null ? v.flow_control_policy : []
        link_aggregation_policy = v.link_aggregation_policy != null ? v.link_aggregation_policy : []
        link_control_policy     = v.link_control_policy != null ? v.link_control_policy : []
        pc_id                   = k
        port_list               = v.port_list
        port_policy             = key
        slot_id                 = v.slot_id != null ? v.slot_id : 1
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
        pc_id        = k
        port_list    = v.port_list
        port_policy  = key
        slot_id      = v.slot_id != null ? v.slot_id : 1
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
        breakout_port_id        = v.breakout_port_id != null ? v.breakout_port_id : 0
        link_aggregation_policy = v.link_aggregation_policy != null ? v.link_aggregation_policy : []
        link_control_policy     = v.link_control_policy != null ? v.link_control_policy : []
        pc_id                   = k
        port_list               = v.port_list
        port_policy             = key
        slot_id                 = v.slot_id != null ? v.slot_id : 1
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
        flow_control_policy = v.flow_control_policy != null ? v.flow_control_policy : []
        key                 = k
        link_control_policy = v.link_control_policy != null ? v.link_control_policy : []
        port_list           = v.port_list
        port_policy         = key
        slot_id             = v.slot_id != null ? v.slot_id : 1
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
        link_control_policy = v.link_control_policy != null ? v.link_control_policy : []
        port_list           = v.port_list
        port_policy         = key
        slot_id             = v.slot_id != null ? v.slot_id : 1
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
      }
    ]
  ])

  port_role_servers = {
    for k, v in local.port_role_servers_loop : "${v.port_policy}_${v.key}" => v
  }

}
