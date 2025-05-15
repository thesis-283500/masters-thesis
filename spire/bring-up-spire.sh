#/bin/bash

. ../config.sh

# set -e

kubectl config use-context ${CLUSTER1_CTX}
kubectl create ns istio-system || echo "Namespace already exist"
until kubectl apply -f ./crds.yaml; do sleep 3; done

echo "sleeping..."
sleep 30
kubectl apply -f ./spire-backend.yaml

echo "sleeping..."
sleep 30
kubectl apply -f ./spiffe-id-backend.yaml
