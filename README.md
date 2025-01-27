# Terraform AWS Infrastructure

This Terraform code provisions resources within AWS to create a **Virtual Private Cloud (VPC)** with both **public** and **private subnets** across multiple availability zones. It also provisions an **EC2 instance** that will later run **nginx** on port 80, ensuring that the instance is accessible over HTTP by IP address.

## Requirements

- VPC with CIDR block `10.0.0.0/16`
- Three public subnets across different availability zones within the VPC
- Three private subnets across different availability zones within the VPC
- Instances in public subnets will have internet access, while instances in private subnets will not have direct internet connectivity
- Code should be parameterized for reusability and flexibility
- EC2 instance provisioned for running **nginx** (HTTP on port 80)
  
## Terraform Resources

- **aws_vpc**: Defines a VPC with CIDR block `10.0.0.0/16`.
- **aws_subnet**: Creates three public and three private subnets across multiple availability zones.
- **aws_internet_gateway**: Ensures public subnets have internet access.
- **aws_route_table**: Configures routing for public subnets.
- **aws_security_group**: Defines security groups to allow HTTP access (port 80) and SSH (port 22).
- **aws_ec2_instance**: Provisions an EC2 instance with the necessary configurations for running nginx.

 