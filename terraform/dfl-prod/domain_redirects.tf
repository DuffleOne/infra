locals {
  domain_redirects = [
    {
      name     = "staff.tf",
      redirect = "https://github.com/cuvva/cuvva/blob/master/infra/aws-acc-root/staff.tf",
    },
    {
      name     = "gflix.in",
      redirect = "https://georgeflix.uk",
    },
  ]
}

module "domain_redirect" {
  for_each = { for domain in local.domain_redirects : domain.name => domain }

  source = "../modules/domain_redirect"

  domain      = each.value.name
  redirect_to = each.value.redirect
}
