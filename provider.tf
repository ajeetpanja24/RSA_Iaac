########## Provider Configuration ##########
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.106.0"
    }
  }
}

provider "azurerm" {
  subscription_id = "84fc6d5d-&&&&&&&&&&" ### These are the dummy Vaules 
  tenant_id       = "2a45***************c2464"
  client_id       = "9b@##$$$@##$%^&&5a3"
  client_secret   = "ydv8!@#$%^&*UYTRHGFD"
  features {}
}
