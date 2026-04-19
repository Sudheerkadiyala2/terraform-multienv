# 🚀 Terraform Multi-Environment AWS Infrastructure

![Terraform](https://img.shields.io/badge/IaC-Terraform-7B42BC)
![AWS](https://img.shields.io/badge/Cloud-AWS-FF9900)
![Status](https://img.shields.io/badge/Project-Completed-brightgreen)

---

## 📌 Project Overview

This project demonstrates **Infrastructure as Code (IaC)** using Terraform to provision and manage AWS infrastructure across multiple environments: **dev, staging, and prod**.

It focuses on building reusable modules, environment isolation, and real-world AWS networking fundamentals.

---

## 🏗️ Architecture

Each environment deploys:

* VPC (Virtual Private Cloud)
* Public Subnet
* Internet Gateway
* Route Table + Associations
* Security Group (HTTP, HTTPS, SSH)
* EC2 Instance with Nginx (via user_data)
* S3 Bucket (environment-specific storage)

---

## 🌍 Multi-Environment Strategy

| Environment | Purpose                | CIDR Block  |
| ----------- | ---------------------- | ----------- |
| Dev         | Development & testing  | 10.0.0.0/16 |
| Staging     | Pre-production testing | 10.1.0.0/16 |
| Prod        | Production workload    | 10.2.0.0/16 |

Each environment is isolated using separate `.tfvars` files.

---

## 📁 Project Structure

```
terraform-multienv/
│
├── modules/
│   └── ec2-web/
│       ├── main.tf
│       ├── variables.tf
│       └── outputs.tf
│
├── environments/
│   ├── dev.tfvars
│   ├── staging.tfvars
│   └── prod.tfvars
│
├── main.tf
├── variables.tf
├── outputs.tf
└── backend.tf (optional)
```

---

## ⚙️ How It Works

1. Root module calls reusable EC2 web module
2. Environment-specific `.tfvars` inject configuration
3. Terraform builds AWS infrastructure per environment
4. EC2 instance is configured automatically using `user_data` to install Nginx
5. Outputs provide public IP for access

---

## 🚀 Deployment Steps

### 1. Initialize Terraform

```bash
terraform init
```

### 2. Create Workspace

```bash
terraform workspace new dev
terraform workspace select dev
```

### 3. Plan Infrastructure

```bash
terraform plan -var-file=environments/dev.tfvars
```

### 4. Apply Infrastructure

```bash
terraform apply -var-file=environments/dev.tfvars
```

---

## 🌐 Access Application

After deployment, Terraform outputs the EC2 public IP:

```
http://<EC2_PUBLIC_IP>
```

You will see:

```
dev environment
```

---

## 🧠 Key Concepts Demonstrated

* Infrastructure as Code (Terraform)
* Modular architecture design
* AWS networking (VPC, Subnet, IGW, Route Tables)
* Environment isolation using tfvars
* EC2 automation using user_data scripts
* Basic cloud infrastructure provisioning

---

## 📦 Technologies Used

* Terraform
* AWS (EC2, VPC, S3, Security Groups)
* Linux (Nginx setup)

---

## 📌 Future Improvements

* Remote backend with S3 + DynamoDB state locking
* CI/CD pipeline using GitHub Actions
* HTTPS with SSL/TLS
* Auto scaling groups + Load balancer
* Monitoring using CloudWatch

---

## 👨‍💻 Author

Sudheer Kumar Kadiyala

* GitHub: [https://github.com/](https://github.com/)
* LinkedIn: [https://linkedin.com/](https://linkedin.com/)

---

## ⭐ Project Status

✔ Multi-environment Terraform setup complete
✔ EC2 web server deployed successfully
✔ Modular infrastructure design implemented

---

> This project demonstrates real-world DevOps infrastructure provisioning using Terraform.
