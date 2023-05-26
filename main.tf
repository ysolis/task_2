provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "small" {
  ami = "ami-0123456789abcdef0"
  instance_type = "t2.micro"

  key_name = "my_key_pair"
  security_groups = ["default"]

  tags = {
    Name = "Small Instance"
  }
}

resource "aws_instance" "medium" {
  ami = "ami-0123456789abcdef0"
  instance_type = "p2.xlarge"

  key_name = "my_key_pair"
  security_groups = ["default"]

  tags = {
    Name = "Medium Instance"
  }

  tenancy = "dedicated"
}


resource "aws_instance" "large" {
  ami = "ami-0123456789abcdef0"
  instance_type = "m5.2xlarge"

  key_name = "my_key_pair"
  security_groups = ["default"]

  tags = {
    Name = "Large Instance"
  }

  tenancy = "dedicated"

  root_block_device {
    volume_size = 200
  }

  ebs_block_devices = [
    {
      device_name = "/dev/sdb"
      volume_size = 1000
      volume_type = "gp2"
    }
  ]
}
