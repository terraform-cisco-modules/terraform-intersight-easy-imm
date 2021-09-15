locals {
  workspaces = {
    for k, v in var.workspaces : k => {
      allow_destroy_plan        = v.allow_destroy_plan != null ? v.allow_destroy_plan : true
      auto_apply                = v.auto_apply != null ? v.auto_apply : false
      branch                    = v.branch != null ? v.branch : "master"
      description               = v.description != null ? v.description : ""
      global_remote_state       = v.global_remote_state != null ? v.global_remote_state : false
      queue_all_runs            = v.queue_all_runs != null ? v.queue_all_runs : false
      remote_state_consumer_ids = v.remote_state_consumer_ids != null ? v.remote_state_consumer_ids : []
      speculative_enabled       = v.speculative_enabled != null ? v.speculative_enabled : true
      working_directory         = v.working_directory != null ? v.working_directory : ""
      workspace_type            = v.workspace_type != null ? v.workspace_type : ""
    }
  }
}
