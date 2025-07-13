resource "aws_subnet" "public" {
  vpc_id = var.vpc_id
  cidr_block = "10.0.1.0/24"
  map_public_ip_on_launch = true
  availability_zone = "ap-northeast-1a"
}

resource "aws_subnet" "private_1" {
  vpc_id = var.vpc_id
  cidr_block = "10.0.2.0/24"
  availability_zone = "ap-northeast-1a"
}

resource "aws_subnet" "private_2" {
  vpc_id = var.vpc_id
  cidr_block = "10.0.3.0/24"
  availability_zone = "ap-northeast-1c"
}

output "public_subnet_id" {
  value = aws_subnet.public.id
}

output "private_subnet_ids" {
  value = [aws_subnet.private_1.id, aws_subnet.private_2.id]
}