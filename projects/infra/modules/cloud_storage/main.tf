resource "google_storage_bucket" "terraform-state-store-2" {
  name     = "${var.env}-sample-bucket-2"
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

# resource "google_compute_instance" "default" {
#   name         = "test"
#   machine_type = "e2-medium"
#   zone         = "us-central1-a"

#   tags = ["foo", "bar"]

#   boot_disk {
#     initialize_params {
#       image = "debian-cloud/debian-11"
#       labels = {
#         my_label = "value"
#       }
#     }
#   }
# }
