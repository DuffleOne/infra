/*
   dnsconfig.js: dnscontrol configuration file for DUFFLEMAN.
*/

var REG_NONE = NewRegistrar('none', 'NONE');
var REG_GHANDI = NewRegistrar("gandi", "GANDI_V5");
var cloudflare = NewDnsProvider('cloudflare', 'CLOUDFLAREAPI', {
	manage_redirects: true,
});

D('dfl.mn', REG_NONE, DnsProvider(cloudflare),
	ALIAS('@', 'doproxy.k.dfl.mn.'),
	CNAME('www', 'dfl.mn.', CF_PROXY_ON),

	// direct open domain requests to stable S3 bucket
	// if k8s dies, it shouldn't affect the domain
	CF_REDIRECT('*dfl.mn/', 'https://duffleman.co.uk'),

	// Avoid WWW
	CF_REDIRECT('www.dfl.mn/*', 'https://dfl.mn/$1'),

	// Internal hosts
	A('containers.int', '192.168.254.110'),
	A('galactus.int', '192.168.254.5'),
	A('wireguard.int', '192.168.254.22'),

	// External hosts
	A('containers.ext', '217.38.231.169'),
	A('galactus.ext', '217.38.231.169'),
	A('wireguard.ext', '217.38.231.169'),

	// k8s hosts
	A('doproxy.k', '46.101.65.145'),

	// Internal services
	CNAME('bazarr.i', 'containers.ext.dfl.mn.'),
	CNAME('deluge.i', 'containers.ext.dfl.mn.'),
	CNAME('duplicati.i', 'containers.ext.dfl.mn.'),
	CNAME('jackett.i', 'containers.ext.dfl.mn.'),
	CNAME('radarr.i', 'containers.ext.dfl.mn.'),
	CNAME('sonarr.i', 'containers.ext.dfl.mn.'),

	// External services
	CNAME('auth', 'doproxy.k.dfl.mn.'),
	CNAME('dash', 'doproxy.k.dfl.mn.'),
	CNAME('draw', 'doproxy.k.dfl.mn.'),
	CNAME('status', 'doproxy.k.dfl.mn.'),
	CNAME('valheim', 'containers.ext.dfl.mn.'),
	CNAME('wg', 'wireguard.ext.dfl.mn.'),
	CNAME('wiki', 'doproxy.k.dfl.mn.'),

	// Mail
	MX('@', 1, 'aspmx.l.google.com.'),
	MX('@', 5, 'alt1.aspmx.l.google.com.'),
	MX('@', 5, 'alt2.aspmx.l.google.com.'),
	MX('@', 10, 'alt3.aspmx.l.google.com.'),
	MX('@', 10, 'alt4.aspmx.l.google.com.'),

	// SES
	MX('ses', 10, 'inbound-smtp.eu-west-1.amazonaws.com.'),
	TXT('_amazonses.ses', 'VEJgs8FdY5WGi/Sg8EjPUlR+r5wbJvN4vyXZiab1zjQ='),
	CNAME('jmv3ey5brt6wp64aquv7e6pmgj3m2zfi._domainkey.ses', 'jmv3ey5brt6wp64aquv7e6pmgj3m2zfi.dkim.amazonses.com.'),
	CNAME('oapkcsxs37goqvx4jydjubagqml6544f._domainkey.ses', 'oapkcsxs37goqvx4jydjubagqml6544f.dkim.amazonses.com.'),
	CNAME('ysimhqy4t3riv543ehlzcjlarf7nkvrf._domainkey.ses', 'ysimhqy4t3riv543ehlzcjlarf7nkvrf.dkim.amazonses.com.'),

	TXT('@', 'v=spf1 include:_spf.google.com ~all'),
	TXT('@', 'keybase-site-verification=5iWvlQacJDPK1-1tMxiRwdUeNv7eFEdIDqyJT2xqSLY'),
	TXT('google._domainkey', 'v=DKIM1; k=rsa; p=MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQDPMzaX0DMLvdwFg5j6ifkunYhkn0JvMKghrlzR5r6BelB9cVV3w72ncqsOiMHGNh8pL98n6x9iz5Q4fmU9aTXUoyx4xQmuuR/3armuIKEr88uox4ArZy4TWR8OuDKuMlezt4WwCOUdyqxnqUgpd6gOZL20TY81PB8Zd3EG93Yv8QIDAQAB', AUTOSPLIT)
)

D('212.house', REG_NONE, DnsProvider(cloudflare),
	A('printer', '192.168.255.228'),

	// Mail
	MX('@', 1, 'aspmx.l.google.com.'),
	MX('@', 5, 'alt1.aspmx.l.google.com.'),
	MX('@', 5, 'alt2.aspmx.l.google.com.'),
	MX('@', 10, 'alt3.aspmx.l.google.com.'),
	MX('@', 10, 'alt4.aspmx.l.google.com.'),

	TXT('@', 'v=spf1 include:_spf.google.com ~all'),
	TXT('google._domainkey', 'v=DKIM1; k=rsa; p=MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAmxl7gmIOYXDhi3M1RhbDmRFO0mIJTm3T24QqcKPeBsgKAjB4EjkW48xOqx318gE1DrDTkpbDZrBN6+MpL8e9IpaeF91Wg03c8Iyx2m0r/geQ4KMMycPB7pf466eZMbZ0XzluNqUsRM/YrdTfBHJ0mVTjBwhCBbGslL+asO4lLnCpyCFFP2tVhTeUeq0Ub90wvir7VG4+KGP4n5DuM352xFbLZO88Mr8FjNDmBOUBXVScw8lmI9Xym8daxuxkkcb++SWIvEKItsdA+TaO42ThaBkBmRJzU0SfVuBkQV9myDlgrnjSjWWwBf+FgbFylNkZGqYRWS9vhfzXFyFOwwJZ0wIDAQAB', AUTOSPLIT)
)

D('duffleman.co.uk', REG_NONE, DnsProvider(cloudflare),
	ALIAS('@', 'duffleman.co.uk.s3-website-eu-west-1.amazonaws.com.', CF_PROXY_ON),
	CNAME('www', 'duffleman.co.uk.', CF_PROXY_ON),
	CNAME('s3', 's3.amazonaws.com.'),

	// Avoid WWW
	CF_REDIRECT('www.duffleman.co.uk/*', 'https://duffleman.co.uk/$1'),

	// Mail
	MX('@', 1, 'aspmx.l.google.com.'),
	MX('@', 5, 'alt1.aspmx.l.google.com.'),
	MX('@', 5, 'alt2.aspmx.l.google.com.'),
	MX('@', 10, 'alt3.aspmx.l.google.com.'),
	MX('@', 10, 'alt4.aspmx.l.google.com.'),

	TXT('@', 'v=spf1 include:_spf.google.com ~all'),
	TXT('@', 'keybase-site-verification=2zA8_3TqWj5I8W56tdkAGhdBUoW9_slEBtzKohqF2AQ'),
	TXT('google._domainkey', 'v=DKIM1; k=rsa; p=MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQCt9kMz3boousXY4IUknZfeYvhqCixCZtXidnF0deacOC7DAFCskqPu+J/00IHcCx7fiAHC08yuHna3xW30cPzwTcTRI+7e7CqYrH9ltvgMXtTZgnqPzfvGRRCoj8uFb/nGVzOXjRFtegvIClqekc6VIU0g+sQ/kkAa4fk8AwSjUQIDAQAB', AUTOSPLIT)
)

D('duffleman.dev', REG_NONE, DnsProvider(cloudflare),
	A('@', '1.2.3.4', CF_PROXY_ON),
	A('www', '1.2.3.4', CF_PROXY_ON),

	// push everything over to duffleman.co.uk
	CF_REDIRECT('*duffleman.dev/*', 'https://duffleman.co.uk/$2'),

	// Mail
	MX('@', 1, 'aspmx.l.google.com.'),
	MX('@', 5, 'alt1.aspmx.l.google.com.'),
	MX('@', 5, 'alt2.aspmx.l.google.com.'),
	MX('@', 10, 'aspmx2.googlemail.com.'),
	MX('@', 10, 'aspmx3.googlemail.com.'),

	TXT('@', 'v=spf1 include:_spf.google.com ~all'),
	TXT('@', 'keybase-site-verification=r4duEmobKVLUbzBicnGTkjX7xQwYY9aN9eoQHKMVl8s'),
	TXT('google._domainkey', 'v=DKIM1; k=rsa; p=MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAsc0Yj+RLfT+MirS/ZpLyRxXpHfdxZYRGbK5zS+X4ASGVIIZLA9EdK7qkNnNDxb6ID6wdx9Z52H/DRsOwhG1g21MA2SVL+43d41gdbAjAussF1iA6T/UD7oGWutSS9kW3RvFYoYm9NEr9dJmGHj2WiOEunruw+O0gDVyXrdWI2idsx2sTU61yE+RUdPJ/uAMg3Q5rWkWzqW22+eFFgE8MG6we7qPzEbbzg23mDy15UJnqE7kxIrgsfgYbsHb4H2NE6BvKKpqoHJ40W1ozmLaX0EoiCSExzoeb+lsPp/nSiH8ePy65nizzVioNf16sI39Z6v6zn87XVaPri6v5pMDh8QIDAQAB', AUTOSPLIT)
)

D('duffleman.me', REG_NONE, DnsProvider(cloudflare),
	A('@', '1.2.3.4', CF_PROXY_ON),
	A('www', '1.2.3.4', CF_PROXY_ON),

	CF_REDIRECT('*duffleman.me/*', 'https://duffleman.co.uk/$2'),

	MX('@', 1, 'aspmx.l.google.com.'),
	MX('@', 5, 'alt1.aspmx.l.google.com.'),
	MX('@', 5, 'alt2.aspmx.l.google.com.'),
	MX('@', 10, 'aspmx2.googlemail.com.'),
	MX('@', 10, 'aspmx3.googlemail.com.'),

	TXT('@', 'v=spf1 include:_spf.google.com ~all'),
	TXT('@', 'keybase-site-verification=krT8JY9BETiWK8m-QISEHETCJ49WetjrXXDTDHx_sEM'),
	TXT('google._domainkey', 'v=DKIM1; k=rsa; p=MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAsUTL7ILoIQfPJs0w24VA7d3LZBhZ8CoCA1xaQPctFgrDzP/gg1yaTBoH6m9K28OBBeAqRL2hw12AfV358woMQo+aMkOT5ghzNyjdMOoX55uYr/zN9jb30jL5BGf6zNFHK0kd1DLUonI0f+YdJW8bg0JWt2ftjZoMyL5fni/wnGFA3NtJ9vr/wdhQI+cg9FwPTInTWlAnwauzIqiqzSwSxH+XuLtTbv2uFZ+btcSru5QrCm6KHIMlWCOxgMaKgvkzCQPioiryOyAG8kmIDip0LM+Ci+meVbTHpbUBv3IU+4CfcEF3uCvAB1/4qjQm17SxM6y/lt/+pp2Ups15rh1krQIDAQAB', AUTOSPLIT)
)

D('duffleman.uk', REG_NONE, DnsProvider(cloudflare),
	A('@', '1.2.3.4', CF_PROXY_ON),
	A('www', '1.2.3.4', CF_PROXY_ON),

	CF_REDIRECT('*duffleman.uk/*', 'https://duffleman.co.uk/$2'),

	MX('@', 1, 'aspmx.l.google.com.'),
	MX('@', 5, 'alt1.aspmx.l.google.com.'),
	MX('@', 5, 'alt2.aspmx.l.google.com.'),
	MX('@', 10, 'aspmx2.googlemail.com.'),
	MX('@', 10, 'aspmx3.googlemail.com.'),

	TXT('@', 'v=spf1 include:_spf.google.com ~all'),
	TXT('_keybase', 'keybase-site-verification=Pfkhz4_vVBGKCYWh30PAp87lz5f-gIiAmes-jKMg96Q'),
	TXT('google._domainkey', 'v=DKIM1; k=rsa; p=MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAo2OgbsykUScp+kl3WrXmmKU85aX7dwd34pi7ghiKlSmJzn7roPX7IUwJpcaW18nHPW3tQi7T4yMzIMGn+4gZsUy4+36tXGIVpNSZ1En7KGKAgD2dB2g/NOQM4WJhBXETf+bhK188RJfVphlq3k4UtrGheTHermFyjqUWRSgxx1wIW1OdB0RTepppZw1T028TM8Cd2FokbRoqLnKWov5nlhTnh+MypPSLuL4dwN61DzV8xCXSeatuGrHqu1pVsDrufWdE226qD0puB70COIk1XQ+0PcJ/siP/rWrxhxVrhF7nZIQjZ00Ow7WudQPu6qxxuxpSe7NluPJv5obvuNyckwIDAQAB', AUTOSPLIT)
)

D('georgeflix.uk', REG_NONE, DnsProvider(cloudflare),
	ALIAS('@', 'georgeflix.uk.s3-website-eu-west-1.amazonaws.com.', CF_PROXY_ON),
	CNAME('www', 'georgeflix.uk.', CF_PROXY_ON),

	// Avoid WWW
	CF_REDIRECT('www.georgeflix.uk/*', 'https://georgeflix.uk/$1'),

	// External services
	CNAME('plex', 'galactus.ext.dfl.mn.'),
	CNAME('requests', 'containers.ext.dfl.mn.'),
	CNAME('sync', 'doproxy.k.dfl.mn.'),

	// Mail
	MX('@', 1, 'aspmx.l.google.com.'),
	MX('@', 5, 'alt1.aspmx.l.google.com.'),
	MX('@', 5, 'alt2.aspmx.l.google.com.'),
	MX('@', 10, 'aspmx2.googlemail.com.'),
	MX('@', 10, 'aspmx3.googlemail.com.'),

	TXT('@', 'v=spf1 include:_spf.google.com ~all'),
	TXT('google._domainkey', 'v=DKIM1; k=rsa; p=MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAw9uQ00gCmDmfYAlSVecQ+SaCNFEhSFcnjrS1hWH3OZvq3MSf7tuyqpHI2mLagsKY12tVLOJWX9mFAZkN77dT59A1GskdHKeUllnYkG6jh0AUD9TIizKMvaTwnwm175NerFKmBK67P6LyzdxyoHsflFGdVcwZOyBRzSR5dGk5vgo5LMGNxSmyWFoOe7IxKHO8C77M0eJ7J85mReN/l367UG7S6vusTfgF8+cDv78acq7QKWhlERggX2S8pHVRZ2Irp6Tdsv3qaC6Uaiy8Kdgy57+rILFyFR4GDA1gMFWPrSAAcBQjFCllOwyrwy6PJqOo3oLETDm2bLMg8OJIvrOxrQIDAQAB', AUTOSPLIT)
)

D('gflix.in', REG_NONE, DnsProvider(cloudflare),
	A('@', '1.2.3.4', CF_PROXY_ON),
	A('www', '1.2.3.4', CF_PROXY_ON),

	// Avoid WWW
	CF_REDIRECT('*gflix.in/*', 'https://georgeflix.uk/$2')
)

D('georgemiller.me.uk', REG_NONE, DnsProvider(cloudflare),
	A('@', '1.2.3.4', CF_PROXY_ON),
	A('www', '1.2.3.4', CF_PROXY_ON),

	// push everything over to duffleman.co.uk
	CF_REDIRECT('*georgemiller.me.uk/*', 'https://duffleman.co.uk/$2'),

	// Mail
	MX('@', 1, 'aspmx.l.google.com.'),
	MX('@', 5, 'alt1.aspmx.l.google.com.'),
	MX('@', 5, 'alt2.aspmx.l.google.com.'),
	MX('@', 10, 'aspmx2.googlemail.com.'),
	MX('@', 10, 'aspmx3.googlemail.com.'),

	TXT('@', 'v=spf1 include:_spf.google.com ~all'),
	TXT('@', 'keybase-site-verification=gF4poEcsqEj-FS95jTRY4_LPoEhuf9MATRzlvHoUIhE'),
	TXT('google._domainkey', 'v=DKIM1; k=rsa; p=MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAlzRF0eIiHqrHrdqIHxZCW1+MV49Dpp/rHoGs2OiCiQzrCn14FelwAo7x9Q51kvtSj4GoukdkluWp3KX7PnZHFfjepZwBaK+yxcegPHg0cNwKqdW5dYQEJBZ4RRLYDTvQbCqh9HzZPWDUjjBMZeIE890peua4Y73Ml2Xb2gqpWXLd+WT/qjesR3VJfpdT4Aq/y3kcJa02rdUZSqhffBrZOdhOfVdh2VhTleaRgYVRkAYU7YKj+rieo9Swbc/hsQmAHzHLlK3bwt62oMxq2EsB1qakb2xhKLJfO6eVVF4ObFU682sBBnOncJuMMUwtw2nJlX9mXiOboGyBF3SuZwsSYwIDAQAB', AUTOSPLIT)
)

D('tflga.me', REG_NONE, DnsProvider(cloudflare),
	ALIAS('@', 'tflga.me.s3-website-eu-west-1.amazonaws.com.', CF_PROXY_ON),
	CNAME('api', 'doproxy.k.dfl.mn.'),
	CNAME('www', 'tflga.me.', CF_PROXY_ON),

	// Avoid WWW
	CF_REDIRECT('www.tflga.me/*', 'https://tflga.me/$1'),

	// Mail
	MX('@', 1, 'aspmx.l.google.com.'),
	MX('@', 5, 'alt1.aspmx.l.google.com.'),
	MX('@', 5, 'alt2.aspmx.l.google.com.'),
	MX('@', 10, 'alt3.aspmx.l.google.com.'),
	MX('@', 10, 'alt4.aspmx.l.google.com.'),

	TXT('@', 'v=spf1 include:_spf.google.com ~all'),
	TXT('google._domainkey', 'v=DKIM1; k=rsa; p=MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAn+feSRV/Tt+auY4L/irlzTUO9UQaYpqcwbSmQ4F4hOqKrJ5xReg17XjZiuEItTrprYkqPEne3rm6MsBoiKAKlxUwEgQpsW1r6qTlCI/s0lY6RWMAD6QkazyV+BKHqozzOeirwXlzTDaRBeSSOP6Pdkceb4tWtfjBavLH6nWbKdlm2nTfhEF9AkAnN3QwCpjcD715T1nXCF3EvXxZdAZs7OuYAYfyutAIANI36nmrbdKgj8al7QPotZbHJJCL+t1F9mX8YpjfmWJgXRD1+VD98tnItMglDyaSLTW5paJeP1VwbOockqYGLArr3MOrf36wXk5e7HW9DjYJxmvoLIhN7QIDAQAB', AUTOSPLIT)
)

D('staff.tf', REG_GHANDI, DnsProvider(cloudflare),
	A('@', '1.2.3.4', CF_PROXY_ON),
	A('www', '1.2.3.4', CF_PROXY_ON),

	CF_REDIRECT('*staff.tf/*', 'https://github.com/cuvva/cuvva/blob/master/infra/aws-acc-root/staff.tf')
)
