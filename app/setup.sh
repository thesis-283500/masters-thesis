#!/bin/bash

kubectl create ns microservice
kubectl label ns microservice istio-injection=enabled
kubectl apply -f httproute-crd.yaml
kubectl apply -f istio-manifests.yaml
kubectl apply -n microservice -f kubernetes-manifests.yaml
