# -*- mode: ruby -*-
# vi: set ft=ruby :

KUBE_VERSION = "1.15.3"

# values have to be modified also in kubeadm-config.yaml
SUBNET       = "10.10.10"
MASTERIP     = 101

nodes = {
    # Name     CPU, RAM, IP,  BOX
    'm01'  => [  2,   1, MASTERIP, "kube-#{KUBE_VERSION}" ],
    'w01'  => [  1,   2, 201, "kube-#{KUBE_VERSION}" ],
    'w02'  => [  1,   2, 202, "kube-#{KUBE_VERSION}" ]
}

Vagrant.configure("2") do |config|

    nodes.each do |name, (cpu, ram, net, box)|

        config.vm.box = "kube-#{KUBE_VERSION}"
        config.vm.box_check_update = false

        hostname = "%s" % [name]

        config.hostmanager.enabled              = true
        config.hostmanager.manage_guest         = true
        config.hostmanager.include_offline      = true

        config.vm.define "#{hostname}" do |box|

            box.vm.hostname = "#{hostname}.local"

            box.vm.network :private_network, ip: SUBNET + "." + net.to_s

            box.vm.provider :virtualbox do |vbox|
                vbox.name         = "#{name}"
                vbox.cpus         = cpu
                vbox.memory       = ram * 1024
                vbox.linked_clone = true
            end



            box.vm.provision "shell", env: {"SUBNET" => "#{SUBNET}", "IP" => "#{net}" }, inline: <<-SHELL
                #set -x

                sed -i -n -e '2,$p' /etc/hosts
				
                cat <<<$(/usr/local/bin/jq '. + { "insecure-registries": ["m01.local:5000"] }' /etc/docker/daemon.json) >/etc/docker/daemon.json
                systemctl restart docker

                # enable kubernetes
                systemctl enable kubelet  > /dev/null 2>&1
						
                case $HOSTNAME in
	                m01.local)
                        # docker registry will be available for tags m01.local:5000/...
                        systemctl enable docker-distribution
                        systemctl start docker-distribution

                        # modify kuebeadm-config
                        cat /vagrant/kubeadm-config.yaml \
                        	| sed -e 's/advertiseAddress:.*/advertiseAddress: '${SUBNET}'.'${IP}'/'   \
                        	> /tmp/kubeadm-config.yaml
                        sed -i /tmp/kubeadm-config.yaml  -e 's/controlPlaneEndpoint:.*/controlPlaneEndpoint: '${SUBNET}'.'${IP}':6443/'
						
                        # init
                        kubeadm init \
                                --config /tmp/kubeadm-config.yaml \
                                --upload-certs \
                            | tee /vagrant/params/kubeadm.log
							
                        # copy files to vagrant user
                        mkdir -p ~vagrant/.kube
                        cp -Rf /etc/kubernetes/admin.conf ~vagrant/.kube/config
                        chown -R vagrant:vagrant ~vagrant/.kube
						
                        # activate flannel
                        su -c "kubectl apply -f /vagrant/kube-flannel.yaml" vagrant
						
						
                        kubeadm token list | grep authentication | awk '{print $1;}' >/vagrant/params/token
                        openssl x509 -in /etc/kubernetes/pki/ca.crt -noout -pubkey | \
                            openssl rsa -pubin -outform DER 2>/dev/null | \ sha256sum | \
                                cut -d' ' -f1 >/vagrant/params/discovery-token-ca-cert-hash
                        grep 'certificate-key' /vagrant/params/kubeadm.log | head -n1 | awk '{print $3}' >/vagrant/params/certificate-key
                        
						
                        cp -r .kube /vagrant
                        cp -r /vagrant/.kube /root
                        chown -R root:root /root/.kube

		                ;;
	                w*.local)
                        TOKEN=`cat /vagrant/params/token`
                        DISCOVERY_TOKEN_CA_CERT_HASH=`cat /vagrant/params/discovery-token-ca-cert-hash`
                        kubeadm join m01.local:6443 \
                                --apiserver-advertise-address $(/sbin/ip -o -4 addr list eth1 | awk '{print $4}' | cut -d/ -f1) \
                                --token ${TOKEN} \
                                --discovery-token-ca-cert-hash sha256:${DISCOVERY_TOKEN_CA_CERT_HASH}
		                ;;
                esac
            SHELL
        end
    end
end