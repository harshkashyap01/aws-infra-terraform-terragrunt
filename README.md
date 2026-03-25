# 🚀 AWS Infrastructure using Terraform & Terragrunt

This repository contains Infrastructure as Code (IaC) for provisioning and managing AWS resources using **Terraform** and **Terragrunt**.
It follows best practices like modular design, environment separation, and reusable configurations.

---

## 📌 Project Overview

The goal of this project is to build a scalable and maintainable AWS infrastructure by:

* Using **Terraform modules** for reusable components
* Using **Terragrunt** to manage environments and reduce code duplication
* Implementing **remote state management**
* Following **DevOps best practices**

---

## 🛠️ Tech Stack

* **Cloud Provider:** AWS
* **IaC Tool:** Terraform
* **Wrapper Tool:** Terragrunt
* **Version Control:** Git & GitHub
* **Containerization (optional):** Docker
* **Orchestration (optional):** ECS / EKS

---

## 📂 Project Structure

```id="k7xw2m"
.
├── modules/                    # Reusable Terraform modules
│   ├── vpc/
│   ├── ec2/
│   ├── alb/
│   └── security-groups/
│
├── live/                       # Terragrunt configurations
│   ├── dev/
│   │   ├── vpc/
│   │   ├── ec2/
│   │   └── alb/
│   │
│   ├── staging/
│   └── prod/
│
├── terragrunt.hcl              # Root Terragrunt configuration
└── README.md
```

---

## ⚙️ Key Concepts

### 🔹 Terraform Modules

Reusable infrastructure components like:

* VPC
* EC2
* Load Balancer
* Security Groups

---

### 🔹 Terragrunt

Terragrunt helps to:

* Keep configurations **DRY (Don’t Repeat Yourself)**
* Manage **multiple environments** (dev, staging, prod)
* Handle **remote state configuration centrally**
* Simplify Terraform commands

---

## 🔐 Remote State Management

State is managed using:

* **S3 Bucket** → Stores Terraform state files
* **DynamoDB Table** → Provides state locking

Configured centrally using Terragrunt.

---

## 🌍 Environments

This project supports multiple environments:

* **dev** – development
* **staging** – testing
* **prod** – production

Each environment has isolated infrastructure.

---

## 🚀 Getting Started

### 1. Install Dependencies

* Terraform
* Terragrunt
* AWS CLI

---

### 2. Configure AWS Credentials

```bash id="c0v7w1"
aws configure
```

---

### 3. Run Terragrunt

Navigate to environment:

```bash id="8z6b0j"
cd live/dev/vpc
```

Initialize:

```bash id="s6t9fj"
terragrunt init
```

Plan:

```bash id="a7q3lp"
terragrunt plan
```

Apply:

```bash id="s8u9hf"
terragrunt apply
```

---

## 🔁 Terragrunt Workflow

* Define modules in `modules/`
* Configure environments in `live/`
* Use `terragrunt.hcl` for shared settings
* Deploy infrastructure per environment

---

## 📈 Future Improvements

* CI/CD pipeline (GitHub Actions)
* Monitoring (CloudWatch, Prometheus)
* Auto Scaling setup
* Secrets management (AWS Secrets Manager / Vault)

---

## 🤝 Contributing

Feel free to fork and contribute to this project.

---

---

## 👨‍💻 Author

Harsh Kashyap
Cloud & DevOps Engineer
