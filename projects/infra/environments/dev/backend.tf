terraform {
  backend "gcs" {
    bucket = "terraform-confs"
    key = "tfstate/dev/terraform.tfstate"
    # region = "asia-northeast1"
  }
}
