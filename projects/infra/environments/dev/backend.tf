terraform {
  backend "gcs" {
    bucket = "tfstate-terraform-dev"
    prefix = "dev"
  }
}
