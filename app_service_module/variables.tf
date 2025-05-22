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

variable "repo_url" {
  description = "The URL of the repository containing the application code"
  type        = string
}

variable "branch" {
  description = "The branch of the repository to deploy"
  type        = string
}

variable "slot_name_to_deploy" {
  description = "The name of the slot to deploy the application to"
  type        = string
}

variable "default_slot" {
  description = "The default slot"
  type        = string
  default     = "testing"

}

variable "webappname" {
  description = "The name of the web app"
  type        = string
  default     = "example-appservice-mtm-terraform-multislot"
}