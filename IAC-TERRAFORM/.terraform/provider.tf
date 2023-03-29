provider "aws" {
    region = var.aws_region
}

terraform {
    backend "s3"{
      bucket = "terraform-state-igti-vcoelhomac"
      key = "state/igit/edc/mod1/terraform.tfstate"
      region = "us-east-2"
    }
}
