module "duffle_one" {
  source = "../modules/domain"

  domain     = "duffle.one"
  domain_key = "MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAnu/frbLrtqCqunp+VEz+WdQeRH+Z+X5WOud6bunGmFXhK8G8wyXPCF2QoMsJX+hMXULUTN57qc9gqAzr5W6AtHNuvmsgloiZDq1pJfJKeKyQgWmn8uhgMFVMbSEUrNqH9dbN6iX8gHt7qyhBKpZs3BIzQ9dw5RQ5eAdAthmVFWQGuz+7uKsuYfizq9cdz+mIxd6nZeqHqIKooPJyPvEG04AwwL3jqUZQaKHhBU+NvEf0nGPhDZq4jGm13pGZBSg8tZ7iFzm1mcWrxxy31Wj4f/juofp0UOy0ZQh2mWNiR5uugs2JWFCRmvN6GKkL7+Tou5FNMLAbtCudeFVRrmCJ3wIDAQAB"
}

resource "cloudflare_record" "root" {
  zone_id = module.duffle_one.zone_id
  name    = module.duffle_one.domain
  type    = "CNAME"
  value   = "duffle.one.s3-website-eu-west-1.amazonaws.com"
  proxied = true
}
