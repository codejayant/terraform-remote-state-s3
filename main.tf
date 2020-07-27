provider "aws" {
  region = "us-west-2"
}

# s3 resource to save state. This has to be created previously.
//resource "aws_s3_bucket" "terraform_remote_state_bucket" {
//  bucket = "tf-890890-remote-states"
//  region = "us-west-2"
//}

# This enable terraform to use s3 bucket for state capture.
terraform {
  backend "s3" {
    bucket = "tf-890890-remote-states"
    key = "aws_tf_remote_state.tfstates"
    region = "us-west-2"
  }
}

resource "aws_security_group" "security_group" {
  ingress {
    from_port = 22
    protocol = "TCP"
    to_port = 22
    cidr_blocks = ["0.0.0.0/0"]
    description = "ingress SG"
  }

  egress {
    from_port = 0
    protocol = "TCP"
    to_port = 0
    cidr_blocks = ["192.168.1.1/32"]
    description = "egress SG"
  }

  tags = {
    Name="AWS SG"
  }
}