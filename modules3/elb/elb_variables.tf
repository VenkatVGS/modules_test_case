variable load_balancer  {
    type = string
}

variable "vpc_id" {
  description = "The ID of the VPC"
  type        = string
}

variable "pub_seg_sg_id" {}

variable "pubsub1_id" {}
variable "pubsub2_id" {}

variable "web1_id" {}
variable "web2_id" {}