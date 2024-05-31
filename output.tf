output "resource_group_name" {
  description = "The name of the resource group"
  value       = azurerm_resource_group.rg.name
}

output "vnet_name" {
  description = "The name of the virtual network"
  value       = azurerm_virtual_network.vnet.name
}

output "frontend_subnet_id" {
  description = "The ID of the frontend subnet"
  value       = azurerm_subnet.frontend.id
}

output "backend_subnet_id" {
  description = "The ID of the backend subnet"
  value       = azurerm_subnet.backend.id
}

output "db_subnet_id" {
  description = "The ID of the database subnet"
  value       = azurerm_subnet.db.id
}

output "frontend_nsg_id" {
  description = "The ID of the frontend network security group"
  value       = azurerm_network_security_group.frontend_nsg.id
}
