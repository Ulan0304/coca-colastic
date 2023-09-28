terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.17.0"
    }
  }
}

provider "aws" {
  # Configuration options
  region = "us-east-1"
}

variable "vpc" {
  type = string
  default = "10.0.0.0/16"
  }

variable "subnet_a" {
  type = string
  default = "10.0.1.0/24"
}

variable "subnet_b" {
  type = string
  default = "10.0.2.0/24"
}

#################################################

resource "aws_vpc" "tf-vpc-1" {
  cidr_block = var.vpc
}

resource "aws_subnet" "subnet_a" {
  vpc_id     = aws_vpc.tf-vpc-1.id
  cidr_block = var.subnet_a

  tags = {
    Name = "subnet_a"
  }
}

resource "aws_subnet" "subnet_b" {
  vpc_id     = aws_vpc.tf-vpc-1.id
  cidr_block = var.subnet_b

  tags = {
    Name = "subnet_b"
  }
}