module "d212_house" {
  source = "../modules/domain"

  domain     = "212.house"
  domain_key = "MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAmxl7gmIOYXDhi3M1RhbDmRFO0mIJTm3T24QqcKPeBsgKAjB4EjkW48xOqx318gE1DrDTkpbDZrBN6+MpL8e9IpaeF91Wg03c8Iyx2m0r/geQ4KMMycPB7pf466eZMbZ0XzluNqUsRM/YrdTfBHJ0mVTjBwhCBbGslL+asO4lLnCpyCFFP2tVhTeUeq0Ub90wvir7VG4+KGP4n5DuM352xFbLZO88Mr8FjNDmBOUBXVScw8lmI9Xym8daxuxkkcb++SWIvEKItsdA+TaO42ThaBkBmRJzU0SfVuBkQV9myDlgrnjSjWWwBf+FgbFylNkZGqYRWS9vhfzXFyFOwwJZ0wIDAQAB"
}

resource "cloudflare_record" "printer" {
  zone_id = module.d212_house.zone_id
  name    = "printer"
  type    = "A"
  value   = "192.168.255.228"
  proxied = false
}
