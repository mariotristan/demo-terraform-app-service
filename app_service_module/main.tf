
resource "azurerm_resource_group" "example" {
  name     = var.resource_group_name
  location = var.location
}





resource "azurerm_service_plan" "example" {
  name                = var.app_service_plan_name
  resource_group_name = azurerm_resource_group.example.name
  location            = var.location
  os_type             = var.os_type
  sku_name            = var.sku_name
}

#TODO: add support for windows web apps
resource "azurerm_linux_web_app" "example" {
  name                = var.webappname
  resource_group_name = azurerm_resource_group.example.name
  location            = azurerm_service_plan.example.location
  service_plan_id     = azurerm_service_plan.example.id

  site_config {
    application_stack {
      docker_image_name   = var.docker_image_name_production
      docker_registry_url = var.docker_registry_url
      # docker_registry_username = "your-docker-username"
      # docker_registry_password = "your-docker-password"
    }
  }
}


#TODO: make this more dynamic, I want to be able to create many slots based on a variable of type list(string)
resource "azurerm_linux_web_app_slot" "staging" {
  count          = var.create_staging_slot ? 1 : 0
  name           = var.slot_name
  app_service_id = azurerm_linux_web_app.example.id

  site_config {
    application_stack {
      docker_image_name   = var.docker_image_name_staging
      docker_registry_url = var.docker_registry_url
      # docker_registry_username = "your-docker-username"
      # docker_registry_password = "your-docker-password"
    }

  }
}


data "azurerm_client_config" "current" {}






