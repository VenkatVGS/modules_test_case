#DB_USERNAME
variable db_username {
  type        = string
  description = "description"
  # default     = "admin"
}

#DB_PASS
variable db_password {
  type        = string
  description = "description"
  # default     = "admin123"
}

variable "pvtsub1_id" {}
variable "pvtsub2_id" {}

variable "pvt_seg_sg_id" {}

variable "availability_zone" {
  description = "The availability zone for the RDS instance"
  type        = string
}