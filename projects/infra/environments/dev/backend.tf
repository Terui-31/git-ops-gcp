terraform {
  backend "gcs" {
    bucket = "tfstate-terraform-test"
    prefix = local.env
  }
}
