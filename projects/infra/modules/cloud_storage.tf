resource "google_storage_bucket" "terraform-state-store" {
  name     = "${var.env}-terraform-bucket"
  location = "${var.location}"
  storage_class = "REGIONAL"

  versioning {
    enabled = true
  }

  lifecycle_rule {
    action {
      type = "Delete"
    }
    condition {
      num_newer_versions = 5
    }
  }
}
