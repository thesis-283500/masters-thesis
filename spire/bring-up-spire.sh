#!/bin/bash

kubectl create ns spire-server >/dev/null 2>&1

kubectl apply -f spire-crd.yaml
kubectl apply -f service-accounts.yaml
kubectl apply -f configmaps.yaml
kubectl apply -f services.yaml
kubectl apply -f rbac.yaml
kubectl apply -f webhooks.yaml
kubectl apply -f csi-daemon.yaml