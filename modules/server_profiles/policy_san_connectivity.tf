#_________________________________________________________________________
#
# Intersight Local User Policies Variables
# GUI Location: Configure > Policies > Create Policy > Local User > Start
#_________________________________________________________________________

variable "policy_local_users" {
  default = {
    default = {
      description              = ""
      enforce_strong_password  = true
      force_send_password      = false
      grace_period             = 0
      local_users              = []
      notification_period      = 15
      organization             = "default"
      password_expiry          = false
      password_expiry_duration = 90
      password_history         = 5
      tags                     = []
    }
  }
  description = <<-EOT
  key - Name of the Local User Policy.
  1. description - Description to Assign to the Policy.
  2. force_send_password - User password will always be sent to endpoint device. If the option is not selected, then user password will be sent to endpoint device for new users and if user password is changed for existing users.
  3. grace_period - Time period until when you can use the existing password, after it expires.
  4. local_users -
  5. notification_period - The duration after which the password will expire.
  6. organization - Name of the Intersight Organization to assign this Policy to.
    - https://intersight.com/an/settings/organizations/
  7. password_expiry - Enables password expiry on the endpoint.
  7. password_expiry_duration - Set time period for password expiration. Value should be greater than notification period and grace period.
  8. password_history - Tracks password change history. Specifies in number of instances, that the new password was already used.
  9. tags - List of Key/Value Pairs to Assign as Attributes to the Policy.
  EOT
  type = map(object(
    {
      description              = optional(string)
      enforce_strong_password  = optional(bool)
      force_send_password      = optional(bool)
      grace_period             = optional(number)
      local_users              = optional(list(map(string)))
      notification_period      = optional(number)
      organization             = optional(string)
      password_expiry          = optional(bool)
      password_expiry_duration = optional(number)
      password_history         = optional(number)
      tags                     = optional(list(map(string)))
    }
  ))
}


#_________________________________________________________________________
#
# Local User Policies
# GUI Location: Configure > Policies > Create Policy > Local User > Start
#_________________________________________________________________________

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


