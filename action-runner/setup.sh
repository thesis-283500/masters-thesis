#!/bin/bash
kubectl apply -f cert-manager.yaml --server-side=true --force-conflicts
kubectl create ns actions-runner-system
kubectl apply -f app-secret.yaml
kubectl apply -f actions-runner-controller.yaml --server-side=true --force-conflicts
sleep 20
kubectl apply -f runnerdeployment.yaml