# Auto-generated Provider File
provider "aws" {
  region = "us-west-2"
  assume_role {
    role_arn = "arn:aws:iam::996122083346:role/InfraOrchestrator-Deploy-Role"
  }
  default_tags {
    tags = {
      Requester = "81135dfa-0021-70de-c8af-d63caf7885ba"
      JobId = "d6fc90dc-e61e-4d0c-800a-8af8379006e9"
      ManagedBy = "InfraOrchestrator"
    }
  }
}
