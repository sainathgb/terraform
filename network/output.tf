output "ec2_public-ip" {
  value = aws_instance.public.public_ip
}
output "ec2_private-ip" {
  value = aws_instance.private.public_ip
}