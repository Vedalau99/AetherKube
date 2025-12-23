
# AetherKube – Staging Environment Deployment Guide

This document provides a concise overview of the current state of the AetherKube staging environment, covering infrastructure provisioning, containerization, Kubernetes configuration, ingress setup, and deployment validation.

## Overview

AetherKube is a multi-service application consisting of:

* API service (FastAPI)
* Web service (Flask/Gunicorn)
* Worker service (background processing)

The staging environment runs on Azure Kubernetes Service (AKS) with Azure Container Registry (ACR) for image hosting and Terraform for infrastructure management.

## Infrastructure

The following components are deployed using Terraform:

* Resource group
* Virtual network and subnets
* Azure Container Registry
* AKS cluster (single-node, cost-optimized)
* Network configuration
* Remote backend for Terraform state (Azure Storage)

After applying Terraform, AKS credentials are retrieved using:


az aks get-credentials --resource-group aetherkube-staging-rg --name aetherkube-staging-aks --overwrite-existing


## Containerization

Each service contains:

* A Dockerfile
* Requirements file
* Source code under `src/`

Images are built and pushed to ACR:


docker build -t aetherkubestagingacr.azurecr.io/api:latest .
docker push aetherkubestagingacr.azurecr.io/web:latest


ACR admin access is enabled for authentication.

## Kubernetes Configuration

The `k8s/` directory contains manifests for:

* Namespaces (staging, production)
* ConfigMap shared across services
* API deployment and service
* Web deployment and service
* Worker deployment and service
* Ingress controller configuration

Namespaces are applied first:


kubectl apply -f k8s/namespaces/


Secrets are created manually for staging:


kubectl create secret generic aetherkube-secrets \
  --from-literal=API_KEY="replace_me" \
  -n staging


ConfigMaps and deployments:


kubectl apply -f k8s/base -n staging
kubectl apply -f k8s/base/api -n staging
kubectl apply -f k8s/base/web -n staging
kubectl apply -f k8s/base/worker -n staging


## Ingress Controller

Ingress-NGINX is installed through Helm.
A LoadBalancer service exposes the controller, providing a public IP for routing.

Ingress routes:

* `/api` → API backend
* `/web` → Web frontend
* Worker has no external route

Ingress manifests are located under `k8s/ingress/`.

The ingress is applied using:


kubectl apply -f k8s/ingress -n staging


## Validation

After deployment, all pods should reach the Running state:


Both services respond successfully, confirming staging is operational.



## Current Status

* Staging infrastructure is fully deployed using Terraform.
* ACR is hosting images for all three services.
* AKS cluster is running API, Web, and Worker pods.
* Ingress routing functions correctly for API and Web.
* All services are reachable through the LoadBalancer public IP.

## Next Steps

* Add production environment using the same Terraform module structure.
* Deploy monitoring stack (Prometheus, Grafana, Loki).
* Implement CI/CD using GitHub Actions (build, push, deploy workflow).
* Optionally register a domain and configure HTTPS with cert-manager.





