# Auto-generated Provider File
provider "aws" {
  region = "us-west-2"
  assume_role {
    role_arn = "arn:aws:iam::996122083346:role/InfraOrchestrator-Deploy-Role"
  }
  default_tags {
    tags = {
      Requester = "81135dfa-0021-70de-c8af-d63caf7885ba"
      JobId = "fc9f0f57-fbb4-4bb4-aad6-dd54dad1441c"
      ManagedBy = "InfraOrchestrator"
    }
  }
}
