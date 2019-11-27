# kubeadm-singlemaster-vagrant

Kubernetes Cluster: kubeadm mgmt plane + 1 master ctrl plane + 2.. worker data plane

## Vagrant Spin Up For 1 Master + 3 Workers

### Step 1: Create Vagrant Box

```shell script
cd kube-box
bash build.sh
```

### Step 2: Create K8s Cluster

```shell script
vi Vagrantfile    
# modify variables

vagrant up
```

After creation ssh into the box and try first commands...

```shell script
vagrant ssh m01

kubectl get nodes
kubectl get services

```


# Cluster structure K8S 1.15.3

```console
                          |
                          |    
                          │
                    ┌─────▼─────┐
                    │    m01    │
                    └─────┬─────┘
                          │
      ┌───────────────────┼───────────────────┐      
      │                   │                   │      
┌─────▼─────┐       ┌─────▼─────┐       ┌─────▼─────┐
│    w01    │       │    w02    │       │    ...    │
└───────────┘       └───────────┘       └───────────┘
```

## Network

According to Vagrantfile, the network for the machines is 10.10.10.0/24.
/etc/hosts files are updated automatically, m01.local is the master, w01.local and w02.local are
the names of the worker nodes.

## Registry

m01 hosts an insecure docker registry (docker-distribution).
The registry URL is m01.local:5000, so images can be pushed using
`docker push m01.local:5000/my/image:tag`
