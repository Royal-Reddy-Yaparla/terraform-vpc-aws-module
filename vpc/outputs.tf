output "vpc_id" {
  value = aws_vpc.main.id
}

output "internet_gateway_id" {
  value = aws_internet_gateway.igt.id
}

# output "public_subnet_ids" {
#   value = aws_subnet.public_subnet.id
# }

output "availability_zones" {
  value = data.aws_availability_zones.azs.names
}