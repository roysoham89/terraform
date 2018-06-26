# Create a new instance of the latest Ubuntu 14.04 on an
# t2.micro node with an AWS Tag naming it "HelloWorld"
provider "aws" {
  region = "us-east-1"
#  access_key = "${var.access_key}"
#  secret_key = "${var.secret_access_key}"
access_key="AKIAJ7PAOSLTFPQ3EWXQ"
secret_key="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"

}
data "aws_ami" "ubuntu" {
most_recent = true
filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-trusty-14.04-amd64-server-*"]
  }
  }
resource "aws_instance" "web" {
  #ami           = "ami-e5d9439a"
  ami			= "ami-a4dc46db" #ami-a4dc46db
  instance_type = "t2.micro"
  key_name = "germany_soham"
  user_data = "${file("C:/Users/sroy2/Desktop/ss.txt")}"

  tags {
    Name = "Test Terraform Ubuntu -2"
  }
  
}

