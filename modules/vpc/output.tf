output "vpc_id" {
  value = aws_vpc.myvpc.id
}

output "pub_seg_sg_id" {
  value = aws_security_group.pub-seg.id
}

output "pvt_seg_sg_id" {
  value = aws_security_group.pvt-seg.id
}

output "pvtsub1_id" {
  value = aws_subnet.pvtsub1.id
}

output "pvtsub2_id" {
  value = aws_subnet.pvtsub2.id
}

output "pubsub1_id" {
  value = aws_subnet.pubsub1.id
}

output "pubsub2_id" {
  value = aws_subnet.pubsub2.id
}

output "public_sg_id" {
  value = aws_security_group.pub-seg.id
}


