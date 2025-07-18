#!/bin/bash

kubectl port-forward --address localhost -n kepler service/kepler-exporter 9102:9102 &
kubectl port-forward --address localhost -n monitoring service/prometheus-k8s 9090:9090 &
kubectl port-forward --address localhost -n monitoring service/grafana 3000:3000 &
kubectl port-forward --address localhost -n istio-system service/kiali 20001:20001 &
kubectl port-forward --address localhost -n microservice service/frontend 8080:80 &
# kubectl get -n microservice service frontend-external | awk '{print $4}' &
