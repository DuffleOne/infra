# infra

## dns

Managed by [DNSControl](https://stackexchange.github.io/dnscontrol/). See [`./dnsconfig.js`](./dnsconfig.js) for the configuration. An additional secret is required to run the script.

```bash
dnscontrol push --creds ~/Source/infra-secrets/dnscontrol.json
```

## digital ocean

### services

- [Cachet](https://cachethq.io) - [https://status.dfl.mn](https://status.dfl.mn)
- [dflimg](https://github.com/duffleman/dflimg-go/)
- [SyncLounge](https://synclounge.tv) - [https://sync.georgeflix.uk](https://sync.georgeflix.uk)

### deployment

Super easy to run this stack. Just deploy all secrets first

```bash
kc apply -f ~/Source/infra-secrets/digitalocean -R
```

Then deploy the stack onto any DO managed k8s cluster. Make sure the nginx ingress is installed from their one-click store.

Additionally ensure cert-manager is installed from [these instructions](https://www.digitalocean.com/community/tutorials/how-to-set-up-an-nginx-ingress-with-cert-manager-on-digitalocean-kubernetes#step-2-—-setting-up-the-kubernetes-nginx-ingress-controller) from Digital Ocean.

```bash
kc apply -f ~/Source/infra/digitalocean -R
```

## 212
