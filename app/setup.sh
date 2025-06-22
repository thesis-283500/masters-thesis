#!/bin/bash

kubectl create ns microservice
kubectl label ns microservice istio-injection=enabled
kubectl apply -n microservice -f kubernetes-manifests.yaml
