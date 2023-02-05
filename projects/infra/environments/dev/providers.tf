provider "google" {
  project = var.common_vars.project_id
  region  = local.location
  zone = local.zone
}
