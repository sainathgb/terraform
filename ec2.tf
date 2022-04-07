resource "aws_instance" "public" {
  ami           = "ami-00ee4df451840fa9d"
  instance_type = "t2.micro"
  subnet_id = aws_subnet.public_subnet.id
  root_block_device {
      volume_size = 8
      volume_type = "gp2"
  }
  vpc_security_group_ids = [aws_security_group.terraforms.id]
  key_name = "keyy"
  tags = {
    Name = "public-instances"
  }
}
resource "aws_instance" "private" {
  ami           = "ami-00ee4df451840fa9d"
  instance_type = "t2.micro"
  subnet_id = aws_subnet.private_subnet.id
  root_block_device {
      volume_size = 8
      volume_type = "gp2"
  }
  vpc_security_group_ids = [aws_security_group.terraforms.id]
  key_name = "keyy"
  tags = {
    Name = "private-instances"
  }
}
