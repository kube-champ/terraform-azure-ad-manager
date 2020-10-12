resource "azurerm_role_assignment" "sp_assignment" {
  for_each = var.service_principals_role_assignments

  scope              = data.azurerm_subscription.primary.id
  role_definition_id = data.azurerm_role_definition.sp_role_def[each.key].id
  principal_id       = azuread_service_principal.sp[each.value.principal_name].object_id
}

resource "azurerm_role_assignment" "users_assignment" {
  for_each = var.users_role_assignments

  scope              = data.azurerm_subscription.primary.id
  role_definition_id = data.azurerm_role_definition.user_role_def[each.key].id
  principal_id       = data.azuread_user.u[each.key].object_id
}