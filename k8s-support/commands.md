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
```

## label the nodes

```sh
# annotate nodes with datacentre for scheduling
kubectl label nodes control-plane dfl.mn/datacentre=digitalocean
kubectl label nodes node-1 dfl.mn/datacentre=digitalocean
kubectl label nodes node-2 dfl.mn/datacentre=digitalocean

kubectl label nodes ant-man dfl.mn/datacentre=mission
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

## install the DO CSI for DO volumes

Download the DO CSI from this [releases page](https://github.com/digitalocean/csi-digitalocean/tree/master/deploy/kubernetes/releases)

```sh
# install
kubectl apply -f https://raw.githubusercontent.com/digitalocean/csi-digitalocean/master/deploy/kubernetes/releases/csi-digitalocean-v1.2.0.yaml
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