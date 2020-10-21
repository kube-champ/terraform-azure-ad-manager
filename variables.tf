variable "users" {
  description = "Azure Active Directory users"

  type = map(object({
    display_name : string
    email : string
    mail_nickname : string
    force_password_change : bool
    account_enabled : bool
  }))
}

variable "groups" {
  description = "Azure AD groups"

  type = map(object({
    description : string
    members : list(string)
    owners : list(string)
  }))
}

variable "applications" {
  description = "Applications to be registered"

  type = map(object({
    homepage : string
    identifier_uris : list(string)
    reply_urls : list(string)
    available_to_other_tenants : bool
    oauth2_allow_implicit_flow : bool
    type : string
    group_membership_claims: string
    required_resource_access: map(object({
      resource_app_id: string
      resource_access: map(object({
        id: string
        type: string
      }))
    }))
  }))
}

variable "service_principals" {
  description = "Service principals to be created"

  type = map(object({
    description : string
    application_name : string
    app_role_assignment_required : bool
    end_date : string
    tags : list(string)
  }))
}

variable "role_definitions" {
  description = "Custom role definitions"

  type = map(object({
    scope : string
    description : string
    permissions : object({
      actions : list(string)
      not_actions : list(string)
    })
    assignable_scopes : list(string)
  }))
}

variable "service_principals_role_assignments" {
  description = "Role assignments for service principals"

  type = map(object({
    scope : string
    role_name : string
    principal_name : string
  }))
}

variable "users_role_assignments" {
  description = "Role assignments for ad users"

  type = map(object({
    scope : string
    role_name : string
    principal_name : string
  }))
}