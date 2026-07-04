module "vpc" {
  source = "../../modules/vpc"

  vpc_cidr = "10.0.0.0/16"
  name     = "dev-vpc"

  public_subnet_cidr       = "10.0.1.0/24"
  private_dev_subnet_cidr  = "10.0.2.0/24"
  private_prod_subnet_cidr = "10.0.3.0/24"

  az = "us-east-1a"
}
