#!/bin/bash
kubectl apply -f cert-manager.yaml --server-side=true --force-conflicts
kubectl apply -f actions-runner-controller.yaml --server-side=true --force-conflicts
kubectl apply -f app-secret.yaml
kubectl apply -f runnerdeployment.yaml