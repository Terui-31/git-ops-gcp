terraform {
  backend "gcs" {
    bucket = "dev-terraform-confs"
    location = "asia-northeast1"
  }
}
