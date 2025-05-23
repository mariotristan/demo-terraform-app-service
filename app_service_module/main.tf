
resource "azurerm_resource_group" "example" {
  name     = var.resource_group_name
  location = var.location
}





resource "azurerm_service_plan" "example" {
  name                = var.app_service_plan_name
  resource_group_name = azurerm_resource_group.example.name
  location            = var.location
  os_type             = "Linux"
  sku_name            = "P1v2"
}


resource "azurerm_linux_web_app" "example" {
  name                = var.webappname
  resource_group_name = azurerm_resource_group.example.name
  location            = azurerm_service_plan.example.location
  service_plan_id     = azurerm_service_plan.example.id

  site_config {
    application_stack {
      docker_image_name      = "ghcr.io/mariotristan/flappy_bird:main"
      docker_registry_url    = "https://ghcr.io"
      # docker_registry_username = "your-docker-username"
      # docker_registry_password = "your-docker-password"
    }
  }
}


# resource "azurerm_linux_web_app" "example" {
#   name                = var.webappname
#   resource_group_name = azurerm_resource_group.example.name
#   location            = azurerm_service_plan.example.location
#   service_plan_id     = azurerm_service_plan.example.id

#   site_config {}
# }




# resource "azurerm_linux_web_app_slot" "testing" {
#   count          = var.create_testing_slot ? 1 : 0
#   name           = "example-testing-slot"
#   app_service_id = azurerm_linux_web_app.example.id

#   site_config {}
# }


# resource "azurerm_linux_web_app_slot" "staging" {
#   count          = var.create_staging_slot ? 1 : 0
#   name           = "example-staging-slot"
#   app_service_id = azurerm_linux_web_app.example.id

#   site_config {
    
#   }
# }




data "azurerm_client_config" "current" {}






