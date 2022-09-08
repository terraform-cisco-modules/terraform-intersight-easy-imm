
#______________________________________________
#
# Resource Pool Variables
#______________________________________________

variable "resource_pools" {
  default = {
    default = { # The Pool Name will be {each.key}.  In this case it would be default if left like this.
      assignment_order   = "default"
      description        = ""
      pool_type          = "Static"
      resource_type      = "Server"
      serial_number_list = ["**REQUIRED**"]
      server_type        = "Blades"
      tags               = []
    }
  }
  description = <<-EOT
  key - Name of the Resource Pool.
  * Assignment order decides the order in which the next identifier is allocated.
    - default - (Default) Assignment order is decided by the system.
    - sequential - Identifiers are assigned in a sequential order.
  * description - Description to Assign to the Pool.
  * pool_type - The resource management type in the pool, it can be either static or dynamic.
    - Dynamic - The resources in the pool will be updated dynamically based on the condition.
    - Static - The resources in the pool will not be changed until user manually update it.
  * resource_type - The type of the resource present in the pool, example 'server' its combination of RackUnit and Blade.
    - None - The resource cannot consider for Resource Pool.
    - Server - Resource Pool holds the server kind of resources, example - RackServer, Blade.
  * serial_number_list - A List of Compute Serial Numbers to assign to the policy.  These must be the same type of server. Cannot be some blades and some rackmounts.
  * server_type - The Server type to add to the selection filter field.
    - Blades - A Blade Server.
    - RackUnits - A Rackmount Server.
  * tags - List of Key/Value Pairs to Assign as Attributes to the Pool.
  EOT
  type = map(object(
    {
      assignment_order   = optional(string)
      description        = optional(string)
      pool_type          = optional(string)
      resource_type      = optional(string)
      serial_number_list = set(string)
      server_type        = optional(string)
      tags               = optional(list(map(string)))
    }
  ))
}


#____________________________________________________________
#
# Server Moid Data Source
# GUI Location:
#   Operate > Servers > Copy the Serial from the Column.
#____________________________________________________________

data "intersight_compute_physical_summary" "servers" {
  for_each = toset(local.resource_pool_list)
  serial   = each.value
}

#____________________________________________________________
#
# Intersight Pools Module
# GUI Location: Pools > Create Pool
#____________________________________________________________

#______________________________________________
#
# Resource Pools
#______________________________________________

resource "intersight_resourcepool_pool" "resource_pools" {
  depends_on = [
    local.org_moid
  ]
  for_each         = local.resource_pools
  assignment_order = each.value.assignment_order
  description      = each.value.description != "" ? each.value.description : "${each.key} Resource Pool."
  name             = each.key
  pool_type        = each.value.pool_type
  resource_pool_parameters = [
    {
      additional_properties = jsonencode(
        {
          ManagementMode = "Intersight"
        }
      )
      class_id    = "resourcepool.ServerPoolParameters"
      object_type = "resourcepool.ServerPoolParameters"
    }
  ]
  resource_type = each.value.resource_type
  selectors = [
    {
      additional_properties = ""
      class_id              = "resource.Selector"
      object_type           = "resource.Selector"
      selector = "/api/v1/compute/${each.value.server_type}?$filter=(Moid in (${format(
        "'%s'", join("','", [
          for s in each.value.serial_number_list : data.intersight_compute_physical_summary.servers[
          "${s}"].results[0].moid
      ]))})) and (ManagementMode eq 'Intersight')"
    }
  ]
  organization {
    moid        = local.org_moid
    object_type = "organization.Organization"
  }
  dynamic "tags" {
    for_each = length(each.value.tags) > 0 ? each.value.tags : local.tags
    content {
      key   = tags.value.key
      value = tags.value.value
    }
  }
}
