#!/bin/bash

# Setup instruction is found here: https://devopscube.com/setup-prometheus-monitoring-on-kubernetes/
. ../config.sh

kubectl create namespace monitoring || echo "Namespace already exit"
kubectl label ns monitoring istio-injection=enabled --overwrite

kubectl apply -f crd-prometheusrules.yaml
kubectl apply -f crd-servicemonitor.yaml

kubectl apply -f clusterRole.yaml
kubectl apply -f prometheus-config.yaml
kubectl apply -f prometheus-deployment.yaml

# Install alert manager components
kubectl apply -f alert-manager/

# Install kube-state-metrics
kubectl -n kube-system apply -f kube-state-metrics/
