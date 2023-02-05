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
