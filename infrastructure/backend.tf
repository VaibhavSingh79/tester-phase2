terraform {
  backend "s3" {

    bucket  = "demo-terraform-state-bucket-vaibhav" # REPLACE WITH A REAL BUCKET NAME
    key     = "poc/terraform.tfstate"
    region  = "ap-south-1"
    encrypt = true
  }
}
