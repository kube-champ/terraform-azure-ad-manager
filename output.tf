output "applications" {
  value = {
    for app in azuread_application.app :
    app.name => {
      application_id = app.application_id
      object_id      = app.object_id
    }
  }
}

output "service_principals" {
  value = {
    for key, value in var.service_principals :
    key => {
      object_id      = azuread_service_principal.sp[key].object_id
      application_id = azuread_service_principal.sp[key].application_id
      password       = azuread_application_password.sp[key].value
    }
  }
}

output "users" {
  value = {
    for user in azuread_user.u :
    user.user_principal_name => {
      id        = user.id
      object_id = user.object_id
      mail      = user.mail
    }
  }
}

output "groups" {
  value = {
    for group in azuread_group.group :
    group.name => {
      members = group.members
      owners  = group.owners
    }
  }
}

output "role_definitions" {
  value = {
    for role in azurerm_role_definition.role :
    role.name => {
      role_definition_id = role.id
      scope              = role.scope
    }
  }
}

output "service_principals_role_assignments" {
  value = {
    for assignment in azurerm_role_assignment.sp_assignment :
    assignment.name => {
      id   = assignment.id
      type = assignment.principal_type
    }
  }
}

output "users_role_assignments" {
  value = {
    for assignment in azurerm_role_assignment.users_assignment :
    assignment.name => {
      id   = assignment.id
      type = assignment.principal_type
    }
  }
}