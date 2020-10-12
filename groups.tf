resource "azuread_group" "group" {
  for_each = var.groups

  name                    = each.key
  description             = each.value.description
  prevent_duplicate_names = true

  members = data.azuread_users.group_members[each.key].object_ids
  owners  = data.azuread_users.group_owners[each.key].object_ids
}
