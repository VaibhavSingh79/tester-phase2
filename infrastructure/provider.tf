# Auto-generated Provider File
provider "aws" {
  region = "us-west-2"
  assume_role {
    role_arn = "arn:aws:iam::996122083346:role/InfraOrchestrator-Deploy-Role"
  }
  default_tags {
    tags = {
      Requester = "81135dfa-0021-70de-c8af-d63caf7885ba"
      JobId = "319c7611-27bc-420e-b16f-6a645c05c39b"
      ManagedBy = "InfraOrchestrator"
    }
  }
}
