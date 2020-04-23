# useful commands

## init the cluster

```sh
#!/bin/bash

# init the k8s cluster
kubeadm config images pull

# use flannel <- lame
kubeadm init --pod-network-cidr=10.244.0.0/16

# use cilium <- works
kubeadm init --pod-network-cidr=10.217.0.0/16

# weavenet <-  experimenting
kubeadm init --pod-network-cidr=10.32.0.0/12
```

## install the CNI

### Flannel

```sh
# install flannel
kubectl apply -f \
https://raw.githubusercontent.com/coreos/flannel/2140ac876ef134e0ed5af15c65e414cf26827915/Documentation/kube-flannel.yml

# edit the config
kubectl edit configmap -n kube-system kube-flannel-cfg
```

Add in the PSK key

```json
{
    "Network": "10.20.0.0/16",
    "Backend": {
        "Type": "ipsec",
        "PSK": "96-char-hex-string-here"
    }
}
```

```sh
# reschedule the pod
kubectl delete pod -n kube-system -l app=flannel
```

### Cilium

First fulfill the [requirements](https://docs.cilium.io/en/stable/kubernetes/requirements/)

Add into `/etc/fstab`

`bpffs                      /sys/fs/bpf             bpf     defaults 0 0`

```sh
# generate a random key
echo $(dd if=/dev/urandom count=20 bs=1 2> /dev/null| xxd -p -c 64)

# make the secret
kubectl create -n kube-system secret generic cilium-ipsec-keys \
--from-literal=keys="3 rfc4106(gcm(aes)) {outcome} 128"

# install cilium with encryption
helm repo add cilium https://helm.cilium.io/

helm install cilium cilium/cilium --version 1.7.2 \
  --namespace kube-system \
  --set global.encryption.enabled=true \
  --set global.encryption.nodeEncryption=false \ # TODO: make this true
  --enable-node-port \
  --enable-external-ips
```

### WeaveNet

```sh
# from https://www.weave.works/docs/net/latest/kubernetes/kube-addon/
echo "flake-tectum-famine-cordoba-musketry-malaise-alibi-shorten-breccia-debility" > /var/lib/weave/weave-passwd

kubectl create secret -n kube-system generic weave-passwd --from-file=/var/lib/weave/weave-passwd

kubectl apply -f "https://cloud.weave.works/k8s/net?k8s-version=$(kubectl version | base64 | tr -d '\n')&password-secret=weave-passwd"
```

## install the DO CSI for DO volumes

Download the DO CSI from this [releases page](https://github.com/digitalocean/csi-digitalocean/tree/master/deploy/kubernetes/releases)

```sh
# install
kubectl apply -f https://raw.githubusercontent.com/digitalocean/csi-digitalocean/master/deploy/kubernetes/releases/csi-digitalocean-v1.2.0.yaml
```

## label the nodes

```sh
# annotate nodes with datacentre for scheduling
kubectl label nodes control-plane dfl.mn/datacentre=digitalocean
kubectl label nodes node-1 dfl.mn/datacentre=digitalocean
kubectl label nodes node-2 dfl.mn/datacentre=digitalocean

kubectl label nodes ant-man dfl.mn/datacentre=mission
```

## setup cert-manager

```sh
# instructions at thttps://cert-manager.io/docs/installation/kubernetes/#installing-with-helm
kubectl apply -f https://github.com/jetstack/cert-manager/releases/download/v0.14.2/cert-manager.crds.yaml

kubectl create namespace cert-manager

helm repo add jetstack https://charts.jetstack.io

helm repo update

helm install \
cert-manager jetstack/cert-manager \
--namespace cert-manager \
--version v0.14.2
```

## setup ingress-nginx

```sh
# instructions at https://kubernetes.github.io/ingress-nginx/deploy/#bare-metal
kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/master/deploy/static/provider/baremetal/deploy.yaml
```

## additional

### move secrets between namespaces

```sh
kubectl get secret cert-dflmn --namespace=default -o yaml | kubectl apply --namespace=ingress-nginx -f -
```

```sh
kubeadm join 68.183.38.41:6443 --token hmysvp.f2g5i9sbnopswh9a \
    --discovery-token-ca-cert-hash sha256:135a77749d19df2c5e6ec22569acb39c252e8539a3c6f8147db19681cc85c94d
```
