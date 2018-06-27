# Create a new instance of the latest Ubuntu 14.04 on an
# t2.micro node with an AWS Tag naming it "HelloWorld"
provider "aws" {
  region = "eu-west-1"
#  access_key = "${var.access_key}"
#  secret_key = "${var.secret_access_key}"
access_key=""
secret_key=""

}
data "aws_ami" "amazon_linux" {
most_recent = true
filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
	 filter {
     name   = "name"
     values = ["amzn-ami-hvm-*-x86_64-gp2"]
  }
  }
resource "aws_instance" "web" {
  ami			= "ami-ca0135b3" 
  instance_type = "t2.micro"
  key_name = "germany_soham"
  user_data = "${file("ss.txt")}"

  tags {
    Name = "Test Terraform AL"
  }
  
}

