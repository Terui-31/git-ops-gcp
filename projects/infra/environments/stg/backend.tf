terraform {
  backend "gcs" {
    bucket = "tfstate-terraform-stg"
    prefix = "stg"
  }
}
