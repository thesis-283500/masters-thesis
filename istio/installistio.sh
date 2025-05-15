#!/bin/bash

. ../config.sh

# download istio images to a host
echo "Pulling istio images to a docker host..."
docker pull $HUB/pilot:$TAG
docker pull $HUB/proxyv2:$TAG
docker pull docker.io/busybox:1.28

echo "load istio images to the clusters..."
kind load docker-image --name $CLUSTER1_NAME $HUB/pilot:$TAG
kind load docker-image --name $CLUSTER1_NAME $HUB/proxyv2:$TAG
kind load docker-image --name $CLUSTER1_NAME docker.io/busybox:1.28

# point this to your latest build binary
istioctl_latest=/usr/local/bin/istioctl

# install certs in both clusters
kubectl create namespace istio-system --context=${CLUSTER1_CTX} > /dev/null 2>&1
kubectl config set-context --current --namespace istio-system

# Install istio iop profile on cluster1
echo "Installing istio in $CLUSTER1_NAME..."
# Install gateway crds
kubectl --context="${CLUSTER1_CTX}" apply -f gateway-crds.yaml
kubectl --context="${CLUSTER1_CTX}" apply -n istio-system -f auth.yaml
istioctl --context="${CLUSTER1_CTX}" install -f backend-io.yaml --skip-confirmation
