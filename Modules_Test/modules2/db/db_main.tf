resource "aws_db_instance" "rds" {
  allocated_storage    = 10
  db_name              = "mydb"
  engine               = "mysql"
  engine_version       = "5.7"
  instance_class       = "db.t3.micro"
  username             = var.db_username
  password             = var.db_password
  skip_final_snapshot  = true
  vpc_security_group_ids = [var.pvt_seg_sg_id]
  availability_zone = var.availability_zone
  db_subnet_group_name = aws_db_subnet_group.dbsubnet.id
}
resource "aws_db_subnet_group" "dbsubnet" {
  name       = "main"
  subnet_ids = [var.pvtsub1_id, var.pvtsub2_id]

  tags = {
    Name = "My DB subnet group"
  }
}