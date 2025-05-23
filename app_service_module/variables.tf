variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
}

variable "location" {
  description = "The location of the resources"
  type        = string
}

variable "app_service_plan_name" {
  description = "The name of the App Service plan"
  type        = string
}

variable "app_service_plan_tier" {
  description = "The tier of the App Service plan"
  type        = string
}

variable "app_service_plan_size" {
  description = "The size of the App Service plan"
  type        = string
}

variable "app_service_name" {
  description = "The name of the App Service"
  type        = string
}






variable "webappname" {
  description = "The name of the web app"
  type        = string
  default     = "example-appservice-mtm-terraform-multislot"
}


variable "create_staging_slot" {
  description = "Flag to create a staging slot"
  type        = bool
  default     = false

}

variable "docker_image_name_production" {
  description = "The Docker image name"
  type        = string
  default     = "ghcr.io/mariotristan/flappy_bird:main"


}


variable "docker_image_name_staging" {
  description = "The Docker image name for staging"
  type        = string
  default     = "ghcr.io/mariotristan/flappy_bird:release"

}

variable "docker_registry_url" {
  description = "The Docker registry URL"
  type        = string
  default     = "https://ghcr.io"

}

variable "os_type" {
  description = "The OS type for the App Service"
  type        = string
  default     = "Linux"

}

variable "sku_name" {
  description = "The SKU name for the App Service plan"
  type        = string
  default     = "P1v2"

}

variable "slot_name" {
  description = "The name of the slot"
  type        = string
  default     = "example-staging-slot"

}