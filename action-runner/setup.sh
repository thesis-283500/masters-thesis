#!/bin/bash
kubectl apply -f cert-manager.yaml --server-side=true --force-conflicts
kubectl create ns actions-runner-system
kubectl label ns actions-runner-system control-plane=controller-manager
sleep 20
kubectl apply -f controller-manager-secret.yaml
kubectl apply -f actions-runner-controller.yaml --server-side=true --force-conflicts
