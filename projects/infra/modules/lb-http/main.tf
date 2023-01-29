# module "gce-lb-http" {
#   source            = "GoogleCloudPlatform/lb-http/google"
#   version           = "~> 6.0"
#   name              = "${var.env}-group-http-lb"
#   project           = var.project_id
#   target_tags       = ["allow-group-http-lb"]
#   firewall_projects = [var.vpc_host_project]
#   firewall_networks = [var.vpc_network]

#   backends = {
#     default = {
#       description                     = null
#       protocol                        = "HTTP"
#       port                            = var.service_port
#       port_name                       = "http"
#       timeout_sec                     = 10
#       connection_draining_timeout_sec = null
#       enable_cdn                      = false
#       security_policy                 = null
#       session_affinity                = null
#       affinity_cookie_ttl_sec         = null
#       custom_request_headers          = null
#       custom_response_headers         = null

#       health_check = {
#         check_interval_sec  = null
#         timeout_sec         = null
#         healthy_threshold   = null
#         unhealthy_threshold = null
#         request_path        = "/"
#         port                = var.service_port
#         host                = null
#         logging             = null
#       }

#       log_config = {
#         enable      = true
#         sample_rate = 1.0
#       }

#       groups = [
#         {
#           group                        = var.backend_mig
#           balancing_mode               = null
#           capacity_scaler              = null
#           description                  = null
#           max_connections              = null
#           max_connections_per_instance = null
#           max_connections_per_endpoint = null
#           max_rate                     = null
#           max_rate_per_instance        = null
#           max_rate_per_endpoint        = null
#           max_utilization              = null
#         }
#       ]

#       iap_config = {
#         enable               = false
#         oauth2_client_id     = null
#         oauth2_client_secret = null
#       }
#     }
#   }
# }
