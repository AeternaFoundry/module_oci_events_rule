output "events_rules_id" {
  description = "Map of id values across all events_rules, keyed the same as var.events_rules except keys with no id are omitted"
  value       = { for k, v in oci_events_rule.events_rules : k => v.id if v.id != null && length(v.id) > 0 }
}
output "events_rules_actions" {
  description = "Map of actions values across all events_rules, keyed the same as var.events_rules except keys with no actions are omitted"
  value       = { for k, v in oci_events_rule.events_rules : k => one(v.actions) if v.actions != null && length(v.actions) > 0 }
}
output "events_rules_compartment_id" {
  description = "Map of compartment_id values across all events_rules, keyed the same as var.events_rules except keys with no compartment_id are omitted"
  value       = { for k, v in oci_events_rule.events_rules : k => v.compartment_id if v.compartment_id != null && length(v.compartment_id) > 0 }
}
output "events_rules_condition" {
  description = "Map of condition values across all events_rules, keyed the same as var.events_rules except keys with no condition are omitted"
  value       = { for k, v in oci_events_rule.events_rules : k => v.condition if v.condition != null && length(v.condition) > 0 }
}
output "events_rules_condition_details" {
  description = "Map of condition_details values across all events_rules, keyed the same as var.events_rules except keys with no condition_details are omitted"
  value       = { for k, v in oci_events_rule.events_rules : k => one(v.condition_details) if v.condition_details != null && length(v.condition_details) > 0 }
}
output "events_rules_defined_tags" {
  description = "Map of defined_tags values across all events_rules, keyed the same as var.events_rules except keys with no defined_tags are omitted"
  value       = { for k, v in oci_events_rule.events_rules : k => v.defined_tags if v.defined_tags != null && length(v.defined_tags) > 0 }
}
output "events_rules_description" {
  description = "Map of description values across all events_rules, keyed the same as var.events_rules except keys with no description are omitted"
  value       = { for k, v in oci_events_rule.events_rules : k => v.description if v.description != null && length(v.description) > 0 }
}
output "events_rules_display_name" {
  description = "Map of display_name values across all events_rules, keyed the same as var.events_rules except keys with no display_name are omitted"
  value       = { for k, v in oci_events_rule.events_rules : k => v.display_name if v.display_name != null && length(v.display_name) > 0 }
}
output "events_rules_freeform_tags" {
  description = "Map of freeform_tags values across all events_rules, keyed the same as var.events_rules except keys with no freeform_tags are omitted"
  value       = { for k, v in oci_events_rule.events_rules : k => v.freeform_tags if v.freeform_tags != null && length(v.freeform_tags) > 0 }
}
output "events_rules_is_enabled" {
  description = "Map of is_enabled values across all events_rules, keyed the same as var.events_rules except keys with no is_enabled are omitted"
  value       = { for k, v in oci_events_rule.events_rules : k => v.is_enabled if v.is_enabled != null }
}
output "events_rules_lifecycle_message" {
  description = "Map of lifecycle_message values across all events_rules, keyed the same as var.events_rules except keys with no lifecycle_message are omitted"
  value       = { for k, v in oci_events_rule.events_rules : k => v.lifecycle_message if v.lifecycle_message != null && length(v.lifecycle_message) > 0 }
}
output "events_rules_state" {
  description = "Map of state values across all events_rules, keyed the same as var.events_rules except keys with no state are omitted"
  value       = { for k, v in oci_events_rule.events_rules : k => v.state if v.state != null && length(v.state) > 0 }
}
output "events_rules_time_created" {
  description = "Map of time_created values across all events_rules, keyed the same as var.events_rules except keys with no time_created are omitted"
  value       = { for k, v in oci_events_rule.events_rules : k => v.time_created if v.time_created != null && length(v.time_created) > 0 }
}

