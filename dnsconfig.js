/*
   dnsconfig.js: dnscontrol configuration file for DUFFLEMAN.
*/

var REG_NONE = NewRegistrar('none', 'NONE');
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
	CNAME('overseerr.i', 'containers.ext.dfl.mn.'),
	CNAME('radarr.i', 'containers.ext.dfl.mn.'),
	CNAME('sonarr.i', 'containers.ext.dfl.mn.'),

	// External services
	CNAME('auth', 'doproxy.k.dfl.mn.'),
	CNAME('dash', 'doproxy.k.dfl.mn.'),
	CNAME('draw', 'doproxy.k.dfl.mn.'),
	CNAME('status', 'doproxy.k.dfl.mn.'),
	CNAME('valheim', 'containers.ext.dfl.mn.'),
	CNAME('wg', 'wireguard.ext.dfl.mn.'),

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
