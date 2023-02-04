output "vpc_cidr" {
    value = var.vpc_cidr
}

/* output "vpc_instance_tenancy" {
    value = var.vpc_instance_tenancy
} */

output "vpc_region" {
    value = var.vpc_region
}

output "modular_project" {
    value = var.modular_project
}

output "modules_private1_cidr_block" {
    value = var.modules_private1_cidr_block
}

output "modules_private1_availability_zone" {
    value = var.modules_private1_availability_zone
}

output "modules_private2_cidr_block" {
    value = var.modules_private2_cidr_block
}

output "vpc_id" {
    value = aws_vpc.modules.id
}

output "modules_private1_subnet_id" {
    value = aws_subnet.modules_private1.id
}

output "modules_private2_subnet_id" {
    value = aws_subnet.modules_private2.id
}

output "modules_public1_subnet_id" {
    value = aws_subnet.modules_public1.id
}

output "modules_public2_subnet_id" {
    value = aws_subnet.modules_public2.id
}

output "internet_gateway" {
    value = aws_internet_gateway.modules_igw
}