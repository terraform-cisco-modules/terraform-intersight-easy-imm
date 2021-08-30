#_________________________________________________________________________
#
# Intersight Disk Group/Storage Policies Variables
# GUI Location: Configure > Policies > Create Policy > Disk Group > Start
# GUI Location: Configure > Policies > Create Policy > Storage > Start
#_________________________________________________________________________

variable "policies_storage" {
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
  key - Name of the Storage Policy.
  * access_policy - Access policy that host has on this virtual drive.
    - Default - Use platform default access mode.
    - Blocked - Host can neither read nor write to the VD.
    - ReadOnly - Host can only read from the VD.
    - ReadWrite - Enables host to perform read-write on the VD.
  * boot_drive - The flag enables the use of this virtual drive as a boot drive.
  * description - Description to Assign to the Policy.
  * disks_group_0 - List of Disks to assign to the first span group.
  * disks_group_1 - List of Disks to assign to the second span group.  Only use with Raid10, Raid50, and Raid60.
  * drive_cache - Drive Cache property expect disk cache policy.
    - Default - Use platform default drive cache mode.
    - Disable - Disables IO caching on the drive.
    - Enable - Enables IO caching on the drive.
    - NoChange - Drive cache policy is unchanged.
  * drive_name - The name of the virtual drive. The name can be between 1 and 15 alphanumeric characters. Spaces or any special characters other than - (hyphen), _ (underscore), : (colon), and . (period) are not allowed.
  * io_policy - Desired IO mode - direct IO or cached IO.
    - Cached - Use cached IO for writing into cache and then to disk.
    - Default - Use platform default IO mode.
    - Direct - Use direct IO for writing directly into the disk.
  * organization - Name of the Intersight Organization to assign this Policy to.
    - https://intersight.com/an/settings/organizations/
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
  * tags - List of Key/Value Pairs to Assign as Attributes to the Policy.
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
      access_policy = optional(string)
      boot_drive    = optional(bool)
      description   = optional(string)
      disks_group_0 = optional(list(string))
      disks_group_1 = optional(list(string))
      drive_cache   = optional(string)
      drive_name    = optional(string)
      io_policy     = optional(string)
      organization  = optional(string)
      raid_level    = optional(string)
      read_policy   = optional(string)
      retain_policy = optional(bool)
      stripe_size   = optional(string)
      tags          = optional(list(map(string)))
      unused_disks  = optional(string)
      use_jbods     = optional(bool)
      write_policy  = optional(string)
    }
  ))
}


#_________________________________________________________________________
#
# Intersight Disk Group Policies
# GUI Location: Configure > Policies > Create Policy > Disk Group > Start
#_________________________________________________________________________

module "disk_group_policies" {
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
