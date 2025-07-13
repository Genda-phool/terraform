resource "aws_db_subnet_group" "default" {
  name       = "default-subnet-group"
  subnet_ids = var.private_subnets
}

resource "aws_db_instance" "laravel" {
  allocated_storage    = 20
  engine               = "mysql"
  engine_version       = "8.0"
  instance_class       = "db.t3.micro"
  username             = "admin"
  password             = "admin1234"
  db_subnet_group_name = aws_db_subnet_group.default.name
  skip_final_snapshot  = true
  vpc_security_group_ids = [var.security_group_id]
}