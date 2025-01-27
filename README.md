# Terraform AWS Infrastructure

This Terraform code provisions resources within AWS 

## Requirements
Create a **Virtual Private Cloud (VPC)** with both **public** and **private subnets** across multiple availability zones. It also provisions an **EC2 instance** that will later run **nginx** on port 80, ensuring that the instance is accessible over HTTP by IP address.

## Resources
- **VPC:** A single VPC configured with DNS support and hostnames enabled.
- **Subnets:**
  - 3 public subnets distributed across availability zones.
  - 3 private subnets distributed across availability zones.
- **Internet Gateway:** An internet gateway attached to the VPC for public internet access.
- **Route Tables:**
  - A route table for public subnets with a default route to the internet gateway.
  - Route table associations for each public subnet.
- **Security Groups:**
  - A web security group allowing HTTP, HTTPS, SSH traffic.
  - A private security group allowing traffic between public subnets.
- **Instance Configuration:** A sample EC2 instance (not included here) can be launched in public subnets with a security group[ Allow HTTP Connections via port 80]

## Prerequisites

- Terraform v1.0+ installed on your system.
- AWS CLI configured with appropriate access and permissions.
- An AWS key pair for EC2 instances.

## Variables

The configuration uses the following variables:

| Variable                 | Description                                | Example Value          |
|--------------------------|--------------------------------------------|------------------------|
| `vpc_cidr`              | CIDR block for the VPC                    | `10.0.0.0/16`         |
| `public_subnet_1_cidr`  | CIDR block for the first public subnet     | `10.0.1.0/24`         |
| `public_subnet_2_cidr`  | CIDR block for the second public subnet    | `10.0.2.0/24`         |
| `public_subnet_3_cidr`  | CIDR block for the third public subnet     | `10.0.3.0/24`         |
| `private_subnet_1_cidr` | CIDR block for the first private subnet    | `10.0.1.0/24`       |
| `private_subnet_2_cidr` | CIDR block for the second private subnet   | `10.0.2.0/24`       |
| `private_subnet_3_cidr` | CIDR block for the third private subnet    | `10.0.3.0/24`       |
| `ami`                   | Amazon Machine Image (AMI) for EC2 instances | `ami-0abcdef1234567890` |
| `key_name`              | Name of the AWS key pair for EC2 instances | `my-key-pair`         |

