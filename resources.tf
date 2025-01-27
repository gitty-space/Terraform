resource "aws_instance" "web" {
   count = 1 
   ami  = "${var.ami}"
   instance_type = "t2.micro"
   key_name = "${var.key_name}"
   subnet_id = element([aws_subnet.public-subnet-1.id, aws_subnet.public-subnet-2.id, aws_subnet.public-subnet-3.id], count.index)
   vpc_security_group_ids = ["${aws_security_group.sg-web.id}"]
   associate_public_ip_address = true
  #  user_data = "${file("install.sh")}"
   tags = {
     Name = "webserver"
   }
}

