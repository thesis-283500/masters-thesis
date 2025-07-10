#!/bin/bash

kubectl port-forward --address localhost -n kepler service/kepler-exporter 9103:9102 &
kubectl port-forward --address localhost -n monitoring service/prometheus-k8s 9091:9090 &
kubectl port-forward --address localhost -n monitoring service/grafana 3001:3000 &
kubectl port-forward --address localhost -n istio-system service/kiali 20002:20001 &
kubectl port-forward --address localhost -n microservices service/frontend 9081:80 &
# kubectl get -n microservice service frontend-external | awk '{print $4}' &
