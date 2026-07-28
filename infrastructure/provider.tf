# Auto-generated Provider File
provider "aws" {
  region = "us-west-2"
  assume_role {
    role_arn = "arn:aws:iam::996122083346:role/InfraOrchestrator-Deploy-Role"
  }
  default_tags {
    tags = {
      Requester = "81135dfa-0021-70de-c8af-d63caf7885ba"
      JobId = "f05b7577-2c5c-45d9-a473-4d25a1dd03d9"
      ManagedBy = "InfraOrchestrator"
    }
  }
}
