variable "project_name"{
    default = "localhelp"
}

variable "environment"{
    default = "dev"
}

variable "common_tags"{
    default = {
        Project = "localhelp"
        Environment = "dev"
        Terraform = "true"
        Component = "frontend"
    }
}

variable "zone_name" {
  default = "localhelp.store"
}

# created as part of jenkins CD process
variable "app_version"{

}

