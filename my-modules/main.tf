terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

# create vpc
module "vpc" {
    source = "../modules_1/vpc"
    vpc_cidr = var.vpc_cidr
    vpc_region = var.vpc_region
    #vpc_instance_tenancy = var.vpc_instance_tenancy
    modular_project = var.modular_project
    modules_private1_cidr_block = var.modules_private1_cidr_block
    modules_private1_availability_zone = var.modules_private1_availability_zone
    modules_private2_cidr_block = var.modules_private2_cidr_block
    modules_private2_availability_zone = var.modules_private2_availability_zone
    modules_publi1_cidr_block = var.modules_publi1_cidr_block
    modules_public1_availability_zone = var.modules_public1_availability_zone
    modules_publi2_cidr_block = var.modules_publi2_cidr_block
    modules_public2_availability_zone = var.modules_public2_availability_zone

    }