# kubeadm-singlemaster-vagrant

![](https://raw.githubusercontent.com/lwieske/kubeadm-singlemaster-vagrant/master/demo800x600.gif)

Kubernetes Cluster: kubeadm mgmt plane + 1 master ctrl plane + 3 worker data plane

## Vagrant Spin Up For 1 Master + 3 Workers

### K8S 1.15.3

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
│    w01    │       │    w02    │       │    w03    │
└───────────┘       └───────────┘       └───────────┘
```

```console
> ./run.sh
+ set -x
+ export KUBECONFIG=.kube/config
+ KUBECONFIG=.kube/config
+ vagrant destroy --force
==> w03: VM not created. Moving on...
==> w02: VM not created. Moving on...
==> w01: VM not created. Moving on...
==> m01: VM not created. Moving on...
+ rm -rf .vagrant
+ rm -rf params/certificate-key params/discovery-token-ca-cert-hash params/kubeadm.log params/token .kube
+ mkdir -p params
+ vagrant up
Bringing machine 'm01' up with 'virtualbox' provider...
Bringing machine 'w01' up with 'virtualbox' provider...
Bringing machine 'w02' up with 'virtualbox' provider...
Bringing machine 'w03' up with 'virtualbox' provider...
==> m01: Cloning VM...
==> m01: Matching MAC address for NAT networking...
==> m01: Setting the name of the VM: m01
==> m01: Clearing any previously set network interfaces...
==> m01: Preparing network interfaces based on configuration...
    m01: Adapter 1: nat
    m01: Adapter 2: hostonly
==> m01: Forwarding ports...
    m01: 22 (guest) => 2222 (host) (adapter 1)
==> m01: Running 'pre-boot' VM customizations...
==> m01: Booting VM...
==> m01: Waiting for machine to boot. This may take a few minutes...
    m01: SSH address: 127.0.0.1:2222
    m01: SSH username: vagrant
    m01: SSH auth method: private key
    m01: Warning: Connection reset. Retrying...
    m01: Warning: Remote connection disconnect. Retrying...
    m01: Warning: Connection reset. Retrying...
    m01: Warning: Remote connection disconnect. Retrying...
    m01: Warning: Connection reset. Retrying...
    m01: Warning: Remote connection disconnect. Retrying...
==> m01: Machine booted and ready!
[m01] GuestAdditions 6.0.12 running --- OK.
==> m01: Checking for guest additions in VM...
==> m01: Setting hostname...
==> m01: Configuring and enabling network interfaces...
==> m01: Mounting shared folders...
    m01: /vagrant => /Users/lothar/Documents/GitHub/kubeadm-singlemaster-vagrant
==> m01: [vagrant-hostmanager:guests] Updating hosts file on active guest virtual machines...
==> m01: Running provisioner: shell...
    m01: Running: inline script
    m01: [init] Using Kubernetes version: v1.15.3
    m01: [preflight] Running pre-flight checks
    m01: [preflight] Pulling images required for setting up a Kubernetes cluster
    m01: [preflight] This might take a minute or two, depending on the speed of your internet connection
    m01: [preflight] You can also perform this action in beforehand using 'kubeadm config images pull'
    m01: [kubelet-start] Writing kubelet environment file with flags to file "/var/lib/kubelet/kubeadm-flags.env"
    m01: [kubelet-start] Writing kubelet configuration to file "/var/lib/kubelet/config.yaml"
    m01: [kubelet-start] Activating the kubelet service
    m01: [certs] Using certificateDir folder "/etc/kubernetes/pki"
    m01: [certs] Generating "etcd/ca" certificate and key
    m01: [certs] Generating "etcd/peer" certificate and key
    m01: [certs] etcd/peer serving cert is signed for DNS names [m01.local localhost] and IPs [10.10.10.101 127.0.0.1 ::1]
    m01: [certs] Generating "etcd/healthcheck-client" certificate and key
    m01: [certs] Generating "apiserver-etcd-client" certificate and key
    m01: [certs] Generating "etcd/server" certificate and key
    m01: [certs] etcd/server serving cert is signed for DNS names [m01.local localhost] and IPs [10.10.10.101 127.0.0.1 ::1]
    m01: [certs] Generating "front-proxy-ca" certificate and key
    m01: [certs] Generating "front-proxy-client" certificate and key
    m01: [certs] Generating "ca" certificate and key
    m01: [certs] Generating "apiserver" certificate and key
    m01: [certs] apiserver serving cert is signed for DNS names [m01.local kubernetes kubernetes.default kubernetes.default.svc kubernetes.default.svc.cluster.local] and IPs [10.96.0.1 10.10.10.101 10.10.10.101]
    m01: [certs] Generating "apiserver-kubelet-client" certificate and key
    m01: [certs] Generating "sa" key and public key
    m01: [kubeconfig] Using kubeconfig folder "/etc/kubernetes"
    m01: [kubeconfig] Writing "admin.conf" kubeconfig file
    m01: [kubeconfig] Writing "kubelet.conf" kubeconfig file
    m01: [kubeconfig] Writing "controller-manager.conf" kubeconfig file
    m01: [kubeconfig] Writing "scheduler.conf" kubeconfig file
    m01: [control-plane] Using manifest folder "/etc/kubernetes/manifests"
    m01: [control-plane] Creating static Pod manifest for "kube-apiserver"
    m01: [control-plane] Creating static Pod manifest for "kube-controller-manager"
    m01: [control-plane] Creating static Pod manifest for "kube-scheduler"
    m01: [etcd] Creating static Pod manifest for local etcd in "/etc/kubernetes/manifests"
    m01: [wait-control-plane] Waiting for the kubelet to boot up the control plane as static Pods from directory "/etc/kubernetes/manifests". This can take up to 2m0s
    m01: [apiclient] All control plane components are healthy after 22.007626 seconds
    m01: [upload-config] Storing the configuration used in ConfigMap "kubeadm-config" in the "kube-system" Namespace
    m01: [kubelet] Creating a ConfigMap "kubelet-config-1.15" in namespace kube-system with the configuration for the kubelets in the cluster
    m01: [upload-certs] Storing the certificates in Secret "kubeadm-certs" in the "kube-system" Namespace
    m01: [upload-certs] Using certificate key:
    m01: 26eecf5d2e32f8013314e806141e5fab3de24eadfe3c8e507f6cc3e46eba5439
    m01: [mark-control-plane] Marking the node m01.local as control-plane by adding the label "node-role.kubernetes.io/master=''"
    m01: [mark-control-plane] Marking the node m01.local as control-plane by adding the taints [node-role.kubernetes.io/master:NoSchedule]
    m01: [bootstrap-token] Using token: abcdef.0123456789abcdef
    m01: [bootstrap-token] Configuring bootstrap tokens, cluster-info ConfigMap, RBAC Roles
    m01: [bootstrap-token] configured RBAC rules to allow Node Bootstrap tokens to post CSRs in order for nodes to get long term certificate credentials
    m01: [bootstrap-token] configured RBAC rules to allow the csrapprover controller automatically approve CSRs from a Node Bootstrap Token
    m01: [bootstrap-token] configured RBAC rules to allow certificate rotation for all node client certificates in the cluster
    m01: [bootstrap-token] Creating the "cluster-info" ConfigMap in the "kube-public" namespace
    m01: [addons] Applied essential addon: CoreDNS
    m01: [addons] Applied essential addon: kube-proxy
    m01:
    m01: Your Kubernetes control-plane has initialized successfully!
    m01:
    m01: To start using your cluster, you need to run the following as a regular user:
    m01:
    m01:   mkdir -p $HOME/.kube
    m01:   sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
    m01:   sudo chown $(id -u):$(id -g) $HOME/.kube/config
    m01:
    m01: You should now deploy a pod network to the cluster.
    m01: Run "kubectl apply -f [podnetwork].yaml" with one of the options listed at:
    m01:   https://kubernetes.io/docs/concepts/cluster-administration/addons/
    m01:
    m01: You can now join any number of the control-plane node running the following command on each as root:
    m01:
    m01:   kubeadm join 10.10.10.101:6443 --token abcdef.0123456789abcdef \
    m01:     --discovery-token-ca-cert-hash sha256:1daf1ff8fc3328aa63406b99bf0595394873543d5c1b628df5b2c7ba4202a8c2 \
    m01:     --control-plane --certificate-key 26eecf5d2e32f8013314e806141e5fab3de24eadfe3c8e507f6cc3e46eba5439
    m01:
    m01: Please note that the certificate-key gives access to cluster sensitive data, keep it secret!
    m01: As a safeguard, uploaded-certs will be deleted in two hours; If necessary, you can use
    m01: "kubeadm init phase upload-certs --upload-certs" to reload certs afterward.
    m01:
    m01: Then you can join any number of worker nodes by running the following on each as root:
    m01:
    m01: kubeadm join 10.10.10.101:6443 --token abcdef.0123456789abcdef \
    m01:     --discovery-token-ca-cert-hash sha256:1daf1ff8fc3328aa63406b99bf0595394873543d5c1b628df5b2c7ba4202a8c2
    m01: podsecuritypolicy.policy/psp.flannel.unprivileged created
    m01: clusterrole.rbac.authorization.k8s.io/flannel created
    m01: clusterrolebinding.rbac.authorization.k8s.io/flannel created
    m01: serviceaccount/flannel created
    m01: configmap/kube-flannel-cfg created
    m01: daemonset.apps/kube-flannel-ds-amd64 created
==> w01: Cloning VM...
==> w01: Matching MAC address for NAT networking...
==> w01: Setting the name of the VM: w01
==> w01: Fixed port collision for 22 => 2222. Now on port 2200.
==> w01: Clearing any previously set network interfaces...
==> w01: Preparing network interfaces based on configuration...
    w01: Adapter 1: nat
    w01: Adapter 2: hostonly
==> w01: Forwarding ports...
    w01: 22 (guest) => 2200 (host) (adapter 1)
==> w01: Running 'pre-boot' VM customizations...
==> w01: Booting VM...
==> w01: Waiting for machine to boot. This may take a few minutes...
    w01: SSH address: 127.0.0.1:2200
    w01: SSH username: vagrant
    w01: SSH auth method: private key
    w01: Warning: Connection reset. Retrying...
    w01: Warning: Remote connection disconnect. Retrying...
    w01: Warning: Connection reset. Retrying...
    w01: Warning: Remote connection disconnect. Retrying...
    w01: Warning: Connection reset. Retrying...
    w01: Warning: Remote connection disconnect. Retrying...
==> w01: Machine booted and ready!
[w01] GuestAdditions 6.0.12 running --- OK.
==> w01: Checking for guest additions in VM...
==> w01: Setting hostname...
==> w01: Configuring and enabling network interfaces...
==> w01: Mounting shared folders...
    w01: /vagrant => /Users/lothar/Documents/GitHub/kubeadm-singlemaster-vagrant
==> w01: [vagrant-hostmanager:guests] Updating hosts file on active guest virtual machines...
==> w01: Running provisioner: shell...
    w01: Running: inline script
    w01: [preflight] Running pre-flight checks
    w01: [preflight] Reading configuration from the cluster...
    w01: [preflight] FYI: You can look at this config file with 'kubectl -n kube-system get cm kubeadm-config -oyaml'
    w01: [kubelet-start] Downloading configuration for the kubelet from the "kubelet-config-1.15" ConfigMap in the kube-system namespace
    w01: [kubelet-start] Writing kubelet configuration to file "/var/lib/kubelet/config.yaml"
    w01: [kubelet-start] Writing kubelet environment file with flags to file "/var/lib/kubelet/kubeadm-flags.env"
    w01: [kubelet-start] Activating the kubelet service
    w01: [kubelet-start] Waiting for the kubelet to perform the TLS Bootstrap...
    w01:
    w01: This node has joined the cluster:
    w01: * Certificate signing request was sent to apiserver and a response was received.
    w01: * The Kubelet was informed of the new secure connection details.
    w01:
    w01: Run 'kubectl get nodes' on the control-plane to see this node join the cluster.
==> w02: Cloning VM...
==> w02: Matching MAC address for NAT networking...
==> w02: Setting the name of the VM: w02
==> w02: Fixed port collision for 22 => 2222. Now on port 2201.
==> w02: Clearing any previously set network interfaces...
==> w02: Preparing network interfaces based on configuration...
    w02: Adapter 1: nat
    w02: Adapter 2: hostonly
==> w02: Forwarding ports...
    w02: 22 (guest) => 2201 (host) (adapter 1)
==> w02: Running 'pre-boot' VM customizations...
==> w02: Booting VM...
==> w02: Waiting for machine to boot. This may take a few minutes...
    w02: SSH address: 127.0.0.1:2201
    w02: SSH username: vagrant
    w02: SSH auth method: private key
    w02: Warning: Remote connection disconnect. Retrying...
    w02: Warning: Connection reset. Retrying...
    w02: Warning: Remote connection disconnect. Retrying...
    w02: Warning: Connection reset. Retrying...
    w02: Warning: Remote connection disconnect. Retrying...
    w02: Warning: Connection reset. Retrying...
==> w02: Machine booted and ready!
[w02] GuestAdditions 6.0.12 running --- OK.
==> w02: Checking for guest additions in VM...
==> w02: Setting hostname...
==> w02: Configuring and enabling network interfaces...
==> w02: Mounting shared folders...
    w02: /vagrant => /Users/lothar/Documents/GitHub/kubeadm-singlemaster-vagrant
==> w02: [vagrant-hostmanager:guests] Updating hosts file on active guest virtual machines...
==> w02: Running provisioner: shell...
    w02: Running: inline script
    w02: [preflight] Running pre-flight checks
    w02: [preflight] Reading configuration from the cluster...
    w02: [preflight] FYI: You can look at this config file with 'kubectl -n kube-system get cm kubeadm-config -oyaml'
    w02: [kubelet-start] Downloading configuration for the kubelet from the "kubelet-config-1.15" ConfigMap in the kube-system namespace
    w02: [kubelet-start] Writing kubelet configuration to file "/var/lib/kubelet/config.yaml"
    w02: [kubelet-start] Writing kubelet environment file with flags to file "/var/lib/kubelet/kubeadm-flags.env"
    w02: [kubelet-start] Activating the kubelet service
    w02: [kubelet-start] Waiting for the kubelet to perform the TLS Bootstrap...
    w02:
    w02: This node has joined the cluster:
    w02: * Certificate signing request was sent to apiserver and a response was received.
    w02: * The Kubelet was informed of the new secure connection details.
    w02:
    w02: Run 'kubectl get nodes' on the control-plane to see this node join the cluster.
==> w03: Cloning VM...
==> w03: Matching MAC address for NAT networking...
==> w03: Setting the name of the VM: w03
==> w03: Fixed port collision for 22 => 2222. Now on port 2202.
==> w03: Clearing any previously set network interfaces...
==> w03: Preparing network interfaces based on configuration...
    w03: Adapter 1: nat
    w03: Adapter 2: hostonly
==> w03: Forwarding ports...
    w03: 22 (guest) => 2202 (host) (adapter 1)
==> w03: Running 'pre-boot' VM customizations...
==> w03: Booting VM...
==> w03: Waiting for machine to boot. This may take a few minutes...
    w03: SSH address: 127.0.0.1:2202
    w03: SSH username: vagrant
    w03: SSH auth method: private key
    w03: Warning: Connection reset. Retrying...
    w03: Warning: Remote connection disconnect. Retrying...
    w03: Warning: Connection reset. Retrying...
    w03: Warning: Remote connection disconnect. Retrying...
    w03: Warning: Connection reset. Retrying...
    w03: Warning: Remote connection disconnect. Retrying...
==> w03: Machine booted and ready!
[w03] GuestAdditions 6.0.12 running --- OK.
==> w03: Checking for guest additions in VM...
==> w03: Setting hostname...
==> w03: Configuring and enabling network interfaces...
==> w03: Mounting shared folders...
    w03: /vagrant => /Users/lothar/Documents/GitHub/kubeadm-singlemaster-vagrant
==> w03: [vagrant-hostmanager:guests] Updating hosts file on active guest virtual machines...
==> w03: Running provisioner: shell...
    w03: Running: inline script
    w03: [preflight] Running pre-flight checks
    w03: [preflight] Reading configuration from the cluster...
    w03: [preflight] FYI: You can look at this config file with 'kubectl -n kube-system get cm kubeadm-config -oyaml'
    w03: [kubelet-start] Downloading configuration for the kubelet from the "kubelet-config-1.15" ConfigMap in the kube-system namespace
    w03: [kubelet-start] Writing kubelet configuration to file "/var/lib/kubelet/config.yaml"
    w03: [kubelet-start] Writing kubelet environment file with flags to file "/var/lib/kubelet/kubeadm-flags.env"
    w03: [kubelet-start] Activating the kubelet service
    w03: [kubelet-start] Waiting for the kubelet to perform the TLS Bootstrap...
    w03:
    w03: This node has joined the cluster:
    w03: * Certificate signing request was sent to apiserver and a response was received.
    w03: * The Kubelet was informed of the new secure connection details.
    w03:
    w03: Run 'kubectl get nodes' on the control-plane to see this node join the cluster.
+ sleep 60
+ kubectl get nodes
NAME        STATUS   ROLES    AGE     VERSION
m01.local   Ready    master   4m13s   v1.15.3
w01.local   Ready    <none>   3m1s    v1.15.3
w02.local   Ready    <none>   2m1s    v1.15.3
w03.local   Ready    <none>   61s     v1.15.3
+ kubectl get pods --all-namespaces
NAMESPACE     NAME                                READY   STATUS    RESTARTS   AGE
kube-system   coredns-5c98db65d4-57klh            1/1     Running   0          3m54s
kube-system   coredns-5c98db65d4-f2rdd            1/1     Running   0          3m54s
kube-system   etcd-m01.local                      1/1     Running   0          3m8s
kube-system   kube-apiserver-m01.local            1/1     Running   0          3m4s
kube-system   kube-controller-manager-m01.local   1/1     Running   0          2m49s
kube-system   kube-flannel-ds-amd64-87lk9         1/1     Running   0          2m1s
kube-system   kube-flannel-ds-amd64-rqfb4         1/1     Running   0          3m1s
kube-system   kube-flannel-ds-amd64-rv9lq         1/1     Running   0          3m54s
kube-system   kube-flannel-ds-amd64-w54v8         1/1     Running   0          61s
kube-system   kube-proxy-47m4v                    1/1     Running   0          3m54s
kube-system   kube-proxy-ckbxt                    1/1     Running   0          61s
kube-system   kube-proxy-kr8l8                    1/1     Running   0          2m1s
kube-system   kube-proxy-lgj2g                    1/1     Running   0          3m1s
kube-system   kube-scheduler-m01.local            1/1     Running   0          3m6s
>
```