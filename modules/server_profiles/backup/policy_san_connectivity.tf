#____________________________________________________________
#
# Fibre Channel (vHBA) Adapter Policy
# GUI Location: Policies > Create Policy
#____________________________________________________________

module "vhba_adapter" {
  depends_on = [
    data.intersight_organization_organization.org_moid
  ]
  source                           = "terraform-cisco-modules/imm/intersight//modules/policies_vhba_adapter"
  description                      = local.vhba_adapter_policy != "" ? "${local.vhba_adapter_policy} vHBA Adapter Policy." : "${local.org_name} vHBA Adapter Policy."
  name                             = local.vhba_adapter_policy != "" ? local.vhba_adapter_policy : local.org_name
  org_moid                         = local.org_moid
  error_detection_timeout          = local.vhba_error_detection_timeout
  error_recovery_enabled           = local.vhba_error_recovery_enabled
  error_recovery_io_retry_count    = local.vhba_error_recovery_io_retry_count
  error_recovery_io_retry_timeout  = local.vhba_error_recovery_io_retry_timeout
  error_recovery_link_down_timeout = local.vhba_error_recovery_link_down_timeout
  error_recovery_port_down_timeout = local.vhba_error_recovery_port_down_timeout
  flogi_retries                    = local.vhba_flogi_retries
  flogi_timeout                    = local.vhba_flogi_timeout
  interrupt_mode                   = local.vhba_interrupt_mode
  io_throttle_count                = local.vhba_io_throttle_count
  lun_count                        = local.vhba_lun_count
  lun_queue_depth                  = local.vhba_lun_queue_depth
  plogi_retries                    = local.vhba_plogi_retries
  plogi_timeout                    = local.vhba_plogi_timeout
  resource_allocation_timeout      = local.vhba_resource_allocation_timeout
  rx_ring_size                     = local.vhba_rx_ring_size
  scsi_io_queues                   = local.vhba_scsi_io_queues
  scsi_io_ring_size                = local.vhba_scsi_io_ring_size
  tags                             = var.tags
  tx_ring_size                     = local.vhba_tx_ring_size
}


#____________________________________________________________
#
# Fibre Channel (vHBA) Network Policies
# GUI Location: Policies > Create Policy
#____________________________________________________________

module "vhba_network_a" {
  depends_on = [
    data.intersight_organization_organization.org_moid
  ]
  source      = "terraform-cisco-modules/imm/intersight//modules/policies_vhba_network"
  description = local.vhba_network_policy != "" ? "${local.vhba_network_policy} vHBA Network Fabric A Policy." : "${local.org_name} vHBA Network Fabric A Policy."
  name        = local.vhba_network_policy != "" ? "${local.vhba_network_policy}_a" : "${local.org_name}_a"
  org_moid    = local.org_moid
  tags        = var.tags
  vsan_id     = local.vhba_vsan_a
}

module "vhba_network_b" {
  depends_on = [
    data.intersight_organization_organization.org_moid
  ]
  source      = "terraform-cisco-modules/imm/intersight//modules/policies_vhba_network"
  description = local.vhba_network_policy != "" ? "${local.vhba_network_policy} vHBA Network Fabric B Policy." : "${local.org_name} vHBA Network Fabric B Policy."
  name        = local.vhba_network_policy != "" ? "${local.vhba_network_policy}_b" : "${local.org_name}_b"
  org_moid    = local.org_moid
  tags        = var.tags
  vsan_id     = local.vhba_vsan_b
}


#____________________________________________________________
#
# Fibre Channel (vHBA) QoS Policy
# GUI Location: Policies > Create Policy
#____________________________________________________________

module "vhba_qos" {
  depends_on = [
    data.intersight_organization_organization.org_moid
  ]
  source              = "terraform-cisco-modules/imm/intersight//modules/policies_vhba_qos"
  burst               = local.vhba_burst
  description         = local.vhba_qos_policy != "" ? "${local.vhba_qos_policy} vHBA QoS Policy." : "${local.org_name} vHBA QoS Policy."
  max_data_field_size = local.vhba_max_data_field_size
  name                = local.vhba_qos_policy != "" ? local.vhba_qos_policy : local.org_name
  org_moid            = local.org_moid
  rate_limit          = local.vhba_rate_limit
  tags                = var.tags
}


