resource "aws_vpc" "main" {
  cidr_block       = var.cidr_block
  instance_tenancy = "default"
  enable_dns_hostnames = var.enable_dns_hostnames

  tags = merge(
    var.common_tags,var.vpc_tags,
    {
        Name = "${var.project_name}-${var.environment}"
    }
  )
}

resource "aws_internet_gateway" "igt" {
  vpc_id = aws_vpc.main.id
  tags = merge(
    var.common_tags,
    var.igt_tags,
    {
        Name = "${var.project_name}-${var.environment}"
    }
  )
}