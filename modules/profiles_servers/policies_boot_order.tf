
#_________________________________________________________________________
#
# Intersight Boot Order Policies Variables
# GUI Location: Configure > Policies > Create Policy > Boot Order > Start
#_________________________________________________________________________

variable "policies_boot_order" {
  default = {
    default = {
      boot_policy  = "uefi_m2_raid"
      boot_secure  = true
      description  = ""
      organization = "default"
      tags         = []
    }
  }
  description = <<-EOT
  key - Name of the Boot Order Policy.
  * boot_policy - Name of the Best Practice Boot Order Policy to ASsign.
    - uefi_m2_pch
    - uefi_m2_raid
    - uefi_sdcard
  * boot_secure - Flag to Enforce Uefi Secure Boot Mode.
  * description - Description to Assign to the Policy.
  * organization - Name of the Intersight Organization to assign this Policy to.
    - https://intersight.com/an/settings/organizations/
  * tags - List of Key/Value Pairs to Assign as Attributes to the Policy.
  EOT
  type = map(object(
    {
      boot_policy  = optional(string)
      boot_secure  = optional(bool)
      description  = optional(string)
      organization = optional(string)
      tags         = optional(list(map(string)))
    }
  ))
}


#_________________________________________________________________________
#
# Boot Order Policies
# GUI Location: Configure > Policies > Create Policy > Boot Order > Start
#_________________________________________________________________________


module "policies_boot_order" {
  depends_on = [
    local.org_moids,
    module.ucs_server_profiles
  ]
  source      = "terraform-cisco-modules/imm/intersight//modules/policies_boot_order"
  for_each    = local.policies_boot_order
  boot_mode   = "Uefi"
  boot_secure = each.value.boot_secure
  description = each.value.description != "" ? each.value.description : "${each.key} Boot Order Policy."
  name        = each.key
  org_moid    = local.org_moids[each.value.organization].moid
  tags        = length(each.value.tags) > 0 ? each.value.tags : local.tags
  profiles = [
    for s in sort(keys(local.ucs_server_profiles)) :
    module.ucs_server_profiles[s].moid
    if local.ucs_server_profiles[s].profile.policies_boot_order == each.key
  ]
  boot_devices = length(regexall("(uefi_m2_pch)", each.value.boot_policy)) > 0 ? [
    {
      additional_properties = jsonencode({ Subtype = "cimc-mapped-dvd" })
      enabled               = true,
      name                  = "CIMC_DVD",
      object_type           = "boot.VirtualMedia",
    },
    {
      additional_properties = jsonencode({ Subtype = "kvm-mapped-dvd" })
      enabled               = true,
      name                  = "KVM_DVD",
      object_type           = "boot.VirtualMedia",
    },
    {
      additional_properties = jsonencode(
        {
          Bootloader = {
            ClassId     = "boot.Bootloader"
            Description = "UEFI Bootloader",
            Name        = "BOOTx64.EFI",
            ObjectType  = "boot.Bootloader"
            Path        = "\\EFI\\BOOT\\"
          },
          Lun = 0

        }
      )
      enabled     = true,
      name        = "M2-PCH",
      object_type = "boot.PchStorage",
    },
    ] : length(regexall("(uefi_m2_raid)", each.value.boot_policy)) > 0 ? [
    {
      additional_properties = jsonencode({ Subtype = "cimc-mapped-dvd" })
      enabled               = true,
      name                  = "CIMC_DVD",
      object_type           = "boot.VirtualMedia",
    },
    {
      additional_properties = jsonencode({ Subtype = "kvm-mapped-dvd" })
      enabled               = true,
      name                  = "KVM_DVD",
      object_type           = "boot.VirtualMedia",
    },
    {
      additional_properties = jsonencode(
        {
          Bootloader = {
            ClassId     = "boot.Bootloader"
            Description = "UEFI Bootloader",
            Name        = "BOOTx64.EFI",
            ObjectType  = "boot.Bootloader"
            Path        = "\\EFI\\BOOT\\"
          },
          Slot = "MSTOR-RAID"

        }
      )
      enabled     = true,
      name        = "M2_RAID",
      object_type = "boot.LocalDisk",
    },
    ] : length(regexall("(uefi_sdcard)", each.value.boot_policy)) > 0 ? [
    {
      additional_properties = jsonencode({ Subtype = "cimc-mapped-dvd" })
      enabled               = true,
      name                  = "cimc_dvd",
      object_type           = "boot.VirtualMedia",
    },
    {
      additional_properties = jsonencode({ Subtype = "kvm-mapped-dvd" })
      enabled               = true,
      name                  = "kvm_dvd",
      object_type           = "boot.VirtualMedia",
    },
    {
      additional_properties = jsonencode(
        {
          Bootloader = {
            ClassId     = "boot.Bootloader"
            Description = "ESXi Bootloader",
            Name        = "BOOTX64.EFI",
            ObjectType  = "boot.Bootloader"
            Path        = "\\EFI\\BOOT\\"
          }
          Lun     = 0
          Subtype = "SDCARD" # None|flex-flash|flex-util|SDCARD
        }
      )
      enabled     = true,
      name        = "SdCard",
      object_type = "boot.SdCard",
    },
  ] : []
}
