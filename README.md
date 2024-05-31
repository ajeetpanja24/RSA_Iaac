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

