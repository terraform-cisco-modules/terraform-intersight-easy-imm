#_________________________________________________________________________
#
# Fibre Channel Adapter Polies
# GUI Location: Configure > Policies > Create Policy > Fibre Channel Adapter
#_________________________________________________________________________

variable "fibre_channel_adapter_policies" {
  default {
    default = {
      description                       = ""
      error_detection_timeout           = 2000
      enable_fcp_error_recovery         = false
      error_recovery_io_retry_timeout   = 5
      error_recovery_link_down_timeout  = 30000
      error_recovery_port_down_io_retry = 30
      error_recovery_port_down_timeout  = 30000
      flogi_retries                     = 8
      flogi_timeout                     = 4000
      interrupt_mode                    = "MSIx"
      io_throttle_count                 = 256
      lun_queue_depth                   = 20
      max_luns_per_target               = 1024
      organization                      = "default"
      plogi_retries                     = 8
      plogi_timeout                     = 20000
      resource_allocation_timeout       = 10000
      receive_ring_size                 = 64
      scsi_io_queue_count               = 1
      scsi_io_ring_size                 = 512
      transmit_ring_size                = 64
    }
  }
}

module "fibre_channel_adapter_policies" {
  depends_on = [
    local.org_moids
  ]
  source      = "terraform-cisco-modules/imm/intersight//modules/fibre_channel_adapter_policies"
  for_each    = local.san_connectivity_policies
  description = each.value.description != "" ? each.value.description : "${each.key} ${each.value.adapter_template} Fibre Channel Adapter Policy."
  name        = "${each.key}_${each.value.adapter_template}"
  org_moid    = local.org_moids[each.value.organization].moid
  tags        = length(each.value.tags) > 0 ? each.value.tags : local.tags
  # vHBA Adapter Customization for Template
  error_detection_timeout          = 20000
  error_recovery_enabled           = false
  error_recovery_io_retry_count    = each.value.adapter_template != "default" ? 30 : 8
  error_recovery_io_retry_timeout  = 5
  error_recovery_link_down_timeout = 30000
  error_recovery_port_down_timeout = each.value.adapter_template == "WindowsBoot" ? 5000 : length(regexall(
  "(FCNVMeInitiator|Initiator|Solaris|VMware|Windows)", each.value.adapter_template)) > 0 ? 30000 : 10000
  flogi_retries               = 8
  flogi_timeout               = 4000
  interrupt_mode              = "MSIx"
  io_throttle_count           = each.value.adapter_template != "default" ? 256 : 512
  lun_count                   = 1024
  lun_queue_depth             = 20
  plogi_retries               = 8
  plogi_timeout               = each.value.adapter_template == "WindowsBoot" ? 4000 : 20000
  resource_allocation_timeout = 10000
  rx_ring_size                = length(regexall("(FCNVMeTarget|Target)", each.value.adapter_template)) > 0 ? 2048 : 64
  scsi_io_queues              = length(regexall("(FCNVMeTarget|FCNVMeInitiator)", each.value.adapter_template)) > 0 ? 16 : 1
  scsi_io_ring_size           = 512
  tx_ring_size                = 64
}


