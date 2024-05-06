data "aws_availability_zones" "azs" {
  state = "available"
}

data "aws_vpc" "default" {
  default = true
}
