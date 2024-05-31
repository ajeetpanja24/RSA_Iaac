variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
}

variable "location" {
  description = "The Azure region to deploy resources"
  type        = string
  default     = "East US"
}

variable "vnet_name" {
  description = "The name of the virtual network"
  type        = string
}

variable "vnet_address_space" {
  description = "The address space for the virtual network"
  type        = string
}

variable "frontend_subnet_name" {
  description = "The name of the frontend subnet"
  type        = string
}

variable "frontend_subnet_prefix" {
  description = "The address prefix for the frontend subnet"
  type        = string
}

variable "backend_subnet_name" {
  description = "The name of the backend subnet"
  type        = string
}

variable "backend_subnet_prefix" {
  description = "The address prefix for the backend subnet"
  type        = string
}

variable "db_subnet_name" {
  description = "The name of the database subnet"
  type        = string
}

variable "db_subnet_prefix" {
  description = "The address prefix for the database subnet"
  type        = string
}

variable "frontend_nsg_name" {
  description = "The name of the frontend network security group"
  type        = string
}

variable "allowed_ips" {
  description = "The list of allowed IP addresses for the frontend"
  type        = list(string)
}
