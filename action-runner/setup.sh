#!/bin/bash
kubectl apply -f cert-manager.yaml --server-side=true --force-conflicts
kubectl apply -f controller-manager-secret.yaml
kubectl apply -f actions-runner-controller.yaml --server-side=true --force-conflicts
sleep 20
kubectl apply -f runnerdeployment.yaml