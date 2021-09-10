#_________________________________________________________________________
#
# Intersight Storage Policy Variables
# GUI Location: Configure > Policies > Create Policy > Storage > Start
#_________________________________________________________________________

variable "storage_policies" {
  default = {
    default = {
      access_policy = "Default"
      boot_drive    = true
      description   = ""
      disks_group_0 = [1, 2]
      disks_group_1 = []
      drive_cache   = "Default"
      drive_name    = "vd0"
      io_policy     = "Default"
      organization  = "default"
      raid_level    = "Raid1"
      read_policy   = "Default"
      retain_policy = true
      stripe_size   = "Default"
      tags          = []
      unused_disks  = "UnconfiguredGood"
      use_jbods     = true
      write_policy  = "Default"
    }
  }
  description = <<-EOT
  key - Name for the Storage Policy.
  * description - Description to Assign to the Policy.
  * global_hot_spares - A collection of disks that is to be used as hot spares, globally, for all the RAID groups. Allowed value is a number range separated by a comma or a hyphen.
  * m2_virtual_drive - Virtual Drive configuration for M.2 RAID controller. This complex property has following sub-properties:
    - controller_slot - Select the M.2 RAID controller slot on which the virtual drive is to be created. For example:
      * MSTOR-RAID-1 - Virtual drive will be created on the M.2 RAID controller in the first slot.
      * MSTOR-RAID-2 - Virtual drive will be created on the M.2 RAID controller in the second slot, if available.
      * MSTOR-RAID-1,MSTOR-RAID-2 - Virtual drive will be created on the M.2 RAID controller in both the slots, if available.
    - enable - If enabled, this will create a virtual drive on the M.2 RAID controller.
  * organization - Name of the Intersight Organization to assign this Policy to.
    - https://intersight.com/an/settings/organizations/
  * raid0_drive - This complex property has following sub-properties:
    - access_policy - Access policy that host has on this virtual drive.
      * Default - Use platform default access mode.
      * ReadWrite - Enables host to perform read-write on the VD.
      * ReadOnly - Host can only read from the VD.
      * Blocked - Host can neither read nor write to the VD.
    - drive_cache - Disk cache policy for the virtual drive.
      * Default - Use platform default drive cache mode.
      * NoChange - Drive cache policy is unchanged.
      * Enable - Enables IO caching on the drive.
      * Disable - Disables IO caching on the drive.
    - drive_slots - The set of drive slots where RAID0 virtual drives must be created.
    - enable - If enabled, this will create a RAID0 virtual drive per disk and encompassing the whole disk.
    - read_policy - Read ahead mode to be used to read data from this virtual drive.
      * Default - Use platform default read ahead mode.
      * ReadAhead - Use read ahead mode for the policy.
      * NoReadAhead - Do not use read ahead mode for the policy.
    - strip_size - Desired strip size - Allowed values are 64KiB, 128KiB, 256KiB, 512KiB, 1024KiB.
      * 64 - Number of bytes in a strip is 64 Kibibytes.
      * 128 - Number of bytes in a strip is 128 Kibibytes.
      * 256 - Number of bytes in a strip is 256 Kibibytes.
      * 512 - Number of bytes in a strip is 512 Kibibytes.
      * 1024 - Number of bytes in a strip is 1024 Kibibytes or 1 Mebibyte.
    - write_policy:(string) Write mode to be used to write data to this virtual drive.
      * Default - Use platform default write mode.
      * WriteThrough - Data is written through the cache and to the physical drives. Performance is improved, because subsequent reads of that data can be satisfied from the cache.
      * WriteBackGoodBbu - Data is stored in the cache, and is only written to the physical drives when space in the cache is needed. Virtual drives requesting this policy fall back to Write Through caching when the battery backup unit (BBU) cannot guarantee the safety of the cache in the event of a power failure.
      * AlwaysWriteBack - With this policy, write caching remains Write Back even if the battery backup unit is defective or discharged.
  * tags - List of Key/Value Pairs to Assign as Attributes to the Policy.
  * unused_disks_state - State to which disks, not used in this policy, are to be moved.
    - NoChange - (Default) Drive state will not be modified by Storage Policy.
    - UnconfiguredGood - Unconfigured good state -ready to be added in a RAID group.
    - Jbod - JBOD state where the disks start showing up to Host OS.
  * use_jbod_for_vd_creation - Default is false.  Disks in JBOD State are used to create virtual drives.


  * drive_group - Drive Group(s) to Assign to the Storage Policy.
    key - Name of the Drive Group.
    - Default - Use platform default drive cache mode.
    - Disable - Disables IO caching on the drive.
    - Enable - Enables IO caching on the drive.
    - NoChange - Drive cache policy is unchanged.
  * drive_name - The name of the virtual drive. The name can be between 1 and 15 alphanumeric characters. Spaces or any special characters other than - (hyphen), _ (underscore), : (colon), and . (period) are not allowed.
  * io_policy - Desired IO mode - direct IO or cached IO.
    - Cached - Use cached IO for writing into cache and then to disk.
    - Default - Use platform default IO mode.
    - Direct - Use direct IO for writing directly into the disk.
  * raid_level - The supported RAID level for the disk group.
    - Raid0 - RAID 0 Stripe Raid Level.
    - Raid1 - RAID 1 Mirror Raid Level.
    - Raid5 - RAID 5 Mirror Raid Level.
    - Raid6 - RAID 6 Mirror Raid Level.
    - Raid10 - RAID 10 Mirror Raid Level.
    - Raid50 - RAID 50 Mirror Raid Level.
    - Raid60 - RAID 60 Mirror Raid Level.
  * read_policy - Read ahead mode to be used to read data from this virtual drive.
    - Default - Use platform default read ahead mode.
    - NoReadAhead - Do not use read ahead mode for the policy.
    - ReadAhead - Use read ahead mode for the policy.
  * retain_policy - Retains the virtual drives defined in policy if they exist already. If this flag is false, the existing virtual drives are removed and created again based on virtual drives in the policy.
  * stripe_size - The strip size is the portion of a stripe that resides on a single drive in the drive group. The stripe consists of the data segments that the RAID controller writes across multiple drives, not including parity drives.
    - Default - Use platform default strip size for a virtual drive.
    - 32k - Enables a strip size of 32k for a virtual drive.
    - 64k - Enables a strip size of 64k for a virtual drive.
    - 128k - Enables a strip size of 128k for a virtual drive.
    - 256k - Enables a strip size of 256k for a virtual drive.
    - 512k - Enables a strip size of 512k for a virtual drive.
    - 1024k - Enables a strip size of 1024k for a virtual drive.
  * unused_disks - Unused Disks State is used to specify the state, unconfigured good or jbod, in which the disks that are not used in this policy should be moved.
    - Jbod - JBOD state where the disks start showing up to host os.
    - UnconfiguredGood - Unconfigured good state, ready to be added in a RAID group.
  * use_jbods - Selected disks in the disk group in JBOD state will be set to Unconfigured Good state before they are used in virtual drive creation.
  * write_policy - Write mode to be used to write data to this virtual drive.
    - Default - Use platform default write mode.
    - WriteThrough - Data is written through the cache and to the physical drives. Performance is improved, because subsequent reads of that data can be satisfied from the cache.
    - WriteBackGoodBbu - Data is stored in the cache, and is only written to the physical drives when space in the cache is needed. Virtual drives requesting this policy fall back to Write Through caching when the battery backup unit (BBU) cannot guarantee the safety of the cache in the event of a power failure.
    - AlwaysWriteBack - With this policy, write caching remains Write Back even if the battery backup unit is defective or discharged.
  EOT
  type = map(object(
    {
      description       = optional(string)
      global_hot_spares = optional(string)
      m2_virtual_drive = optional(map(object(
        {
          controller_slot = string
          enable          = bool
        }
      )))
      organization = optional(string)
      raid0_drive = optional(map(object(
        {
          access_policy = string
          drive_cache   = string
          drive_slots   = string
          enable        = bool
          read_policy   = string
          strip_size    = number
          write_policy  = string
        }
      )))
      tags                     = optional(list(map(string)))
      unused_disks_state       = optional(string)
      use_jbod_for_vd_creation = optional(bool)
      drive_group = map(object(
        {
          automatic_drive_group = optional(map(object(
            {
              drive_type               = string
              drives_per_span          = number
              minimum_drive_size       = number
              num_dedicated_hot_spares = optional(number)
              number_of_spans          = number
              use_remaining_drives     = optional(bool)
            }
          )))
          manual_drive_group = optional(map(object(
            {
              dedicated_hot_spares = optional(string)
              slots                = bool
            }
          )))
          raid_level = optional(string)
          virtual_drives = optional(map(object(
            {
              access_policy       = string
              boot_drive          = string
              drive_cache         = string
              expand_to_available = bool
              read_policy         = string
              size                = number
              strip_size          = number
              write_policy        = string
            }
          )))
        }
      ))
    }
  ))
}


#_________________________________________________________________________
#
# Intersight Storage Policies
# GUI Location: Configure > Policies > Create Policy > Storage > Start
#_________________________________________________________________________

module "storage_policies" {
  depends_on = [
    local.org_moids,
    module.ucs_server_profiles,
    module.disk_group_policies,
  ]
  source        = "terraform-cisco-modules/imm/intersight//modules/storage_policies"
  for_each      = local.policies_storage
  description   = each.value.description != "" ? each.value.description : "${each.key} Storage Policy."
  name          = each.key
  org_moid      = local.org_moids[each.value.organization].moid
  retain_policy = each.value.retain_policy
  tags          = length(each.value.tags) > 0 ? each.value.tags : local.tags
  unused_disks  = each.value.unused_disks
  profiles = [
    for s in sort(keys(local.ucs_server_profiles)) :
    module.ucs_server_profiles[s].moid
    if local.ucs_server_profiles[s].profile.storage_policies == each.key
  ]
  virtual_drives = [
    {
      access_policy         = each.value.access_policy
      additional_properties = ""
      boot_drive            = each.value.boot_drive
      disk_group_name       = module.disk_groups[each.key].name
      disk_group_policy     = module.disk_groups[each.key].moid
      drive_cache           = each.value.drive_cache
      expand_to_available   = true
      io_policy             = each.value.io_policy
      name                  = each.value.drive_name
      read_policy           = each.value.read_policy
      size                  = 100
      strip_size            = each.value.stripe_size
      write_policy          = each.value.write_policy
    }
  ]
}

#_________________________________________________________________________
#
# Intersight Disk Group Policies
# GUI Location: Configure > Policies > Create Policy > Disk Group > Start
#_________________________________________________________________________

module "x_policies" {
  depends_on = [
    local.org_moids,
  ]
  source      = "terraform-cisco-modules/imm/intersight//modules/disk_group_policies"
  for_each    = local.policies_storage
  description = each.value.description != "" ? each.value.description : "${each.key} Disk Group Policy."
  name        = each.key
  raid_level  = each.value.raid_level
  use_jbods   = each.value.use_jbods
  org_moid    = local.org_moids[each.value.organization].moid
  tags        = length(each.value.tags) > 0 ? each.value.tags : local.tags
  span_groups = length(regexall("Raid(10|50|60)", each.value.raid_level)) > 0 ? {
    span_0 = [for s in each.value.disks_group_0 : { disk = s }]
    span_1 = [for s in each.value.disks_group_1 : { disk = s }]
    } : {
    span_0 = [for s in each.value.disks_group_0 : { disk = s }]
  }
}
