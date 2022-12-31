variable "host_project" {
  description = "ID for the Shared VPC host project"
}

variable "service_project" {
  description = "ID for the Shared VPC service project where instances will be deployed"
}

variable "network" {
  description = "ID of network to launch instances on"
}

variable "service_port" {
    description = ""
}

variable "backend_mig" {
    description = ""
}
