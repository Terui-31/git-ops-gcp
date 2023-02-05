provider "google" {
  project = var.common_vars.project_id[var.env]
  region  = local.location
  zone = local.zone
}
