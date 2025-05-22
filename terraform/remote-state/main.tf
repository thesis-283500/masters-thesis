# Configure the AWS Provider
provider "aws" {
  region = "eu-central-1"
  profile = "default"
}

resource "aws_s3_bucket" "tfstate-bucket-283500" {
    bucket = "tfstate-bucket-283500"

    lifecycle {
        prevent_destroy = true
    }
}

resource "aws_s3_bucket_versioning" "tfstate-bucket-version-283500" {
    bucket = aws_s3_bucket.tfstate-bucket-283500.id
    
    versioning_configuration {
        status = "Enabled"
    }
}
