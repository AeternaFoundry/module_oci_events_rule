resource "oci_events_rule" "events_rules" {
  for_each = var.events_rules

  compartment_id = each.value.compartment_id
  display_name   = each.value.display_name
  is_enabled     = each.value.is_enabled
  condition      = each.value.condition
  defined_tags   = each.value.defined_tags
  description    = each.value.description
  freeform_tags  = each.value.freeform_tags

  actions {
    dynamic "action" {
      for_each = each.value.actions.action != null ? each.value.actions.action : []
      content {
        action_type = action.value.action_type
        description = action.value.description
        function_id = action.value.function_id
        is_enabled  = action.value.is_enabled
        stream_id   = action.value.stream_id
        topic_id    = action.value.topic_id
      }
    }
    dynamic "actions" {
      for_each = each.value.actions.actions != null ? each.value.actions.actions : []
      content {
        action_type = actions.value.action_type
        description = actions.value.description
        function_id = actions.value.function_id
        is_enabled  = actions.value.is_enabled
        stream_id   = actions.value.stream_id
        topic_id    = actions.value.topic_id
      }
    }
  }

  dynamic "condition_details" {
    for_each = each.value.condition_details != null ? [each.value.condition_details] : []
    content {
      data        = condition_details.value.data
      event_types = condition_details.value.event_types
    }
  }

  dynamic "timeouts" {
    for_each = each.value.timeouts != null ? [each.value.timeouts] : []
    content {
      create = timeouts.value.create
      delete = timeouts.value.delete
      update = timeouts.value.update
    }
  }
}

