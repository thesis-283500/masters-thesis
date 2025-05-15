#!/bin/bash

. ../config.sh

kubectl config use-context ${CLUSTER1_CTX}
kubectl apply -f install.yaml