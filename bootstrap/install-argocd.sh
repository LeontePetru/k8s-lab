#!/bin/bash
set -e

kubectl create namespace argocd || true

helm repo add argo https://argoproj.github.io/argo-helm
helm repo update

helm install argocd argo/argo-cd \
  --namespace argocd \
  --set server.service.type=NodePort \
  --set server.extraArgs="{--insecure}"

echo "Waiting for ArgoCD..."
kubectl rollout status deploy/argocd-server -n argocd