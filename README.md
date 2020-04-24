# infra

This repo contains the kubernetes and DNS configuration files to run my stack, it also contains legacy docker-compose files which are being migrated into k8s.

Some items are not tracked in this repo yet, and possibly may never be.

A lot is missing before you can deploy your own version of this. But this works as reference point to recreate the stack if I ever loose it, or a reference point for others trying to do similar things.

## resources

Although they won't need to match, here are my own resources I use to run the stack.

- 2x Digital Ocean Droplets
  - 1x control-plane node
  - 2x node worker
  - 1x HAProxy LB
- 1x on-site k8s node w/ access to NAS
- 1x Buffalo NAS (112 TB)
- 1x custom-built Windows PC for PLEX

## plans

- ditch all of this in favour of terraform
- run the stack with some kubernetes magic (even if it's a single node)

![It's happening](https://media.giphy.com/media/rl0FOxdz7CcxO/giphy.gif)

## missing configuration from this repo

- PLEX server on "galactus.h.dfl.mn"
- Minecraft server on "minecraft.do.dfl.mn"
- Wireguard connections

## dns

[DNSControl](https://stackexchange.github.io/dnscontrol/) is a tool to push DNS to remote providers, the config file is in the root of this repo, see `dnsconfig.js`.

1. Install [DNSControl](https://stackexchange.github.io/dnscontrol/)
2. [Setup credentials](https://stackexchange.github.io/dnscontrol/providers/cloudflare)
3. Run `dnscontrol preview` to see what it'll do
4. Run `dnscontrol push` to build the records

## hosts

For each K8s node, run the scripts:

- `./k8s-support/provision/bash.sh`
- `./k8s-support/kube-node.sh`

Then have them join the cluster. Ensure to label them appropriately so any software that requires access to the NAS can access it.

## hosts (legacy)

Two hosts are referenced: ant-man and zero-damage. ant-man must run on the same network as the PLEX server and it's filesystem, zero-damage can run anywhere, but has a wireguard connection to ant-man.

To replicate them:

1. Install docker
2. Create a swarm cluster (they are each the only member of their cluster)
3. Install [portainer](https://www.portainer.io/installation/), specifically see the swarm installation instructions
4. Drop in the docker-compose files here as a stack
5. Make sure firewall/port-forwarding is set up for zero-damage
6. Ensure DNS is pointing in the right place
