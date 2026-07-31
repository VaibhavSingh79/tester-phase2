# Auto-generated Provider File
provider "aws" {
  region = "us-west-2"
  assume_role {
    role_arn = "arn:aws:iam::996122083346:role/InfraOrchestrator-Deploy-Role"
  }
  default_tags {
    tags = {
      Requester = "81135dfa-0021-70de-c8af-d63caf7885ba"
      JobId = "6cf6d932-0daf-4597-b1b3-181ba8f9d1a7"
      ManagedBy = "InfraOrchestrator"
    }
  }
}
