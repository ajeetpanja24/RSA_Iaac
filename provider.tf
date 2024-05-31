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
  subscription_id = "84fc6d5d-6dc9-459d-b1af-715b14bec9ad"
  tenant_id       = "2a451167-efd5-4dcb-9679-5809757c2464"
  client_id       = "9bee6144-c866-45e0-a5ff-98991a9775a3"
  client_secret   = "ydv8Q~zgs42w8HeqWsVrnY6aqhwnuCP1zE4QQaQY"
  features {}
}