#--------------------------------------
# Variables
#--------------------------------------

locals {
    project_id = "gcp-git-ops"
    env = "dev"
    location = "asia-northeast1"
    zone  = "asia-northeast1-a"
    services = toset([
        # "cloudresourcemanager.googleapis.com",
        # "bigquery.googleapis.com",
        # "dlp.googleapis.com",
        # "cloudbuild.googleapis.com",
        # "iam.googleapis.com",
        "compute.googleapis.com",
    ])
    # subnet_front = "projects/${var.sharedvpc_project}/regions/${var.sharedvpc_region}/subnetworks/${var.sharedvpc_front}"
}


#--------------------------------------
# Enable APIs
#--------------------------------------

resource "google_project_service" "apis" {
    project = local.project_id
    for_each = local.services
    service = each.value
    # disable_dependent_services = true
}

# resource "time_sleep" "gcp_wait_crm_api_enabling" {
#   depends_on = [
#     google_project_service.apis
#   ]

#   create_duration = "1m"
# }


#--------------------------------------
# Deploy Modules
#--------------------------------------

module "common" {
  source = "../../../../common_modules"

  env = local.env
  location = local.location
  project_id = local.project_id
}

module "infrastructure" {
  source = "../../modules"

  env = local.env
  location = local.location
  # common_vars = module.common.common_vars
}


#--------------------------------------
# Deploy Modules
#--------------------------------------

# resource "google_compute_shared_vpc_service_project" "vpc" {
#     host_project = var.sharedvpc_project
#     service_project = var.project_id
# }

# module "web_server" {
#     source = "../../modules/web_server"

#     project = var.project_id
#     env = var.env
#     zone = var.zone
#     subnet = local.subnet_front

#     depends_on = [
#       google_compute_shared_vpc_service_project.vpc
#     ]
# }

# module "lb-http" {
#     source = "../../modules/lb-http"

#     project_id = var.project_id
#     env = var.env
#     vpc_host_project = var.sharedvpc_project
#     vpc_network = var.sharedvpc_name

#     service_port = 80
#     service_port_name = "port-http-${var.env}"
#     backend_mig = module.web_server.mig.id

#     depends_on = [
#       module.web_server
#     ]
# }
