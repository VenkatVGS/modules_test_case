module "vpc" {
  source = "./modules/vpc"
  aws_region = var.aws_region_out
  cidr_vpc = var.cidr_vpc_out
  subpub1 = var.subpub1_out
  subpub2 = var.subpub2_out
  subpvt1 = var.subpvt1_out
  subpvt2 = var.subpvt2_out
  az_sub_pub1 = var.az_sub_pub1_out
  az_sub_pub2 = var.az_sub_pub2_out
  az_sub_pvt1 = var.az_sub_pvt1_out
  az_sub_pvt2 = var.az_sub_pvt2_out
  availability_zone = var.availability_zone_out

}

module "ec2" {
  source = "./modules1/ec2"
  ami_id = var.ami_id_out
  instance_type = var.instance_type_out
  pub_seg_sg_id = module.vpc.pub_seg_sg_id
  pubsub1_id  = module.vpc.pubsub1_id
  pubsub2_id  = module.vpc.pubsub2_id
  # vpc_security_group_ids = module.vpc.public_sg_id
  vpc_security_group_ids = [module.vpc.public_sg_id]

}

module "db" {
  source = "./modules2/db"
  db_username = var.db_username_out
  db_password = var.db_password_out
  pvtsub1_id = module.vpc.pvtsub1_id
  pvtsub2_id = module.vpc.pvtsub2_id
  pvt_seg_sg_id  = module.vpc.pvt_seg_sg_id
  availability_zone = var.availability_zone_out

}

module "elb" {
  source = "./modules3/elb"
  load_balancer = var.load_balancer_out
  vpc_id = module.vpc.vpc_id  # Pass the VPC ID from the vpc module
  pub_seg_sg_id = module.vpc.pub_seg_sg_id
  pubsub1_id  = module.vpc.pubsub1_id
  pubsub2_id  = module.vpc.pubsub2_id
  web1_id   = module.ec2.web1_id
  web2_id   = module.ec2.web2_id
}