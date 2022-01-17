variable "vpc_id" {
  type = string
}

variable "public_subnet1" {
  type = string
}

variable "instance_type" {
  type    = string
  default = "t3.micro"
}

variable "image_id" {
  type    = string
  default = "ami-032d6db78f84e8bf5"
}

variable "key_name" {
  type = string
}