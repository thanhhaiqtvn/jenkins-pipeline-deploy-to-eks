terraform {
  backend "s3" {
    bucket = "primuslearning-app-demo"
    region = "us-east-2"
    key = "eks/terraform.tfstate"
  }
}