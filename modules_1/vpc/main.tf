terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

# vpc
resource "aws_vpc" "modules" {
  cidr_block       = var.vpc_cidr
  instance_tenancy = "default"
 # region = "var.vpc_region"
  tags = {
    Name = "${var.modular_project}-vpc"
  }
}

# interget gateway
resource "aws_internet_gateway" "modules_igw" {
  vpc_id = aws_vpc.modules.id

  tags = {
    Name = "${var.modular_project}-igw"
  }
}

# elastic ip
resource "aws_eip" "modules_eip" {
  #instance = aws_instance.web.id
  vpc      = true
}

# nat gateway
resource "aws_nat_gateway" "modules_ngw" {
  allocation_id = aws_eip.modules_eip.id
  subnet_id     = aws_subnet.modules_public1.id

  tags = {
    Name = "${var.modular_project}-ngw"
  }

  # To ensure proper ordering, it is recommended to add an explicit dependency
  # on the Internet Gateway for the VPC.
  depends_on = [aws_internet_gateway.modules_igw]
}

# private subnets
resource "aws_subnet" "modules_private1" {
  vpc_id     = aws_vpc.modules.id
  cidr_block = var.modules_private1_cidr_block
  #availability_zone = data.aws_availability_zones.available.names[0]
  availability_zone = var.modules_private1_availability_zone

  tags = {
    Name = "${var.modular_project}-private1"
  }
}

resource "aws_subnet" "modules_private2" {
  vpc_id     = aws_vpc.modules.id
  cidr_block = var.modules_private2_cidr_block
  #availability_zone = data.aws_availability_zones.available.names[1]
  availability_zone = var.modules_private2_availability_zone

  tags = {
    Name = "${var.modular_project}-private2"
  }
}

# public subnet
resource "aws_subnet" "modules_public1" {
  vpc_id     = aws_vpc.modules.id
  cidr_block = var.modules_publi1_cidr_block
  #availability_zone = data.aws_availability_zones.available.names[0]
  availability_zone = var.modules_public1_availability_zone

  tags = {
    Name = "${var.modular_project}-public1"
  }
}

resource "aws_subnet" "modules_public2" {
  vpc_id     = aws_vpc.modules.id
  cidr_block = var.modules_publi2_cidr_block
  #availability_zone = data.aws_availability_zones.available.names[1]
  availability_zone = var.modules_public2_availability_zone

  tags = {
    Name = "${var.modular_project}-public2"
  }
}

# route table
resource "aws_route_table" "modules_route" {
  vpc_id = aws_vpc.modules.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.modules_igw.id
  }

   tags = {
    Name = "${var.modular_project}-pub-route-table"
  }
}

resource "aws_route_table" "modules_route1" {
  vpc_id = aws_vpc.modules.id

  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.modules_ngw.id
  }

   tags = {
    Name = "${var.modular_project}-priv-route-table"
  }
}

# route association
resource "aws_route_table_association" "private_asso" {
  subnet_id      = aws_subnet.modules_private1.id
  route_table_id = aws_route_table.modules_route1.id
}

resource "aws_route_table_association" "private_asso1" {
  subnet_id      = aws_subnet.modules_private2.id
  route_table_id = aws_route_table.modules_route1.id
}

resource "aws_route_table_association" "public_asso" {
  subnet_id      = aws_subnet.modules_public1.id
  route_table_id = aws_route_table.modules_route.id
}

resource "aws_route_table_association" "public_asso1" {
  subnet_id      = aws_subnet.modules_public2.id
  route_table_id = aws_route_table.modules_route.id
}