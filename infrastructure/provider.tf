# Auto-generated Provider File
provider "aws" {
  region = "us-west-2"
  assume_role {
    role_arn = "arn:aws:iam::996122083346:role/InfraOrchestrator-Deploy-Role"
  }
  default_tags {
    tags = {
      Requester = "81135dfa-0021-70de-c8af-d63caf7885ba"
      JobId = "b4f3d336-332d-400d-bca2-754ccf7ee2df"
      ManagedBy = "InfraOrchestrator"
    }
  }
}
