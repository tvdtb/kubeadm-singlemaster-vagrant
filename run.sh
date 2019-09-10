#!/usr/bin/env bash

set -x

export KUBECONFIG=.kube/config

vagrant destroy --force

rm -rf .vagrant

rm -rf params/* .kube

mkdir -p params

vagrant up

sleep 60

kubectl get nodes

kubectl get pods --all-namespaces