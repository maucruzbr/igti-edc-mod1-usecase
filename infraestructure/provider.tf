provider "aws" {
  region = var.aws_region
}

# Centralizar o arquivo de controle de estado do terraform
terraform {
  backend "s3"{
    bucket = "terraform-state-edc-usecase"
    key = "state/igti/edc/mod1-usecase/terraform.tfstate"
    region = "sa-east-1"
  }
}