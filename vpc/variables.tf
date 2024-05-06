variable "cidr_block" {
  type = string
  default = "10.0.0.0/16"
}

variable "common_tags" {
  type = map 
  default = {}
}

variable "vpc_tags" {
  type = map 
  default = {}
}

variable "igt_tags" {
  type = map 
  default = {}
}

variable "public_subnets_tags" {
  type = map 
  default = {}
}

variable "private_subnets_tags" {
  type = map 
  default = {}
}

variable "database_subnets_tags" {
  type = map 
  default = {}
}

variable "public_route_table_tags" {
  type = map 
  default = {}
}

variable "private_route_table_tags" {
  type = map 
  default = {}
}

variable "nat_gateway_tags" {
  type = map 
  default = {}
}


variable "project_name" {
  type = string
}

variable "environment" {
  type = string
}


variable "enable_dns_hostnames" {
  type = bool
  default = "true"
}

variable "public_subnets_cidr" {
  type = list
  default = []
}

variable "private_subnets_cidr" {
  type = list
  default = []
}

variable "database_subnets_cidr" {
  type = list
  default = []
}

variable "is_vpc_peering_required" {
  type = bool
  default = false
}

variable "acceptor_vpc_id" {
  type = string
  default = ""
}

variable "vpc_peering_tags" {
  type = map 
  default = {}
}

