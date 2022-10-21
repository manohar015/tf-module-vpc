resource "aws_subnet" "main" {
  count               = length(var.PUBLIC_SUBNET_CIDR)
  vpc_id              = aws_vpc.main.id
  cidr_block          = element(var.PUBLIC_SUBNET_CIDR, count.index)
  availability_zone   = element(var.AZ, count.index)

  tags = {
    Name = "${var.ENV}"
  }
}
