AetherKube/README.md

```



---



\# 🟦 \*\*AetherKube — Cloud-Native Multi-Service App on Azure (Terraform + Flask)\*\*



AetherKube is a fully-modular, enterprise-grade cloud infrastructure project built using \*\*Terraform\*\*, \*\*Azure\*\*, and a \*\*Python Flask microservice architecture\*\*.

It demonstrates modern DevOps practices including:



\* Modular Terraform infrastructure

\* Azure cloud provisioning

\* Multi-environment support (staging \& production)

\* Backend state in Azure Blob Storage

\* Dockerized microservices

\* Clean separation of concerns

\* GitOps-friendly repo layout



This project is designed as a real-world deployment blueprint showcasing professional Terraform structuring, CI/CD readiness, and scalable app deployment patterns.



---



\## 🚀 \*\*Architecture Overview\*\*



\### \*\*🟪 Infrastructure (Terraform)\*\*



The infra is built using:



\* Azure Resource Group

\* Azure App Service Plan

\* Azure Linux Web Apps (for Flask services)

\* Azure Storage Account + Blob Container (Terraform Backend)

\* Modular folder design

\* Environment separation

\* Remote state management



\### \*\*🟩 Application (Flask Multi-Service App)\*\*



Under `app/` you have:



\* `service-api` → REST Service

\* `service-ui` → UI Frontend

\* `service-worker` → Background worker jobs



All services are containerized using Docker.



---



\## 📁 \*\*Repository Structure\*\*



```

AetherKube/

│

├── app/

│   ├── service-api/

│   ├── service-ui/

│   └── service-worker/

│

├── infra/

│   ├── modules/

│   │   ├── resource-group/

│   │   └── web-app/

│   │

│   └── envs/

│       ├── staging/

│       └── production/

│

└── README.md

```



---



\## 🌍 \*\*Terraform Environments\*\*



\### \*\*Staging\*\*



```

infra/envs/staging

```



Uses:



\* Backend: Azure Blob Storage

\* State: `staging.tfstate`

\* Configs: `terraform.tfvars`



\### \*\*Production\*\*



```

infra/envs/production

```



Same structure, different state + isolation.



---



\## 🛠 \*\*How to Deploy (Step-by-Step)\*\*



\### \*\*1️⃣ Configure Azure Credentials\*\*



Login:



```bash

az login

az account set --subscription "<your-subscription-id>"

```



\### \*\*2️⃣ Create Backend Storage (one-time)\*\*



```bash

az group create -n rg-aetherkube-state -l eastus

az storage account create -n aetherkubesastore -g rg-aetherkube-state -l eastus --sku Standard\_LRS

az storage container create -n tfstate --account-name aetherkubesastore

```



\### \*\*3️⃣ Initialize Terraform\*\*



In environment folder:



```bash

terraform init -reconfigure

```



\### \*\*4️⃣ Plan + Apply\*\*



```bash

terraform plan -var-file="terraform.tfvars"

terraform apply -var-file="terraform.tfvars"

```



---



\## 📦 \*\*Build \& Run Flask Services Locally\*\*



```bash

cd app/service-api

pip install -r requirements.txt

python app.py

```



Or using Docker:



```bash

docker build -t api-service .

docker run -p 5000:5000 api-service

```



---



\## 🔄 \*\*CI/CD (Optional Setup)\*\*



This repo is structured for easy integration with:



\* GitHub Actions

\* Azure DevOps Pipelines

\* Docker Build/Push workflows



Assistive YAML templates can be added later.



---



\## 🛡 \*\*Security\*\*



This repo includes a strict `.gitignore` that protects:



\* terraform.tfvars

\* state files

\* keys/certs

\* Azure credentials

\* Python cache



Never commit sensitive files.



---



\## 📚 \*\*Future Enhancements\*\*



\* Add GitHub Actions CI/CD

\* Add container registry (ACR)

\* Add Kubernetes deployment (AKS)

\* Add monitoring: Azure Monitor + Grafana

\* Add load testing profiles



---



\## 🤝 \*\*Contributions\*\*



Pull requests, issues, and suggestions are welcome.



---



\## 📧 \*\*Author\*\*



\*\*Umasankar Vedala\*\*

Cloud Engineer · DevOps · Terraform · Kubernetes · Azure





