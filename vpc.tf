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

resource "aws_subnet" "public-subnet-1" {
  vpc_id = "${aws_vpc.vpc-dev.id}"
  cidr_block = "${var.public_subnet_1_cidr}"
  map_public_ip_on_launch = true
  availability_zone = "us-east-1a"
  tags = {
    Name = "dev-pb-sb-us-east-1a"
    environment = "dev"
    owner = "aravetiamulya@gmail.com"
  }
}

resource "aws_subnet" "public-subnet-2" {
  vpc_id = "${aws_vpc.vpc-dev.id}"
  cidr_block = "${var.public_subnet_2_cidr}"
  map_public_ip_on_launch = true
  availability_zone = "us-east-1b"
  tags = {
    Name = "dev-pb-sb-us-east-1b"
    environment = "dev"
    owner = "aravetiamulya@gmail.com"
  }
}

resource "aws_subnet" "public-subnet-3" {
  vpc_id = "${aws_vpc.vpc-dev.id}"
  cidr_block = "${var.public_subnet_3_cidr}"
  map_public_ip_on_launch = true
  availability_zone = "us-east-1c"
  tags = {
    Name = "dev-pb-sb-us-east-1c"
    environment = "dev"
    owner = "aravetiamulya@gmail.com"
  }
}


resource "aws_subnet" "private-subnet-1" {
  vpc_id = "${aws_vpc.vpc-dev.id}"
  cidr_block = "${var.private_subnet_1_cidr}"
  availability_zone = "us-east-1a"
  tags = {
    Name = "dev-pr-sb-us-east-1a"
    environment = "dev"
    owner = "aravetiamulya@gmail.com"
  }
}

resource "aws_subnet" "private-subnet-2" {
  vpc_id = "${aws_vpc.vpc-dev.id}"
  cidr_block = "${var.private_subnet_2_cidr}"
  availability_zone = "us-east-1b"
  tags = {
    Name = "dev-pr-sb-us-east-1b"
    environment = "dev"
    owner = "aravetiamulya@gmail.com"
  }
}

resource "aws_subnet" "private-subnet-3" {
  vpc_id = "${aws_vpc.vpc-dev.id}"
  cidr_block = "${var.private_subnet_3_cidr}"
  availability_zone = "us-east-1c"
  tags = {
    Name = "dev-pr-sb-us-east-1c"
    environment = "dev"
    owner = "aravetiamulya@gmail.com"
  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = "${aws_vpc.vpc-dev.id}"
  tags = {
    Name = "igw-vpc-dev-us-east-1"
    environment = "dev"
    owner = "aravetiamulya@gmail.com"
  }
}


resource "aws_route_table" "web-public-rt" {
  vpc_id = "${aws_vpc.vpc-dev.id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.igw.id}"
  }

  tags = {
    Name = "web-pub-rt-us-east-1"
    environment = "dev"
    owner = "aravetiamulya@gmail.com"
  }
}

resource "aws_route_table_association" "web-public-rt-assoc_1" {
  subnet_id      = aws_subnet.public-subnet-1.id
  route_table_id = aws_route_table.web-public-rt.id
}

resource "aws_route_table_association" "web-public-rt-assoc_2" {
  subnet_id      = aws_subnet.public-subnet-2.id
  route_table_id = aws_route_table.web-public-rt.id
}

resource "aws_route_table_association" "web-public-rt-assoc_3" {
  subnet_id      = aws_subnet.public-subnet-3.id
  route_table_id = aws_route_table.web-public-rt.id
}
