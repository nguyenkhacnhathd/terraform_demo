variable "cidr_block" {
  type    = string
  default = "10.0.0.0/16"
}

variable "public_subnet1" {
  type    = string
  default = "10.0.1.0/24"
}

variable "public_subnet2" {
  type    = string
  default = "10.0.2.0/24"
}

variable "private_subnet1" {
  type    = string
  default = "10.0.3.0/24"
}

variable "private_subnet2" {
  type    = string
  default = "10.0.4.0/24"
}

variable "region_name" {
  type = string
}