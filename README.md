### Steps for creating the Azure Service Principal ###### 
Created the Azure Subscription
Default Directory is created
Created New App Registration
Created New Client Secrets from Newly Created App
Assigned Azure IAM Role to Created Principal of Client

################# Created 5  Files of Terraform ################################
1) Main.tf:This will create below Resources on Azure 
>>> Resource Group:
Creates an Azure Resource Group with the specified name and location.

>>>Virtual Network (VNet):
Creates a Virtual Network with the specified name, address space, and location.
Associates it with the previously created resource group.

>>>Subnets:
Creates three subnets within the same virtual network.
Each subnet is associated with the previously created resource group and virtual network.
Each subnet has its own address prefix.

>>>>Network Security Group (NSG):
Creates a Network Security Group for the frontend subnet.
Associates it with the previously created resource group and location.

>>>>>Security Rules:
Creates a security rule named "AllowFrontend" within the frontend NSG.
Specifies rules for inbound traffic on ports 80 and 443, allowing traffic from specified IP addresses.
Associates the rule with the previously created resource group and frontend NSG.

>>>>>Associations:
Associates the frontend subnet with the frontend NSG to apply the security rules.
2) variable.tf
These Terraform variables are defined to parameterize various aspects of the Azure infrastructure deployment:

resource_group_name:

Name of the resource group where the resources will be deployed.
location:

Azure region where the resources will be deployed.
Default value is "East US" if not explicitly specified.
vnet_name:

Name of the virtual network to be created.
vnet_address_space:

Address space for the virtual network.
frontend_subnet_name:

Name of the frontend subnet within the virtual network.
frontend_subnet_prefix:
Address prefix for the frontend subnet.

backend_subnet_name:
Name of the backend subnet within the virtual network.

backend_subnet_prefix:
Address prefix for the backend subnet.

db_subnet_name:
Name of the database subnet within the virtual network.

db_subnet_prefix:
Address prefix for the database subnet.

frontend_nsg_name:
Name of the frontend Network Security Group (NSG).

allowed_ips:
List of allowed IP addresses for the frontend, which will be used in defining security rules.

3)tfvars
This Terraform variables file (tfvars) specifies the values for the variables used in the infrastructure deployment:

resource_group_name:
Name of the resource group: "myResourceGroup".

location:
Azure region where the resources will be deployed: "East US".

vnet_name:
Name of the virtual network: "myVnet".

vnet_address_space:
Address space for the virtual network: "10.12.19.0/24".

frontend_subnet_name:
Name of the frontend subnet within the virtual network: "frontend".

frontend_subnet_prefix:
Address prefix for the frontend subnet: "10.12.19.0/26".

backend_subnet_name:
Name of the backend subnet within the virtual network: "backend".

backend_subnet_prefix:
Address prefix for the backend subnet: "10.12.19.64/26".

db_subnet_name:
Name of the database subnet within the virtual network: "db".

db_subnet_prefix:
Address prefix for the database subnet: "10.12.19.128/26".

frontend_nsg_name:
Name of the frontend Network Security Group (NSG): "frontend-nsg".

allowed_ips:
List of allowed IP addresses for the frontend: ["122.161.50.132/32"]. This IP range will have access to the frontend resources. Note: The comment suggests replacing this with your actual IP range.
4) outout files 
This code appears to be defining Terraform outputs for various resources provisioned in an Azure environment. Let's break it down:

output "resource_group_name": This output provides the name of the resource group created in Azure. It references the name attribute of the azurerm_resource_group resource named rg.

output "vnet_name": Similar to the first output, this provides the name of the virtual network created in Azure. It references the name attribute of the azurerm_virtual_network resource named vnet.

output "frontend_subnet_id": This output provides the ID of the frontend subnet within the virtual network. It references the ID attribute of the azurerm_subnet resource representing the frontend subnet.

output "backend_subnet_id": Similar to the frontend subnet output, this provides the ID of the backend subnet within the virtual network.

output "db_subnet_id": This output provides the ID of the database subnet within the virtual network.

output "frontend_nsg_id": This output provides the ID of the frontend network security group (NSG) associated with the frontend subnet. It references the ID attribute of the azurerm_network_security_group resource representing the frontend NSG.

These outputs are useful for capturing information about the infrastructure deployed using Terraform. They can be referenced elsewhere in Terraform configurations or scripts, or they can be retrieved using the Terraform CLI for use in other tools or processes.

5) Provider.tf
   This Terraform configuration block defines the provider configuration for Azure using the azurerm provider. Let's break it down:

terraform block: This block defines the Terraform version and required providers for this configuration. In this case, it specifies that the azurerm provider is required, with a specific version.

required_providers block: Within the terraform block, this specifies the required providers and their versions. In this case, it specifies that the azurerm provider is required from the source "hashicorp/azurerm" with version "3.106.0".

provider "azurerm" block: This block configures the Azure provider named azurerm. It provides authentication information to Terraform so that it can interact with Azure resources:
(
subscription_id: The Azure subscription ID to use for provisioning resources.
tenant_id: The Azure Active Directory tenant ID associated with the subscription.
client_id: The client ID of an Azure Active Directory application. This is often referred to as the "service principal" or "app registration" ID.
client_secret: The client secret associated with the Azure Active Directory application. This is used for authentication.
features {}: This block can be used to enable specific features of the Azure provider. In this case, it's left empty, meaning no specific features are enabled.
With this configuration, Terraform will use the Azure provider to manage Azure resources within the specified subscription using the provided authentication credentials.
)

### Command used in this code ###
1)terraform init:
This command initializes a Terraform configuration directory.
It downloads any required plugins and initializes the backend (if specified) to prepare the directory for Terraform operations.
It's typically the first command you run in a new Terraform project or when you've added new providers or modules to an existing project.

2)terraform validate:
This command validates the configuration files in the current directory.
It checks the syntax and configuration of the Terraform files to ensure they are valid and correctly formatted.
It's useful for catching errors in your configuration files before applying them to your infrastructure.

3)terraform plan:
This command generates an execution plan.
It compares the current state of the infrastructure with the desired state defined in your configuration files.
It displays the actions Terraform will take to achieve the desired state without actually making any changes.
It's useful for understanding what changes Terraform will make before applying them.

4)terraform fmt:
The terraform fmt command is used to format Terraform configuration files according to a canonical format.
It helps maintain consistency and readability across different Terraform projects and among team members.
When you run terraform fmt, Terraform will automatically update the formatting of your configuration files to adhere to the standard style.

5)terraform plan:
The terraform plan command generates an execution plan that describes the actions Terraform will take to modify the infrastructure to match the configuration.
It does not actually execute the actions, but instead previews the changes that will occur when you run terraform apply.

6)terraform apply:

This command applies the changes required to reach the desired state of the configuration.
It reads the current state of the infrastructure, compares it with the desired state, and executes the necessary actions to achieve the desired state.
It's typically used after terraform plan to apply the changes proposed in the execution plan.

7)terraform destroy:
This command destroys all resources managed by Terraform in the configuration.
It reads the Terraform state and identifies all resources managed by Terraform, then deletes them.
It's useful for tearing down infrastructure that you no longer need, such as after a testing phase or at the end of a project.

