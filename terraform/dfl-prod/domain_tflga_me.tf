module "tflga_me" {
  source = "../modules/domain"

  domain     = "tflga.me"
  domain_key = "MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAn+feSRV/Tt+auY4L/irlzTUO9UQaYpqcwbSmQ4F4hOqKrJ5xReg17XjZiuEItTrprYkqPEne3rm6MsBoiKAKlxUwEgQpsW1r6qTlCI/s0lY6RWMAD6QkazyV+BKHqozzOeirwXlzTDaRBeSSOP6Pdkceb4tWtfjBavLH6nWbKdlm2nTfhEF9AkAnN3QwCpjcD715T1nXCF3EvXxZdAZs7OuYAYfyutAIANI36nmrbdKgj8al7QPotZbHJJCL+t1F9mX8YpjfmWJgXRD1+VD98tnItMglDyaSLTW5paJeP1VwbOockqYGLArr3MOrf36wXk5e7HW9DjYJxmvoLIhN7QIDAQAB"
}

resource "cloudflare_record" "tflgame_root" {
  zone_id = module.tflga_me.zone_id
  name    = module.tflga_me.domain
  type    = "CNAME"
  value   = "tflga.me.s3-website-eu-west-1.amazonaws.com"
  proxied = true
}

resource "cloudflare_record" "tflgame_api" {
  zone_id = module.tflga_me.zone_id
  name    = "api"
  type    = "CNAME"
  value   = "doproxy.k.dfl.mn"
  proxied = false
}
