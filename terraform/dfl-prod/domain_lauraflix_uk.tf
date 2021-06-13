module "lauraflix_uk" {
  source = "../modules/domain"

  domain     = "lauraflix.uk"
  domain_key = "MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEApvdNTCD+6VMVKsV030EY8pn9/qgjY1gUDo758AFto9fOaGO/+k1IN3AGdikLeVhaqlymdIEBbpbsidKXTSFTTVnztBGhr68GqrcMJMS5wpnXFc7hGwxxQsyEdLwwT6zmNXE3Dgp9fc3TOtj9PvMVkpj5ApweCHYqnCdgyD+bY4qZH5mnKnqBOMlOLuD3C9PpOmZ6pLkOkNvB+CAipgjvygnnx3xWWGGGvaESBAmSCOV3rxkvlltfMa1AsjAENSADg2xfMcuaIPJlVdb9UWo8UmKbPA1mhl7g1BMfMA0WUDW9801JsGi2BcI0v0H9QybldSCpMSgiVc8EwdqzOSEW+wIDAQAB"
}

resource "cloudflare_record" "lauraflix_root" {
  zone_id = module.lauraflix_uk.zone_id
  name    = module.lauraflix_uk.domain
  type    = "CNAME"
  value   = "lauraflix.uk.s3-website-eu-west-1.amazonaws.com"
  proxied = true
}

resource "cloudflare_record" "lauraflix_requests" {
  zone_id = module.lauraflix_uk.zone_id
  name    = "requests"
  type    = "CNAME"
  value   = "containers.ext.dfl.mn"
}
