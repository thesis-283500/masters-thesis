terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
  backend "s3" {
    bucket       = "tfstate-bucket-283500"
    key          = "tfstate-eu-west-1"
    region       = "eu-central-1"
    use_lockfile = true
  }

}

# Configure the AWS Provider
provider "aws" {
  region  = var.region
  profile = "default"
}

module "eks" {
  source = "../../modules/eks"
  region = var.region
}
