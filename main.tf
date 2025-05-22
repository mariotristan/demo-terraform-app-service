

module "app_service" {
  source = "./app_service_module"

  resource_group_name   = "example-resources"
  location              = "West US"
  app_service_plan_name = "example-appserviceplan"
  app_service_plan_tier = "Standard"
  app_service_plan_size = "S1"
  app_service_name      = "example-appservice-mtm-terraform-multislot"
  repo_url              = "https://github.com/mariotristan/flappy_bird.git"
  branch                = "main"
  slot_name_to_deploy  =      "staging" 
  webappname =      "example-appservice-mtm-terraform-multislot"
}
