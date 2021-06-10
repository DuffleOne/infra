module "staff_tf" {
  source = "../modules/domain_redirect"

  domain      = "staff.tf"
  redirect_to = "https://github.com/cuvva/cuvva/blob/master/infra/aws-acc-root/staff.tf"
}

module "gflix_in" {
  source = "../modules/domain_redirect"

  domain      = "gflix.in"
  redirect_to = "https://georgeflix.uk"
}
