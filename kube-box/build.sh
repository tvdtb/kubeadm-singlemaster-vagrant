#!/usr/bin/env bash

set -x

vagrant destroy --force
rm -rf .vagrant kube-*.box

export K8S_VERSION=1.20.4
export DOCKER_VERSION=20.10.3

vagrant up
# already installed vagrant vbguest

vagrant package --output kube-${K8S_VERSION}.box

vagrant box add kube-${K8S_VERSION} kube-${K8S_VERSION}.box --force

vagrant destroy --force
rm -rf .vagrant kube-*.box
