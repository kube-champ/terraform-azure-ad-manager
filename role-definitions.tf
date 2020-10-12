resource "azurerm_role_definition" "role" {
  for_each = var.role_definitions

  name        = each.key
  scope       = each.value.scope
  description = each.value.description

  permissions {
    actions     = each.value.permissions.actions
    not_actions = each.value.permissions.not_actions
  }

  assignable_scopes = each.value.assignable_scopes
}