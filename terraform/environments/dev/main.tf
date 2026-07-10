module "vpc" {
  source = "../../modules/vpc"

  vpc_cidr = "10.0.0.0/16"
  name     = "dev-vpc"

  public_subnet_cidr       = "10.0.1.0/24"
  private_dev_subnet_cidr  = "10.0.2.0/24"
  private_prod_subnet_cidr = "10.0.3.0/24"

  az = "us-east-1a"
}

module "bastion" {
  source = "../../modules/bastion"

  ami_id           = "ami-02b2c1b57c5105166"
  instance_type    = "t3.micro"
  public_subnet_id = module.vpc.public_subnet_id
  key_name         = "bastion.host"
  security_group_id = module.security_groups.bastion_sg_id
}

module "security_groups" {
  source = "../../modules/security-groups"

  vpc_id = module.vpc.vpc_id

  my_ip = "168.182.93.132/32"
}

module "ec2" {
  source = "../../modules/ec2"

  ami_id            = "ami-02b2c1b57c5105166"
  instance_type     = "t3.micro"
  private_subnet_id = module.vpc.private_dev_subnet_id
  key_name          = "dev.server"

  security_group_id = module.security_groups.private_instance_sg_id
}
 
module "monitoring" {
  source = "../../modules/monitoring"
}
