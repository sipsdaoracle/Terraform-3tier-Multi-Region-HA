terraform {
  backend "s3" {
    bucket         = "XXXXXXXXXXXXXXXXXXXXXXXXX"
    key            = "multi-region-ha/terraform.tfstate"
    region         = "us-east-1"
    encrypt        = true
    dynamodb_table = "terraform-state-lock"
  }
}
