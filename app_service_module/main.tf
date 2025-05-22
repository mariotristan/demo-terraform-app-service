
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

  site_config {}
}

resource "azurerm_linux_web_app_slot" "testing" {
  name           = "example-testing-slot"
  app_service_id = azurerm_linux_web_app.example.id

  site_config {}
}


resource "azurerm_linux_web_app_slot" "staging" {
  name           = "example-staging-slot"
  app_service_id = azurerm_linux_web_app.example.id

  site_config {}
}




data "azurerm_client_config" "current" {}


resource "azurerm_app_service_source_control_slot" "example" {
  slot_id  = var.slot_name_to_deploy == var.default_slot ? azurerm_linux_web_app_slot.testing.id : azurerm_linux_web_app_slot.staging.id
  repo_url = var.repo_url
  branch   = var.branch
  use_manual_integration = true
}

