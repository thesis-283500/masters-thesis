helm repo add argo https://argoproj.github.io/argo-helm
helm repo update

helm upgrade --install my-argo-cd argo/argo-cd --version 8.1.2 \
    --set config.credentialTemplates.github-enterprise-creds-1.url="https://github.com/thesis-283500/masters-thesis.git" \
    --set config.credentialTemplates.github-enterprise-creds-1.githubAppID="${{ secrets.APP_ID }}" \
    --set config.credentialTemplates.github-enterprise-creds-1.githubAppInstallationID="${{ secrets.INSTALLATION_ID }}" \
    --set config.credentialTemplates.github-enterprise-creds-1.githubAppEnterpriseBaseUrl="https://github.com/thesis-283500/masters-thesis/api/v3" \
    --set config.credentialTemplates.github-enterprise-creds-1.githubAppPrivateKey="${{ secrets.APP_PRIVATE_KEY }}" \
    --namespace argocd \
    --create-namespace \
    -f values.yaml