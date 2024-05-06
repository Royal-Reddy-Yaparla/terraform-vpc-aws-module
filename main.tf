resource "aws_vpc" "main" {
  cidr_block       = var.cidr_block
  instance_tenancy = "default"
  enable_dns_hostnames = var.enable_dns_hostnames

  tags = {
    Name = "${var.vpc_name}-${var.vpc_env}"
    Environment = var.vpc_env
    Terraform = "True"
    Project= var.project_name
  }
}