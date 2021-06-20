resource "aws_instance" "webserver" {
  # ami				          = "${lookup(var.amis, var.aws_region)}"
  ami				          = "ami-09a5b0b7edf08843d"
  availability_zone           = "us-east-1a"
  instance_type               = "t2.micro"
  key_name			          = "${var.key_name}"
  subnet_id                   = "${aws_subnet.subnet1-public.id}"
  vpc_security_group_ids      = ["${aws_security_group.allow_all.id}"]
  associate_public_ip_address = true
  user_data = "${file("install_apache.sh")}"
  
  tags = {
	Name  = "Hackathon-Demo"
	Evn   = "Dev"
	Owner = "Reddy"
  }
}

