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
# variable "zone" {}
# variable "env" {}

# variable "sharedvpc_project" {}
# variable "sharedvpc_name" {}
# variable "sharedvpc_region" {}
# variable "sharedvpc_front" {}
# variable "sharedvpc_backend" {}
