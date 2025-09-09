# Azure Patch Management

This project automates patch management using Azure Automation and reusable Terraform modules. It provides a structured approach to create and manage Azure resources necessary for effective patch management.

## Project Structure

- **modules/**: Contains reusable Terraform modules.
  - **automation_account/**: Module for creating an Azure Automation Account.
  - **log_analytics_workspace/**: Module for creating a Log Analytics Workspace.
  - **update_management/**: Module for configuring Update Management.
  
- **src/**: Root module that orchestrates the creation of resources.
  
- **examples/**: Contains example usage of the modules.

## Getting Started

### Prerequisites

- Terraform installed on your machine.
- An Azure account with the necessary permissions to create resources.

### Usage

1. Clone the repository:
   ```
   git clone <repository-url>
   cd azure-patch-management
   ```

2. Navigate to the `src` directory and initialize Terraform:
   ```
   cd src
   terraform init
   ```

3. Review and modify the `main.tf` file as needed to suit your environment.

4. Apply the Terraform configuration:
   ```
   terraform apply
   ```

### Monitoring Patch Compliance

To monitor patch compliance, you can use the Azure portal or Azure CLI:

- **Azure Portal**: Navigate to the Azure Automation Account and select "Update Management" to view the compliance status of linked VMs.
  
- **Azure CLI**: Use the following command to check the compliance status:
  ```
  az automation update-management get-compliance --resource-group <resource-group-name> --automation-account-name <automation-account-name>
  ```
