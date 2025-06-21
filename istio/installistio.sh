#!/bin/bash


# point this to your latest build binary
istioctl_latest=./istioctl

# install certs in both clusters
kubectl create namespace istio-system 

kubectl apply -f gateway-crds.yaml
kubectl label namespace istio-system topology.istio.io/network=thesis-283500

istioctl install -f backend-io.yaml --skip-confirmation

sleep 30

kubectl apply -n istio-system -f auth.yaml
