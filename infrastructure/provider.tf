# Auto-generated Provider File
provider "aws" {
  region = "us-west-2"
  assume_role {
    role_arn = "arn:aws:iam::996122083346:role/InfraOrchestrator-Deploy-Role"
  }
  default_tags {
    tags = {
      Requester = "81135dfa-0021-70de-c8af-d63caf7885ba"
      JobId = "5093098e-7543-4d9d-85b1-aea6e85f2ce3"
      ManagedBy = "InfraOrchestrator"
    }
  }
}
