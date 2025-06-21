#!/bin/bash

kubectl apply -f spire-crd.yaml
kubectl apply -f manifest.yaml
sleep 20
kubectl apply -f spiffe-id.yaml

