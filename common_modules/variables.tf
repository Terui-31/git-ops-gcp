variable "env" {
    type  = string
}

output "common_vars" {
    value = {
        project_id = {
            dev = "gcp-git-ops"
            prd = "gcp-git-ops"
        }
    }    
}