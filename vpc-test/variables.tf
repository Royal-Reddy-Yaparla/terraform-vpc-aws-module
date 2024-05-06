variable "common_tags" {
  default = {
    project_name = "robokart"
    environment = "dev"
    terraform = "true"
  }
}

variable "vpc_tags" {
  type = map 
  default = {
    created_by = "Royal"
  }
}

variable "internet_gateway_tags" {
  type = map 
  default = {
    created_by = "Royal"
  }
}

variable "project_name" {
  type = string
  default = "robokart"
}

variable "environment" {
  type = string
  default = "dev"
}

variable "public_subnets_cidr" {
  default = ["10.0.1.0/24","10.0.2.0/24"]
}

variable "private_subnets_cidr" {
  default = ["10.0.11.0/24","10.0.12.0/24"]
}