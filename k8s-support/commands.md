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

## update config for control-plan

```sh
# dump the existing config to a file
kubeadm config view > kubeadm.yaml

# read that file and change anything you want
cat kubeadm.yaml
```

You can add the following config to bind the controller to 0.0.0.0

```yaml
controllerManager:
  extraArgs:
    bind-address: 0.0.0.0
scheduler:
  extraArgs:
    bind-address: 0.0.0.0
```

You can then reapply this config back with:

```sh
kubeadm init phase control-plane controllerManager --config kubeadm.yaml
kubeadm init phase control-plane scheduler --config kubeadm.yaml
```

## install the CNI

### WeaveNet

```sh
# from https://www.weave.works/docs/net/latest/kubernetes/kube-addon/
# obviously change this password
echo "flake-tectum-famine-cordoba-musketry-malaise-alibi-shorten-breccia-debility" > /var/lib/weave/weave-passwd

kubectl create secret -n kube-system generic weave-passwd --from-file=/var/lib/weave/weave-passwd

kubectl apply -f "https://cloud.weave.works/k8s/net?k8s-version=$(kubectl version | base64 | tr -d '\n')&password-secret=weave-passwd"
```

## install the DO CSI for DO volumes

Download the DO CSI from this [releases page](https://github.com/digitalocean/csi-digitalocean/tree/master/deploy/kubernetes/releases)

```sh
# install
kubectl apply -f https://raw.githubusercontent.com/digitalocean/csi-digitalocean/master/deploy/kubernetes/releases/csi-digitalocean-v1.2.0.yaml

# patch the daemonset to only run in digitalocean hosts
kc patch daemonset csi-do-node -n kube-system -p '{"spec":{"template":{"spec":{"nodeSelector":{"dfl.mn/datacentre":"digitalocean"}}}}}'
```

## label the nodes

```sh
# annotate nodes with datacentre for scheduling
kubectl label nodes control-plane dfl.mn/datacentre=digitalocean
kubectl label nodes node-1 dfl.mn/datacentre=digitalocean
kubectl label nodes node-2 dfl.mn/datacentre=digitalocean

kubectl label nodes node-3 dfl.mn/datacentre=mission
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
