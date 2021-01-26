provider "aws" {
  region = "${var.region}"
}

terraform {
  backend "s3" {
    bucket = "wiproraja-1212"
    key    = "terraform.tfstate"
    region = "us-east-1"
  }
}
