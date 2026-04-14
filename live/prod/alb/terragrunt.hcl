include {
  path = find_in_parent_folders()
}

terraform {
  source = "../../../modules/alb"
}

dependency "vpc" {
  config_path = "../vpc"
}

dependency "sg" {
  config_path = "../security-groups"
}

inputs = {
  name              = "dev-alb"
  vpc_id            = dependency.vpc.outputs.vpc_id
  public_subnets    = dependency.vpc.outputs.public_subnets

  security_group_id = dependency.sg.outputs.security_group_ids["alb-sg"]
}