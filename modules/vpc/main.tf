module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = "${var.project_name}-${var.environment}-vpc"
  cidr = var.vpc_cidr

  # Fixed AZs
  azs = ["eu-west-1a", "eu-west-1b"]

  public_subnets  = var.public_subnets
  private_subnets = var.private_subnets

  enable_nat_gateway = true
  single_nat_gateway = true
  enable_vpn_gateway = false

  # Gateway naming
  igw_tags = {
    Name = "${var.project_name}-${var.environment}-igw"
  }

  nat_gateway_tags = {
    Name = "${var.project_name}-${var.environment}-nat"
  }

  # Subnet naming
  public_subnet_names = [
    "${var.project_name}-${var.environment}-eu-west-1a",
    "${var.project_name}-${var.environment}-eu-west-1b"
  ]

  private_subnet_names = [
    "${var.project_name}-${var.environment}-eu-west-2a",
    "${var.project_name}-${var.environment}-eu-west-2b"
  ]

  tags = {
    Project     = var.project_name
    Environment = var.environment
    ManagedBy   = "terraform"
  }
}