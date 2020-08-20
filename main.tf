# This is to launch an AMI on AWS


# What do we want to do and where would we like to do it
# Syntax for terraform is similar to JSON


provider "aws" {
# Which  region do we have the AMI available
    region = var.region


}

# Create and instance - launch an instance from the AMI

resource "aws_instance" "app_instance" {
          ami          = var.ami_id
# What tpye of ec2 instance we want to create?
          instance_type = var.instance_type
# Assign public ip?
          associate_public_ip_address = true
          vpc_security_group_ids = ["${aws_security_group.HTTP-allowed.id}"]

          tags = {
              Name = var.instance_name
          }
}

resource "aws_subnet" "prod-subnet-public-1" {
    vpc_id = var.vpc_id
    cidr_block = var.cidr_block
    map_public_ip_on_launch = "true" 
    availability_zone = var.subnet_region    
    
    tags = {
        Name = var.public_subnet_name
    }
}


resource "aws_security_group" "HTTP-allowed" {
    vpc_id = var.vpc_id
    
    egress {
        from_port = 0
        to_port = 0
        protocol = -1
        cidr_blocks = ["0.0.0.0/0"]
    }    
    ingress {
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }    
    tags = {
        Name = "Eng67.Ibrahim.HTTP_Access_Allowed"
    }
}

# Create a subnet block of code
# attach this subnet to devopsstudents vpc
# create ingress block of code to allow port 80 0.0.0.0/0
# create Egress block of code to allow all out
