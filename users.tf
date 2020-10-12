resource "random_password" "user_pass" {
  for_each = var.users

  length           = 32
  special          = true
  override_special = "_%@"
}

resource "azuread_user" "u" {
  for_each = var.users

  user_principal_name   = each.value.email
  display_name          = each.value.display_name
  mail_nickname         = each.value.mail_nickname
  account_enabled       = each.value.account_enabled
  force_password_change = each.value.force_password_change
  password              = random_password.user_pass[each.key].result
}
