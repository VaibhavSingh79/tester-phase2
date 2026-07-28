terraform {
  backend "s3" {
    bucket  = "996122083346-infraorchestrator-tfstate"
    key     = "VaibhavSingh79-tester-phase2/terraform.tfstate"
    region  = "us-west-2"
    encrypt = true
    dynamodb_table = "infraorchestrator-tf-locks"
  }
}
