variable "cidr_block" {
  type = string
  default = "10.0.0.0/16"
}

variable "vpc_name" {
  type = string
  default = "robokart"
}

variable "vpc_env" {
  type = string
  default = "dev"
}

variable "project_name" {
  type = string
  default = "robokart"
}

variable "enable_dns_hostnames" {
  type = bool
  default = "true"
}