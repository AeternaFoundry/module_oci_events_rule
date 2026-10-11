variable "events_rules" {
  description = <<EOT
Map of events_rules, attributes below
Required:
    - compartment_id
    - display_name
    - is_enabled
    - actions (block):
        - action (optional, block):
            - action_type (required)
            - description (optional)
            - function_id (optional)
            - is_enabled (required)
            - stream_id (optional)
            - topic_id (optional)
        - actions (optional, block):
            - action_type (required)
            - description (optional)
            - function_id (optional)
            - is_enabled (required)
            - stream_id (optional)
            - topic_id (optional)
Optional:
    - condition
    - defined_tags
    - description
    - freeform_tags
    - condition_details (block):
        - data (optional)
        - event_types (optional)
    - timeouts (block):
        - create (optional)
        - delete (optional)
        - update (optional)
EOT

  type = map(object({
    compartment_id = string
    display_name   = string
    is_enabled     = bool
    condition      = optional(string)
    defined_tags   = optional(map(string))
    description    = optional(string)
    freeform_tags  = optional(map(string))
    actions = object({
      action = optional(list(object({
        action_type = string
        description = optional(string)
        function_id = optional(string)
        is_enabled  = bool
        stream_id   = optional(string)
        topic_id    = optional(string)
      })))
      actions = optional(list(object({
        action_type = string
        description = optional(string)
        function_id = optional(string)
        is_enabled  = bool
        stream_id   = optional(string)
        topic_id    = optional(string)
      })))
    })
    condition_details = optional(object({
      data        = optional(string)
      event_types = optional(list(string))
    }))
    timeouts = optional(object({
      create = optional(string)
      delete = optional(string)
      update = optional(string)
    }))
  }))
  validation {
    condition = alltrue([
      for k, v in var.events_rules : (
        v.actions.actions == null || alltrue([for item in v.actions.actions : (contains([for v in ["FAAS", "ONS", "OSS"] : lower(v)], lower(item.action_type)))])
      )
    ])
    error_message = "must be one of: \"FAAS\", \"ONS\", \"OSS\""
  }
  validation {
    condition = alltrue([
      for k, v in var.events_rules : (
        v.actions.action == null || alltrue([for item in v.actions.action : (contains([for v in ["FAAS", "ONS", "OSS"] : lower(v)], lower(item.action_type)))])
      )
    ])
    error_message = "must be one of: \"FAAS\", \"ONS\", \"OSS\""
  }
  validation {
    condition = alltrue([
      for k, v in var.events_rules : (
        v.condition == null || (can(jsondecode(v.condition)))
      )
    ])
    error_message = "must be valid JSON"
  }
  validation {
    condition = alltrue([
      for k, v in var.events_rules : (
        v.condition_details == null || (v.condition_details.data == null || (can(jsondecode(v.condition_details.data))))
      )
    ])
    error_message = "must be valid JSON"
  }
}

