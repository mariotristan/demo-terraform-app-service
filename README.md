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

## Destroying Resources

To remove all resources created by this Terraform configuration, run:

```zsh
terraform destroy -auto-approve
```

This will delete all Azure resources defined in your configuration. Always review the plan before destroying resources in production environments.

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
