terraform {
  backend "gcs" {
    bucket = "tfstate-terraform-dev"
    prefix = "env/dev"
  }
}
