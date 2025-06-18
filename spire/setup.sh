#!/bin/bash

kubectl apply -f spire-crd.yaml
kubectl apply -f manifest.yaml
sleep 5
kubectl apply -f spiffe-id.yaml

