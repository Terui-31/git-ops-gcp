terraform {
  backend "gcs" {
    bucket = "tfstate-terraform-test"
    prefix = "${var.env}"
  }
}
