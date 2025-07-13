provider "aws" {
  region = var.aws_region
}

module "vpc" {
  source = "./modules/vpc"
}

module "subnet" {
  source = "./modules/subnet"
  vpc_id = module.vpc.vpc_id
}

module "security_group" {
  source = "./modules/security_group"
  vpc_id = module.vpc.vpc_id
}

module "ec2" {
  source = "./modules/ec2"
  subnet_id = module.subnet.public_subnet_id
  security_group_id = module.security_group.security_group_id
  ami_id = data.aws_ami.latest_amazon_linux.id
}

module "rds" {
  source = "./modules/rds"
  private_subnets = module.subnet.private_subnet_ids
  security_group_id = module.security_group.security_group_id
}