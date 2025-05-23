# Demo Terraform Azure App Service

This project demonstrates how to provision and deploy a production-ready Azure App Service, including deployment slots, using Infrastructure as Code (IaC) with Terraform. It is designed for teams and individuals who want to automate the creation, configuration, and management of Azure App Services in a repeatable and secure way.

Key features:

- Modular design: Uses a reusable Terraform module for App Service and slot management.
- Supports multiple deployment slots (e.g., staging, production) for zero-downtime deployments.
- Integrates with Docker images and GitHub Container Registry for flexible app deployment.
- Follows Azure and Terraform best practices for security, maintainability, and scalability.
- Example backend configuration provided for safe sharing and onboarding.
- Includes clear instructions for setup, deployment, and teardown.

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
- `app_service_plan_tier`: Tier of the App Service plan
- `app_service_plan_size`: Size of the App Service plan
- `app_service_name`: Name of the App Service
- `webappname`: Name of the web app (default: example-appservice-mtm-terraform-multislot)
- `create_staging_slot`: Flag to create a staging slot (bool, default: false)
- `docker_image_name_production`: Docker image name for production (default: ghcr.io/mariotristan/flappy_bird:main)
- `docker_image_name_staging`: Docker image name for staging (default: ghcr.io/mariotristan/flappy_bird:release)
- `docker_registry_url`: Docker registry URL (default: `https://ghcr.io`)
- `os_type`: OS type for the App Service (default: Linux)
- `sku_name`: SKU name for the App Service plan (default: P1v2)
- `slot_name`: Name of the slot (default: example-staging-slot)

See the module for additional variables and details.

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

*Generated on May 23, 2025. For questions, contact the project maintainer.*
