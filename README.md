# infra

## dns

Managed by [DNSControl](https://stackexchange.github.io/dnscontrol/). See [`./dnsconfig.js`](./dnsconfig.js) for the configuration. An additional secret is required to run the script.

```bash
dnscontrol push --creds ~/Source/infra-secrets/dnscontrol.json
```

## digital ocean

### services

* [Cachet](https://cachethq.io) - [https://status.dfl.mn](https://status.dfl.mn)
* [dflimg](https://github.com/duffleman/dflimg-go/) - [https://dfl.mn/{code}](https://dfl.mn/:hello)
* [SyncLounge](https://synclounge.tv) - [https://sync.georgeflix.uk](https://sync.georgeflix.uk)
* [WikiJS](https://wiki.js.org) - [https://wiki.dfl.mn](https://wiki.dfl.mn)
* [TFLGame](https://github.com/duffleman/tflgame-go) - [https://api.tflga.me](https://api.tflga.me)

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

The host at 212 runs a single node portainer instance as Docker Swarm. It's entirely manual because of the dependancy that all containers running on-premise require filesystem access, and most of them require access to the NAS where media content is hosted.
