resource "aws_route_table" "public-rt" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "${var.ENV}-pub-route-table"
  }
}

resource "aws_route_table_association" "public-rt-association" {
  subnet_id      = aws_subnet.foo.id
  route_table_id = aws_route_table.bar.id
}