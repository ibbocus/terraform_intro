# This is to store the variables


variable "region" {
    type = string
    default = "eu-west-1"
}

variable "subnet_region" {
    type = string
    default = "eu-west-1a"
}


variable "ami_id" {
    type = string
    default = "ami-0db1b428b8d9e916d"
}


variable "instance_name" {
    type = string
    default = "Eng67.Ibrahim.App.Terraform"
}


variable "instance_type" {
    type = string
    default = "t2.micro"
}

variable "vpc_id" {
    type = string
    default = "vpc-07e47e9d90d2076da"
}


variable "cidr_block" {
    type = string
    default = "172.31.171.0/24"
}

variable "public_subnet_name" {
    type = string
    default = "Eng67.Ibrahim.Public.Terraform"
}


