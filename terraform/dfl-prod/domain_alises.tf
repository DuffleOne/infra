locals {
  domain_aliases = [
    {
      name    = "duffleman.co.uk",
      key     = "MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQCt9kMz3boousXY4IUknZfeYvhqCixCZtXidnF0deacOC7DAFCskqPu+J/00IHcCx7fiAHC08yuHna3xW30cPzwTcTRI+7e7CqYrH9ltvgMXtTZgnqPzfvGRRCoj8uFb/nGVzOXjRFtegvIClqekc6VIU0g+sQ/kkAa4fk8AwSjUQIDAQAB",
      keybase = "2zA8_3TqWj5I8W56tdkAGhdBUoW9_slEBtzKohqF2AQ",
    },
    {
      name    = "duffleman.dev",
      key     = "MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAsc0Yj+RLfT+MirS/ZpLyRxXpHfdxZYRGbK5zS+X4ASGVIIZLA9EdK7qkNnNDxb6ID6wdx9Z52H/DRsOwhG1g21MA2SVL+43d41gdbAjAussF1iA6T/UD7oGWutSS9kW3RvFYoYm9NEr9dJmGHj2WiOEunruw+O0gDVyXrdWI2idsx2sTU61yE+RUdPJ/uAMg3Q5rWkWzqW22+eFFgE8MG6we7qPzEbbzg23mDy15UJnqE7kxIrgsfgYbsHb4H2NE6BvKKpqoHJ40W1ozmLaX0EoiCSExzoeb+lsPp/nSiH8ePy65nizzVioNf16sI39Z6v6zn87XVaPri6v5pMDh8QIDAQAB",
      keybase = "r4duEmobKVLUbzBicnGTkjX7xQwYY9aN9eoQHKMVl8s",
    },
    {
      name    = "duffleman.me",
      key     = "MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAsUTL7ILoIQfPJs0w24VA7d3LZBhZ8CoCA1xaQPctFgrDzP/gg1yaTBoH6m9K28OBBeAqRL2hw12AfV358woMQo+aMkOT5ghzNyjdMOoX55uYr/zN9jb30jL5BGf6zNFHK0kd1DLUonI0f+YdJW8bg0JWt2ftjZoMyL5fni/wnGFA3NtJ9vr/wdhQI+cg9FwPTInTWlAnwauzIqiqzSwSxH+XuLtTbv2uFZ+btcSru5QrCm6KHIMlWCOxgMaKgvkzCQPioiryOyAG8kmIDip0LM+Ci+meVbTHpbUBv3IU+4CfcEF3uCvAB1/4qjQm17SxM6y/lt/+pp2Ups15rh1krQIDAQAB",
      keybase = "krT8JY9BETiWK8m-QISEHETCJ49WetjrXXDTDHx_sEM",
    },
    {
      name    = "duffleman.uk",
      key     = "MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAo2OgbsykUScp+kl3WrXmmKU85aX7dwd34pi7ghiKlSmJzn7roPX7IUwJpcaW18nHPW3tQi7T4yMzIMGn+4gZsUy4+36tXGIVpNSZ1En7KGKAgD2dB2g/NOQM4WJhBXETf+bhK188RJfVphlq3k4UtrGheTHermFyjqUWRSgxx1wIW1OdB0RTepppZw1T028TM8Cd2FokbRoqLnKWov5nlhTnh+MypPSLuL4dwN61DzV8xCXSeatuGrHqu1pVsDrufWdE226qD0puB70COIk1XQ+0PcJ/siP/rWrxhxVrhF7nZIQjZ00Ow7WudQPu6qxxuxpSe7NluPJv5obvuNyckwIDAQAB",
      keybase = "Pfkhz4_vVBGKCYWh30PAp87lz5f-gIiAmes-jKMg96Q",
    },
    {
      name    = "georgemiller.me.uk",
      key     = "MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAlzRF0eIiHqrHrdqIHxZCW1+MV49Dpp/rHoGs2OiCiQzrCn14FelwAo7x9Q51kvtSj4GoukdkluWp3KX7PnZHFfjepZwBaK+yxcegPHg0cNwKqdW5dYQEJBZ4RRLYDTvQbCqh9HzZPWDUjjBMZeIE890peua4Y73Ml2Xb2gqpWXLd+WT/qjesR3VJfpdT4Aq/y3kcJa02rdUZSqhffBrZOdhOfVdh2VhTleaRgYVRkAYU7YKj+rieo9Swbc/hsQmAHzHLlK3bwt62oMxq2EsB1qakb2xhKLJfO6eVVF4ObFU682sBBnOncJuMMUwtw2nJlX9mXiOboGyBF3SuZwsSYwIDAQAB",
      keybase = "gF4poEcsqEj-FS95jTRY4_LPoEhuf9MATRzlvHoUIhE",
    },
    {
      name = "lauramiller.me.uk",
    },
  ]
}

module "domain_alias" {
  for_each = { for domain in local.domain_aliases : domain.name => domain }

  source = "../modules/domain_alias"

  domain               = each.value.name
  domain_key           = each.value.key == null ? null : each.value.key
  keybase_verification = each.value.keybase == null ? null : each.value.keybase
}
