locals {
  azs_list = slice(data.aws_availability_zones.azs.names,0,2)
}