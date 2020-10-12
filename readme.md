# Terraform Azure AD
A terraform module that handles Azure AD resources like (applications, users, groups, service principals, role definitions and role assignments)

## Requirements

| Name | Version |
|------|---------|
| terraform | >= 0.13.04 |
| azurerm | =2.20.0 |

## Providers

| Name | Version |
|------|---------|
| azuread | n/a |
| azurerm | =2.20.0 |
| random | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| applications | Applications to be registered | <pre>map(object({<br>    homepage : string<br>    identifier_uris : list(string)<br>    reply_urls : list(string)<br>    available_to_other_tenants : bool<br>    oauth2_allow_implicit_flow : bool<br>    type : string<br>  }))</pre> | n/a | yes |
| groups | Azure AD groups | <pre>map(object({<br>    description : string<br>    members : list(string)<br>    owners : list(string)<br>  }))</pre> | n/a | yes |
| role\_definitions | Custom role definitions | <pre>map(object({<br>    scope : string<br>    description : string<br>    permissions : object({<br>      actions : list(string)<br>      not_actions : list(string)<br>    })<br>    assignable_scopes : list(string)<br>  }))</pre> | n/a | yes |
| service\_principals | Service principals to be created | <pre>map(object({<br>    description : string<br>    application_name : string<br>    app_role_assignment_required : bool<br>    end_date : string<br>    tags : list(string)<br>  }))</pre> | n/a | yes |
| service\_principals\_role\_assignments | Role assignments for service principals | <pre>map(object({<br>    scope : string<br>    role_name : string<br>    principal_name : string<br>  }))</pre> | n/a | yes |
| users | Azure Active Directory users | <pre>map(object({<br>    display_name : string<br>    email : string<br>    mail_nickname : string<br>    force_password_change : bool<br>    account_enabled : bool<br>  }))</pre> | n/a | yes |
| users\_role\_assignments | Role assignments for ad users | <pre>map(object({<br>    scope : string<br>    role_name : string<br>    principal_name : string<br>  }))</pre> | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| applications | n/a |
| groups | n/a |
| role\_definitions | n/a |
| service\_principals | n/a |
| service\_principals\_role\_assignments | n/a |
| users | n/a |
| users\_role\_assignments | n/a |

