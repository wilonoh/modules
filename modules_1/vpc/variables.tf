/* variable "vpc_cidr" {
    default = "10.0.0.0/16"
    description = "variable for vpc cidr"
    type = string
} */
variable "vpc_cidr" {}

/* variable "vpc_instance_tenancy" {
    default = "default"
    description = "variable for vpc instance tenancy"
    type = string
} */
#variable "vpc_instance_tenancy" {}

/* variable "vpc_region" {
    default = "eu-west-2"
    description = "variable for vpc region"
    type = string
} */
variable "vpc_region" {}

variable "modular_project" {}

/* variable "modules_private1_cidr_block" {
    default = "10.0.1.0/24"
    description = "variable for modules_private1_cidr_block"
    type = string
} */
variable "modules_private1_cidr_block" {}

/* variable "modules_private1_availability_zone" {
    default = "eu-west-2a"
    description = "modules_private1_availability_zone"
    type = string
} */
variable "modules_private1_availability_zone" {}

/* variable "modules_private2_cidr_block" {
    default = "10.0.2.0/24"
    description = "variable for modules_private2_cidr_block"
    type = string
} */
variable "modules_private2_cidr_block" {}

/* variable "modules_private2_availability_zone" {
    default = "eu-west-2b"
    description = "modules_private2_availability_zone"
    type = string
} */
variable "modules_private2_availability_zone" {}

/* variable "modules_publi1_cidr_block" {
    default = "10.0.3.0/24"
    description = "variable for modules_public1_cidr_block"
    type = string
} */
variable "modules_publi1_cidr_block" {}

/* variable "modules_public1_availability_zone" {
    default = "eu-west-2a"
    description = "modules_public1_availability_zone"
    type = string
} */
variable "modules_public1_availability_zone" {}

/* variable "modules_publi2_cidr_block" {
    default = "10.0.4.0/24"
    description = "variable for modules_public2_cidr_block"
    type = string
} */
variable "modules_publi2_cidr_block" {}

/* variable "modules_public2_availability_zone" {
    default = "eu-west-2b"
    description = "modules_public2_availability_zone"
    type = string
} */
variable "modules_public2_availability_zone" {}