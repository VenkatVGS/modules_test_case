#AMI
variable ami_id {
  type        = string
  description = "cidr"
  # default     = "ami-02b49a24cfb95941c" 
}

#Instance Type
variable instance_type {
  type        = string
  description = "cidr"
  # default     = "t2.micro" 
}

variable "pub_seg_sg_id" {}

variable "pubsub1_id" {}
variable "pubsub2_id" {}

variable "vpc_security_group_ids" {}