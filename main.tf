

module "app_service" {
  source                       = "./app_service_module"
  resource_group_name          = "example-resources"
  location                     = "West US"
  app_service_plan_name        = "example-appserviceplan"
  app_service_plan_tier        = "Standard"
  app_service_plan_size        = "S1"
  sku_name                     = "P1v2"
  os_type                      = "Linux"
  app_service_name             = "example-appservice-mtm-terraform-multislot"
  webappname                   = "example-appservice-mtm-terraform-multislot"
  docker_registry_url          = "https://ghcr.io"
  docker_image_name_production = "ghcr.io/mariotristan/flappy_bird:main"
  #Staging slot
  create_staging_slot       = true
  slot_name                 = "example-staging-slot"
  docker_image_name_staging = "ghcr.io/mariotristan/flappy_bird:release"
}


