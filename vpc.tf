resource "aws_vpc" "vpc-dev" {
  cidr_block = "${var.vpc_cidr}"
  enable_dns_support   = true
  enable_dns_hostnames = true
  tags = {
    Name = "vpc-dev-us-east-1"
    environment = "dev"
    owner = "aravetiamulya@gmail.com"
  }
}
 