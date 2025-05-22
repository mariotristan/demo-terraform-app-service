<<<<<<< HEAD
# Demo Terraform Azure App Service

This project demonstrates how to provision and deploy an Azure App Service (with deployment slots) using Terraform, following Azure and Terraform best practices.

## Project Structure

- `main.tf`: Root Terraform configuration, invokes the App Service module.
- `providers.tf`: Provider configuration, loads Azure credentials from a backend JSON file.
- `backend.tf.json`: Stores backend configuration and sensitive credentials (should be secured!).
- `backend.tf.json.example`: Example backend config with placeholders (safe to share, no secrets).
- `app_service_module/`: Reusable Terraform module for Azure App Service, slots, and source control integration.

## Prerequisites

- [Terraform](https://developer.hashicorp.com/terraform/downloads) >= 1.0.0
- Azure subscription and permissions to create resources
- [Azure CLI](https://docs.microsoft.com/en-us/cli/azure/install-azure-cli) (for authentication)
- Backend storage account and container for remote state (see `backend.tf.json`)

## Usage

1. **Clone the repository**

   ```zsh
   git clone <this-repo-url>
   cd demo-terraform-app-service
   ```

2. **Configure backend**
   
   Copy `backend.tf.json.example` to `backend.tf.json` and fill in your Azure Storage Account, Resource Group, and credentials. **Do not commit secrets to version control!**

   ```zsh
   cp backend.tf.json.example backend.tf.json
   # Edit backend.tf.json with your values
   ```

3. **Initialize Terraform**

   ```zsh
   terraform init
   ```

4. **Validate the configuration**

   ```zsh
   terraform validate
   ```

5. **Plan the deployment**

   ```zsh
   terraform plan
   ```

6. **Apply the deployment**

   ```zsh
   terraform apply -auto-approve
   ```

7. **Access your App Service**

   After deployment, find your App Service in the [Azure Portal](https://portal.azure.com/).

## Module Inputs

The module supports the following variables (see `app_service_module/variables.tf`):

- `resource_group_name`: Name of the resource group
- `location`: Azure region
- `app_service_plan_name`: Name of the App Service plan
- `app_service_plan_tier`: Tier (e.g., Standard)
- `app_service_plan_size`: Size (e.g., S1)
- `app_service_name`: Name of the App Service
- `repo_url`: Git repository URL for deployment
- `branch`: Branch to deploy
- `slot_name_to_deploy`: Slot name (e.g., staging)
- `webappname`: Name of the web app
- ...and more (see module for details)

## Security & Best Practices

- **Never commit secrets** (like client secrets) to version control.
- Use [Managed Identity](https://learn.microsoft.com/en-us/azure/active-directory/managed-identities-azure-resources/overview) or [Azure Key Vault](https://learn.microsoft.com/en-us/azure/key-vault/general/overview) for production deployments.
- Follow [Terraform Style Guide](https://developer.hashicorp.com/terraform/language/style).
- Use remote state with proper access controls.
- Share only `backend.tf.json.example` (never `backend.tf.json`).

## References

- [Terraform AzureRM Provider](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs)
- [Azure App Service Documentation](https://learn.microsoft.com/en-us/azure/app-service/)
- [Terraform Best Practices](https://developer.hashicorp.com/terraform/language/style)

---

*Generated on May 22, 2025. For questions, contact the project maintainer.*
=======
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
>>>>>>> fbf80b877f40ff172a345e2bbff115fd1839b6bf
