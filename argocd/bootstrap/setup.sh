#!/bin/bash

# kubectl create ns argocd
# sed -i "s|APP_ID|${{ secrets.APP_ID }}|" values.yaml
# sed -i "s|INSTALLATION_ID|${{ secrets.INSTALLATION_ID }}|" values.yaml
# sed -i "s|PRIVATE_KEY|${{ secrets.APP_PRIVATE_KEY }}|" values.yaml

helm repo add argo https://argoproj.github.io/argo-helm
helm repo update

helm install my-argo-cd argo/argo-cd --version 8.1.2 \
--set credentialTemplates.github-enterprise-creds-1.url="https://github.com/thesis-283500/masters-thesis.git" \
--set credentialTemplates.github-enterprise-creds-1.githubAppID="${{ secrets.APP_ID }}" \
--set credentialTemplates.github-enterprise-creds-1.githubAppInstallationID="${{ secrets.INSTALLATION_ID }}" \
--set credentialTemplates.github-enterprise-creds-1.githubAppEnterpriseBaseUrl="https://github.com/thesis-283500/masters-thesis/api/v3" \
--set credentialTemplates.github-enterprise-creds-1.githubAppPrivateKey="${{ secrets.APP_PRIVATE_KEY }}" \
--namespace argocd \
--create-namespace

