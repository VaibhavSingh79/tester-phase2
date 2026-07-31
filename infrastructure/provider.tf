# Auto-generated Provider File
provider "aws" {
  region = "us-west-2"
  assume_role {
    role_arn = "arn:aws:iam::996122083346:role/InfraOrchestrator-Deploy-Role"
  }
  default_tags {
    tags = {
      Requester = "81135dfa-0021-70de-c8af-d63caf7885ba"
      JobId = "e3e6c2b2-6621-4c2f-a9b1-db983fa6b989"
      ManagedBy = "InfraOrchestrator"
    }
  }
}
