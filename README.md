# Azure App Service Deployment with Terraform

This project demonstrates how to use Terraform to deploy an Azure App Service with multiple slots and deploy an application to a specified slot.

## Prerequisites

- [Terraform](https://www.terraform.io/downloads.microsoft.com/en-us/ure subscription

## Project Structure

my_project/ ├── main.tf └── app_service_module/ ├── main.tf ├── variables.tf ├── outputs.tf └── README.md


## Module Usage

The `app_service_module` directory contains the Terraform module for deploying the Azure App Service and slots. The `main.tf` file in the `my_project` directory calls this module.

### Variables

The module accepts the following variables:

- `resource_group_name`: The name of the resource group.
- `location`: The location of the resources.
- `app_service_plan_name`: The name of the App Service plan.
- `app_service_plan_tier`: The tier of the App Service plan.
- `app_service_plan_size`: The size of the App Service plan.
- `app_service_name`: The name of the App Service.
- `repo_url`: The URL of the repository containing the application code.
- `branch`: The branch of the repository to deploy.
- `slot_name`: The name of the slot to deploy the application to.

### Outputs

The module provides the following outputs:

- `app_service_id`: The ID of the App Service.
- `staging_slot_id`: The ID of the staging slot.
- `testing_slot_id`: The ID of the testing slot.

## How to Use

1. **Clone the repository**:
   ```sh
   git clone https://github.com/your-repo/your-project.git
   cd your-project
Initialize Terraform:


Apply the Terraform configuration:


You will be prompted to enter values for the variables or you can define them in a terraform.tfvars file.

Example terraform.tfvars file:


Notes
Ensure that the Azure CLI is authenticated before running Terraform commands.
The slot_name variable allows you to specify which slot to deploy the application to.
License
This project is licensed under the MIT License. See the LICENSE file for details.

Acknowledgements
Terraform
Azure
