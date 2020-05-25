# note

Annoyingly, heimdall does not support using Postres natively, only sqlite. So if you find the whole app loses context, run the following commands:

```bash
rm /var/www/localhost/heimdall/.env

ln -s /k8s-config/env /var/www/localhost/heimdall/.env
```
