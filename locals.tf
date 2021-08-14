locals {
  workspaces = {
    for k, v in var.workspaces : k => {
      auto_apply        = (v.auto_apply != null ? v.auto_apply : true)
      description       = (v.description != null ? v.description : "")
      remote_state      = (length(regexall("(domain|pool)", v.workspace_type)) > 0 ? true : false)
      working_directory = (v.working_directory != null ? v.working_directory : "modules/pools")
      workspace_type    = (v.workspace_type != null ? v.workspace_type : "pool")
    }
  }
}
