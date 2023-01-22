locals {
    services = toset([
        "bigquery.googleapis.com",
        "dlp.googleapis.com",
        "cloudbuild.googleapis.com",
        "iam.googleapis.com",
    ])
    subnet_front = "projects/${var.sharedvpc_project}/regions/${var.sharedvpc_region}/subnetworks/${var.sharedvpc_front}"
}

# enable gcp apis
resource "google_project_service" "apis" {
    project = var.project_id
    for_each = local.services
    service = each.value
    disable_dependent_services = true
}

resource "google_compute_shared_vpc_service_project" "vpc" {
    host_project = var.sharedvpc_project
    service_project = var.project_id
}

module "web_server" {
    source = "../../modules/web_server"

    project = var.project_id
    env = var.env
    zone = var.zone
    subnet = local.subnet_front

    depends_on = [
      google_compute_shared_vpc_service_project.vpc
    ]
}

module "lb-http" {
    source = "../../modules/lb-http"

    project_id = var.project_id
    env = var.env
    vpc_host_project = var.sharedvpc_project
    vpc_network = var.sharedvpc_name

    service_port = 80
    service_port_name = "port-http-${var.env}"
    backend_mig = module.web_server.mig.id

    depends_on = [
      module.web_server
    ]
}
