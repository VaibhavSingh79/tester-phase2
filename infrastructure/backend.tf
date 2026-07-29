terraform {
  backend "s3" {
    bucket  = "996122083346-infraorchestrator-tfstate"
    key     = "VaibhavSingh79-tester-phase2/terraform.tfstate"
    region  = "ap-south-1"
    encrypt = true
    dynamodb_table = "infraorchestrator-tf-locks"
    assume_role = {
      role_arn = "arn:aws:iam::996122083346:role/InfraOrchestrator-Deploy-Role"
    }
  }
}
