terraform {
  backend "gcs" {
    bucket = "tfstate-terraform-prd"
    prefix = "prd"
  }
}
