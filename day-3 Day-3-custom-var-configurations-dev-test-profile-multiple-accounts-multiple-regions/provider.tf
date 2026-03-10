provider "aws" {
  
}
provider "aws" {
  region  = "us-east-1"
  alias = "devops"
  profile = "dev-09"
}
provider "aws" {
  region  = "us-east-1"
  alias = "prod"
  profile = "prod-09"
}