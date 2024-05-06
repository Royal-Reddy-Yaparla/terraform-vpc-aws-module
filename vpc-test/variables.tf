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

variable "database_subnets_cidr" {
  default = ["10.0.21.0/24","10.0.22.0/24"]
}

variable "is_vpc_peering_required" {
  default = true
}
variable "acceptor_vpc_id" {
  default = ""
}