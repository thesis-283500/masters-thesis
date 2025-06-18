#!/bin/bash

kubectl apply -f deployment.yaml
sleep 5

kubectl port-forward --address localhost -n kepler service/kepler-exporter 9102:9102 &
kubectl port-forward --address localhost -n monitoring service/prometheus-k8s 9090:9090 &
kubectl port-forward --address localhost -n monitoring service/grafana 3000:3000 &