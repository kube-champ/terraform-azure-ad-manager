resource "azuread_application" "app" {
  for_each = var.applications

  name                       = each.key
  homepage                   = each.value.homepage
  identifier_uris            = each.value.identifier_uris
  reply_urls                 = each.value.reply_urls
  available_to_other_tenants = each.value.available_to_other_tenants
  oauth2_allow_implicit_flow = each.value.oauth2_allow_implicit_flow
  type                       = each.value.type

  dynamic "required_resource_access" {
    for_each = each.value.required_resource_access
    
    content {
      resource_app_id = required_resource_access.value.resource_app_id


      dynamic "resource_access" {
        for_each = required_resource_access.value.resource_access

        content {
          id = resource_access.value.id
          type = resource_access.value.type
        }
      }
    }
  }
}