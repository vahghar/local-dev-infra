# Terraform Local Dev Stack

A local development infrastructure built using **Terraform and Docker** that spins up a complete backend stack with a single command.

This project is designed to help developers start coding immediately without manually installing or configuring databases or caches.

---

## What This Project Creates

Using Terraform, this project provisions:

- Node.js application container
- PostgreSQL database container (with persistent storage)
- Redis cache container
- Shared Docker network for service communication

All services are managed as Terraform modules and communicate using Docker networking.

---

## Prerequisites

- Docker
- Terraform (>= 1.5)

---

## How to Run

1. Clone the repository:
```bash
git clone https://github.com/vahghar/local-dev-infra
cd terraform-local-devstack
```

2. Create a `terraform.tfvars` file in the project root and add:
```hcl
db_name     = "appdb"
db_user     = "appuser"
db_password = "password123"
```

3. Initialize Terraform:
```bash
terraform init
```

4. Apply the configuration:
```bash
terraform apply
```

Type `yes` when prompted to confirm and deploy the stack.

---

## Accessing Services

After deployment, services are available at:

- **PostgreSQL:** `localhost:5432`
- **Redis:** `localhost:6379`
- **Node.js App:** `localhost:3000`

---

## Cleanup

To destroy all resources:
```bash
terraform destroy
```