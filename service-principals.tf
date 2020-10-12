resource "azuread_service_principal" "sp" {
  for_each = var.service_principals

  application_id               = azuread_application.app[each.value.application_name].application_id
  app_role_assignment_required = each.value.app_role_assignment_required

  tags = each.value.tags
}

resource "random_password" "sp_pass" {
  for_each = var.service_principals

  length           = 32
  special          = true
  override_special = "_%@"
}

resource "azuread_application_password" "sp" {
  for_each = var.service_principals

  application_object_id = azuread_application.app[each.value.application_name].object_id
  description           = each.value.description
  value                 = random_password.sp_pass[each.key].result
  end_date              = each.value.end_date
}
