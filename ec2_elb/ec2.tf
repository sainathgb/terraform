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
  user_data = <<EOF
#!/bin/bash
sudo yum update -y
sudo yum search nginx
sudo yum info nginx
sudo yum install nginx -y
EOF

  key_name = "keyy"
  tags = {
    Name = "private-instances"
  }
}


resource "aws_lb" "loadbalance" {
  name               = "loadbalance"
  internal           = false
  load_balancer_type = "application"
  security_groups    = ["${aws_security_group.loadbalance.id}"]
  subnets            = ["${aws_subnet.public_subnet.id}","${aws_subnet.public_subnet2.id}"]
}
resource "aws_lb_target_group" "target_group" {
    name        = "target-group"
    port        = 80
    protocol    = "HTTP"
    target_type = "instance"
    vpc_id      = "${aws_vpc.vpc.id}"
    health_check {
      matcher = "200-400"
      path    = "/"
    }
}

resource "aws_lb_target_group_attachment" "target_group_attach" {
  target_group_arn = aws_lb_target_group.target_group.arn
  target_id        = aws_instance.private.id
  port             = 80
}
resource "aws_lb_listener" "listener" {
  load_balancer_arn = aws_lb.loadbalance.arn
  port              = "80"
  protocol          = "HTTP"
  default_action {
    type             = "forward"
    target_group_arn = "${aws_lb_target_group.target_group.arn}"
  }
}