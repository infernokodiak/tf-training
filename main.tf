#
# DO NOT DELETE THESE LINES!
#
# Your subnet ID is:
#
#     subnet-d56fbc8e
#
# Your security group ID is:
#
#     sg-57e40c2a
#
# Your AMI ID is:
#
#     ami-c9580bde
#
# Your Identity is:
#
#     datapipe-orca
#

# AKIAINNPAA6KLBVKBGKQ
# 64OxnZc+knmiXB0LD2rwDvM9WSeZn+rr4GbEfNZK

variable "access_key" {}
variable "secret_key" {}
variable "region" {
  default = "us-east-1"
}

provider "aws" {
  access_key = "${var.access_key}"
  secret_key = "${var.secret_key}"
  region     = "${var.region}"
}


resource "aws_instance" "web" {
  count         = "1"
  ami           = "ami-c9580bde"
  instance_type = "t2.micro"

  tags {
    Name     = "johns-machine"
    Identity = "datapipe-orca"
    soda     = "coke"
    environment = "dev"
  }

  subnet_id              = "subnet-d56fbc8e"
  vpc_security_group_ids = ["sg-57e40c2a"]
}

output "public_ip" {
   value = ["${(aws_instance.web.*.public_ip)}"]
}

output "public_dns" {
   value = ["${aws_instance.web.*.public_dns}"]
}{
