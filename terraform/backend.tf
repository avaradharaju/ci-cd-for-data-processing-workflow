# Generated by Terragrunt. Sig: nIlQXj57tbuaRZEa
terraform {
  backend "gcs" {
    bucket = "datapipelines-ci-tfstate"
    prefix = "./terraform.tfstate"
  }
}
