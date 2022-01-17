terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "3.72.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region  = "ap-northeast-1"
  #profile = "default"
}

data "aws_region" "current" {}

variable "key_name" {
  type    = string
  default = ""
}

# network module
module "network" {
  source = "./network"

  region_name = data.aws_region.current.name
}

module "web" {
  source = "./web"

  vpc_id         = module.network.vpc_id
  public_subnet1 = module.network.public_subnet1
  key_name       = var.key_name
}

