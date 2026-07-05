output "vpc_id" {
  value = aws_vpc.this.id
}

output "public_subnet_id" {
  value = aws_subnet.public.id
}

output "private_dev_subnet_id" {
  value = aws_subnet.private_dev.id
}

output "private_prod_subnet_id" {
  value = aws_subnet.private_prod.id
}

output "internet_gateway_id" {
  value = aws_internet_gateway.igw.id
}
