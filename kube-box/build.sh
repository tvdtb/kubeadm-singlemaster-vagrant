#!/usr/bin/env bash

set -x

vagrant destroy --force
rm -rf .vagrant kube-*.box

export KUBE_VERSION=1.15.3

vagrant up
vagrant vbguest
vagrant package --output kube-${KUBE_VERSION}.box

vagrant box add kube-${KUBE_VERSION} kube-${KUBE_VERSION}.box --force

vagrant destroy --force
rm -rf .vagrant kube-*.box
