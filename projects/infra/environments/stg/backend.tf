terraform {
  backend "gcs" {
    bucket = "tfstate-terraform-stg"
    prefix = "env/stg"
  }
}
