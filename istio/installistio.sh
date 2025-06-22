#!/bin/bash


# install certs in both clusters
kubectl create namespace istio-system 

kubectl apply -f gateway-crds.yaml

kubectl apply -f manifest.yaml

sleep 30

kubectl apply -n istio-system -f auth.yaml
