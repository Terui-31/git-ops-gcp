# variable "project_id" {
#     type  = string
# }

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
