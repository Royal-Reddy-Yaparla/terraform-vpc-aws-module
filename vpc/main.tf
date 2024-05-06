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
  map_public_ip_on_launch = true
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

resource "aws_subnet" "database_subnet" {
  count = length(var.database_subnets_cidr)
  vpc_id = aws_vpc.main.id
  availability_zone = local.azs_list[count.index]
  cidr_block = var.database_subnets_cidr[count.index]
  tags = merge(
    var.common_tags,
    var.database_subnets_tags,
    {
        Name = "${var.project_name}-${var.environment}-database-${local.azs_list[count.index]}"
    }
  )
}


resource "aws_route_table" "public_route" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block        = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igt.id
  }

  tags = merge(
    var.common_tags,
    var.public_route_table_tags,
    {
        Name = "${var.project_name}-public"
    }
  )
}

resource "aws_route_table_association" "public" {
  count = length(aws_subnet.public_subnet)
  subnet_id      = aws_subnet.public_subnet[count.index].id
  route_table_id = aws_route_table.public_route.id
}

