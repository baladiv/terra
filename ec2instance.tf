variable "awsprops" {
    default = {
    region = "ap-south-1"
    vpc = "vpc-0f6f14df09870244a"
    ami = "ami-022d03f649d12a49d"
    itype = "t2.micro"
    subnet = "subnet-0f8ab3caffb7c5b48"
    publicip = true
    keyname = "terraform"
    secgroupname = "IAC-Sec-Group0980"
  }
}
resource "aws_security_group" "project-iac-sg" {
  name = lookup(var.awsprops, "secgroupname")
  description = lookup(var.awsprops, "secgroupname")
  vpc_id = lookup(var.awsprops, "vpc")
  
  ingress {
    from_port = 22
    protocol = "TCP"
    to_port = 22
    cidr_blocks = ["0.0.0.0/0"]
  }
   
  egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = ["0.0.0.0/0"]
  }

  lifecycle {
    create_before_destroy = true
  }
}


resource "aws_instance" "project-iac" {
  ami = lookup(var.awsprops, "ami")
  instance_type = lookup(var.awsprops, "itype")
  subnet_id = lookup(var.awsprops, "subnet") #FFXsubnet2
  associate_public_ip_address = lookup(var.awsprops, "publicip")
  key_name = lookup(var.awsprops, "keyname")


  vpc_security_group_ids = [
    aws_security_group.project-iac-sg.id
  ]
  root_block_device {
    delete_on_termination = true
    volume_size = 50
    volume_type = "gp2"
  }
  tags = {
    Name ="Testserver"
    Environment = "DEV"
    OS = "Linux"
    Managed = "IAC"
  }

  depends_on = [ aws_security_group.project-iac-sg ]
}



