terraform {
  required_version = ">= 1.0.0"
}

provider "random" {
}

provider "aws" {
  region = var.region
}