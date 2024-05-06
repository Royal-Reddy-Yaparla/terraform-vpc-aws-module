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


variable "project_name" {
  type = string
  default = "robokart"
}

variable "environment" {
  type = string
  default = "dev"
}