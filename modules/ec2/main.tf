resource "aws_instance" "web" {
  ami           = var.ami_id
  instance_type = "t2.micro"
  key_name      = "..."
  subnet_id     = var.subnet_id
  vpc_security_group_ids = [var.security_group_id]

  user_data = <<-EOF
              #!/bin/bash
              sudo yum update -y
              sudo yum install -y httpd php php-mysqlnd mariadb git
              systemctl start httpd
              systemctl enable httpd
              cd /var/www/html
              git clone https://github.com/laravel/laravel.git
              cd laravel
              composer install
            EOF
}

output "instance_id" {
  value = aws_instance.web.id
}
