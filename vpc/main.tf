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

resource "aws_subnet" "public_subnet" {
  count = length(var.public_subnets_cidr)
  vpc_id = aws_vpc.main.id
  availability_zone = local.azs_list[count.index]
  cidr_block = var.public_subnets_cidr[count.index]
  tags = merge(
    var.common_tags,
    var.public_subnets_tags,
    {
        Name = "${var.project_name}-${var.environment}-public-${local.azs_list[count.index]}"
    }
  )
}

resource "aws_subnet" "private_subnet" {
  count = length(var.private_subnets_cidr)
  vpc_id = aws_vpc.main.id
  availability_zone = local.azs_list[count.index]
  cidr_block = var.private_subnets_cidr[count.index]
  tags = merge(
    var.common_tags,
    var.private_subnets_tags,
    {
        Name = "${var.project_name}-${var.environment}-private-${local.azs_list[count.index]}"
    }
  )
}