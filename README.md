# infra

This repo contains the docker-compose files and DNS configuration to run my personal stack.

Some items are not tracked in this repo yet, and possibly may never be.

A lot is missing before you can deploy your own version of this. So the end goal here is to have a repo where you can set up some environment variables, run `terraform apply` and it just works.

Until then, I hope at least it is a good reference point for others setting up docker-compose files for their services.

## plans

- ditch all of this in favour of terraform
- run the stack with some kubernetes magic (even if it's a single node)

## missing

- PLEX server on "galactus.h.dfl.mn"
- Minecraft server on "minecraft.do.dfl.mn"
- Wireguard connection between "ant-man" and "zero-damage"

## dns

[DNSControl](https://stackexchange.github.io/dnscontrol/) is a tool to push DNS to remote providers, the config file is in the root of this repo, see `dnsconfig.js`.

1. Install [DNSControl](https://stackexchange.github.io/dnscontrol/)
2. [Setup credentials](https://stackexchange.github.io/dnscontrol/providers/cloudflare)
3. Run `dnscontrol preview` to see what it'll do
4. Run `dnscontrol push` to build the records

## hosts

Two hosts are referenced: ant-man and zero-damage. ant-man must run on the same network as the PLEX server and it's filesystem, zero-damage can run anywhere, but has a wireguard connection to ant-man.

To replicate them:

1. Install docker
2. Create a swarm cluster (they are each the only member of their cluster)
3. Install [portainer](https://www.portainer.io/installation/), specifically see the swarm installation instructions
4. Drop in the docker-compose files here as a stack
5. Make sure firewall/port-forwarding is set up for zero-damage
6. Ensure DNS is pointing in the right place
