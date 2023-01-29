variable "env" {
    type  = string
}

variable "location" {
    type  = string
}

variable "common_vars" {
        type = object({
        project_id = map(string)
    })
}

# variable "project_id" {}
# variable "env" {}
# variable "vpc_host_project" {}
# variable "vpc_network" {}
# variable "backend_mig" {}
# variable "service_port" {}
# variable "service_port_name" {}
