/*
   dnsconfig.js: dnscontrol configuration file for DUFFLEMAN.
*/

var REG_NONE = NewRegistrar('none', 'NONE');
var cloudflare = NewDnsProvider('cloudflare', 'CLOUDFLAREAPI', {
	manage_redirects: true,
});

D("dfl.mn", REG_NONE, DnsProvider(cloudflare),
	ALIAS('@', 'zero-damage.do.dfl.mn.'),
	CNAME('www', 'dfl.mn.'),

	// Internal hosts
	A('ant-man.int', '192.168.254.148'),
	A('galactus.int', '192.168.254.5'),
	A('wireguard.int', '192.168.254.22'),

	// External hosts
	A('mission.h', '212.140.154.25'),

	// Internal services
	CNAME('deluge.int', 'ant-man.int.dfl.mn.'),
	CNAME('duplicati.int', 'ant-man.int.dfl.mn.'),
	CNAME('jackett.int', 'ant-man.int.dfl.mn.'),
	CNAME('netdata.int', 'ant-man.int.dfl.mn.'),
	CNAME('ombi.int', 'ant-man.int.dfl.mn.'),
	CNAME('radarr.int', 'ant-man.int.dfl.mn.'),
	CNAME('sonarr.int', 'ant-man.int.dfl.mn.'),

	// External services
	CNAME('heimdall', 'zero-damage.do.dfl.mn.'),
	CNAME('ombi', 'zero-damage.do.dfl.mn.'),
	CNAME('pihole', 'zero-damage.do.dfl.mn.'),
	CNAME('plex', 'mission.h.dfl.mn.'),
	CNAME('status', 'zero-damage.do.dfl.mn.'),
	CNAME('wg', 'mission.h.dfl.mn.'),

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

	// NS delegation
	NS('cuv', 'ns1.digitalocean.com.'),
	NS('cuv', 'ns2.digitalocean.com.'),
	NS('cuv', 'ns3.digitalocean.com.'),
	NS('do', 'ns1.digitalocean.com.'),
	NS('do', 'ns2.digitalocean.com.'),
	NS('do', 'ns3.digitalocean.com.'),

	TXT('@', 'v=spf1 include:_spf.google.com ~all'),
	TXT('@', 'keybase-site-verification=5iWvlQacJDPK1-1tMxiRwdUeNv7eFEdIDqyJT2xqSLY'),
	TXT('google._domainkey', 'v=DKIM1; k=rsa; p=MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQDPMzaX0DMLvdwFg5j6ifkunYhkn0JvMKghrlzR5r6BelB9cVV3w72ncqsOiMHGNh8pL98n6x9iz5Q4fmU9aTXUoyx4xQmuuR/3armuIKEr88uox4ArZy4TWR8OuDKuMlezt4WwCOUdyqxnqUgpd6gOZL20TY81PB8Zd3EG93Yv8QIDAQAB')
)

D("duffleman.co.uk", REG_NONE, DnsProvider(cloudflare),
	ALIAS('@', 'duffleman.co.uk.s3-website-eu-west-1.amazonaws.com.', CF_PROXY_ON),
	CNAME('www', 'duffleman.co.uk.', CF_PROXY_ON),
	CNAME('s3', 's3.amazonaws.com.'),

	// Avoid WWW
	CF_REDIRECT("www.duffleman.co.uk/*", "https://duffleman.co.uk/$1"),

	// Mail
	MX('@', 1, 'aspmx.l.google.com.'),
	MX('@', 5, 'alt1.aspmx.l.google.com.'),
	MX('@', 5, 'alt2.aspmx.l.google.com.'),
	MX('@', 10, 'alt3.aspmx.l.google.com.'),
	MX('@', 10, 'alt4.aspmx.l.google.com.'),

	TXT('@', 'v=spf1 include:_spf.google.com ~all'),
	TXT('@', 'keybase-site-verification=2zA8_3TqWj5I8W56tdkAGhdBUoW9_slEBtzKohqF2AQ'),
	TXT('google._domainkey', 'v=DKIM1; k=rsa; p=MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQCt9kMz3boousXY4IUknZfeYvhqCixCZtXidnF0deacOC7DAFCskqPu+J/00IHcCx7fiAHC08yuHna3xW30cPzwTcTRI+7e7CqYrH9ltvgMXtTZgnqPzfvGRRCoj8uFb/nGVzOXjRFtegvIClqekc6VIU0g+sQ/kkAa4fk8AwSjUQIDAQAB')
)

D("georgeflix.uk", REG_NONE, DnsProvider(cloudflare),
	ALIAS('@', 'georgeflix.uk.s3-website-eu-west-1.amazonaws.com.', CF_PROXY_ON),
	CNAME('www', 'georgeflix.uk.', CF_PROXY_ON),

	// Avoid WWW
	CF_REDIRECT("www.georgeflix.uk/*", "https://georgeflix.uk/$1"),

	// Mail
	MX('@', 1, 'aspmx.l.google.com.'),
	MX('@', 5, 'alt1.aspmx.l.google.com.'),
	MX('@', 5, 'alt2.aspmx.l.google.com.'),
	MX('@', 10, 'aspmx2.googlemail.com.'),
	MX('@', 10, 'aspmx3.googlemail.com.'),

	TXT('@', 'v=spf1 include:_spf.google.com ~all')
)

D("duffleman.dev", REG_NONE, DnsProvider(cloudflare),
	A('@', '1.2.3.4', CF_PROXY_ON),
	A('www', '1.2.3.4', CF_PROXY_ON),

	// push everything over to duffleman.co.uk
	CF_REDIRECT("*duffleman.dev/*", "https://duffleman.co.uk/$2"),

	// Mail
	MX('@', 1, 'aspmx.l.google.com.'),
	MX('@', 5, 'alt1.aspmx.l.google.com.'),
	MX('@', 5, 'alt2.aspmx.l.google.com.'),
	MX('@', 10, 'aspmx2.googlemail.com.'),
	MX('@', 10, 'aspmx3.googlemail.com.'),

	TXT('@', 'v=spf1 include:_spf.google.com ~all'),
	TXT('@', 'keybase-site-verification=r4duEmobKVLUbzBicnGTkjX7xQwYY9aN9eoQHKMVl8s'),
	TXT('google._domainkey', 'v=DKIM1; k=rsa; p=MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAsc0Yj+RLfT+MirS/ZpLyRxXpHfdxZYRGbK5zS+X4ASGVIIZLA9EdK7qkNnNDxb6ID6wdx9Z52H/DRsOwhG1g21MA2SVL+43d41gdbAjAussF1iA6T/UD7oGWutSS9kW3RvFYoYm9NEr9dJmGHj2WiOEunruw+O0gDVyXrdWI2idsx2sTU61yE+RUdPJ/uAMg3" "Q5rWkWzqW22+eFFgE8MG6we7qPzEbbzg23mDy15UJnqE7kxIrgsfgYbsHb4H2NE6BvKKpqoHJ40W1ozmLaX0EoiCSExzoeb+lsPp/nSiH8ePy65nizzVioNf16sI39Z6v6zn87XVaPri6v5pMDh8QIDAQAB')
)

D("georgemiller.me.uk", REG_NONE, DnsProvider(cloudflare),
	A('@', '1.2.3.4', CF_PROXY_ON),
	A('www', '1.2.3.4', CF_PROXY_ON),

		// push everything over to duffleman.co.uk
	CF_REDIRECT("*georgemiller.me.uk/*", "https://duffleman.co.uk/$2"),

	// Mail
	MX('@', 1, 'aspmx.l.google.com.'),
	MX('@', 5, 'alt1.aspmx.l.google.com.'),
	MX('@', 5, 'alt2.aspmx.l.google.com.'),
	MX('@', 10, 'aspmx2.googlemail.com.'),
	MX('@', 10, 'aspmx3.googlemail.com.'),

	TXT('@', 'v=spf1 include:_spf.google.com ~all'),
	TXT('@', 'keybase-site-verification=gF4poEcsqEj-FS95jTRY4_LPoEhuf9MATRzlvHoUIhE'),
	TXT('google._domainkey', 'v=DKIM1; k=rsa; p=MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAvTs4UzqTndwtHddNLp65ZiW12GlEiibAvqCdqeTnj/dDPO4PomLH+nsjF+b/q2adl+NOxtKe7DvZJbSxCEIfyHqE9xEowVyd50WiKB8JEkpW74v35Pe2qFVS6q/DY7FrLRNDRwwY6VZS3mjSOc/vc5vttuSQOW7YyOshaChiqoWndPUO9NN72W9ozhqqmstjZ6hYExKnHD2ZwFCAniehn9P+QkOANRjlIEIB2rZjoBm1KQlxTWEM95+NB1RjkZVozHtjIE2AxjiQNGvX/rX/m9pIUjekquLnHaQgcW7VUa61GdH3Q9ZItxz9BXkyN+AIMAp3Gau9ga6KNmi9niKs7QIDAQAB')
)

D("duffleman.uk", REG_NONE, DnsProvider(cloudflare),
	A('@', '1.2.3.4', CF_PROXY_ON),
	A('www', '1.2.3.4', CF_PROXY_ON),

	CF_REDIRECT("*duffleman.uk/*", "https://duffleman.co.uk/$2"),

	MX('@', 1, 'aspmx.l.google.com.'),
	MX('@', 5, 'alt1.aspmx.l.google.com.'),
	MX('@', 5, 'alt2.aspmx.l.google.com.'),
	MX('@', 10, 'aspmx2.googlemail.com.'),
	MX('@', 10, 'aspmx3.googlemail.com.'),

	TXT('@', 'v=spf1 include:_spf.google.com ~all'),
	TXT('_keybase', 'keybase-site-verification=Pfkhz4_vVBGKCYWh30PAp87lz5f-gIiAmes-jKMg96Q'),
	TXT('google._domainkey', 'v=DKIM1; k=rsa; p=MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAo2OgbsykUScp+kl3WrXmmKU85aX7dwd34pi7ghiKlSmJzn7roPX7IUwJpcaW18nHPW3tQi7T4yMzIMGn+4gZsUy4+36tXGIVpNSZ1En7KGKAgD2dB2g/NOQM4WJhBXETf+bhK188RJfVphlq3k4UtrGheTHermFyjqUWRSgxx1wIW1OdB0RTepppZw1T028TM8Cd2FokbRoqLnKWov5nlhTnh+MypPSLuL4dwN61DzV8xCXSeatuGrHqu1pVsDrufWdE226qD0puB70COIk1XQ+0PcJ/siP/rWrxhxVrhF7nZIQjZ00Ow7WudQPu6qxxuxpSe7NluPJv5obvuNyckwIDAQAB')
)
