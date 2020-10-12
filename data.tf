data "azurerm_subscription" "primary" {
}

data "azurerm_role_definition" "sp_role_def" {
  depends_on = [azurerm_role_definition.role]
  for_each   = var.service_principals_role_assignments

  name  = each.value.role_name
  scope = each.value.scope
}

data "azurerm_role_definition" "user_role_def" {
  depends_on = [azurerm_role_definition.role]
  for_each   = var.users_role_assignments

  name  = each.value.role_name
  scope = each.value.scope
}

data "azuread_user" "u" {
  depends_on = [azuread_user.u]
  for_each   = var.users_role_assignments

  user_principal_name = each.value.principal_name
}

data "azuread_users" "group_members" {
  depends_on = [azuread_user.u]
  for_each   = var.groups

  user_principal_names = each.value.members
}

data "azuread_users" "group_owners" {
  depends_on = [azuread_user.u]
  for_each   = var.groups

  user_principal_names = each.value.owners
}

