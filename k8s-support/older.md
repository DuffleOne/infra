# older stuff

## CNI

### Flannel

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
