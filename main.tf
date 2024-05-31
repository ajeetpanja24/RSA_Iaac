###### Creating the Resource Group ######
resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.location
}
###### Creating Vnet and Subnets ######
resource "azurerm_virtual_network" "vnet" {
  name                = var.vnet_name
  address_space       = [var.vnet_address_space]
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
}

resource "azurerm_subnet" "frontend" {
  name                 = var.frontend_subnet_name
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = [var.frontend_subnet_prefix]
}

resource "azurerm_subnet" "backend" {
  name                 = var.backend_subnet_name
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = [var.backend_subnet_prefix]
}

resource "azurerm_subnet" "db" {
  name                 = var.db_subnet_name
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = [var.db_subnet_prefix]
}

##### Creating NSG and Rules ######
resource "azurerm_network_security_group" "frontend_nsg" {
  name                = var.frontend_nsg_name
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
}

resource "azurerm_network_security_rule" "allow_frontend" {
  name                        = "AllowFrontend"
  priority                    = 100
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "*"
  source_port_range           = "*"
  destination_port_ranges     = ["80", "443"]
  source_address_prefixes     = var.allowed_ips
  destination_address_prefix  = "*"
  resource_group_name         = azurerm_resource_group.rg.name
  network_security_group_name = azurerm_network_security_group.frontend_nsg.name
}

resource "azurerm_subnet_network_security_group_association" "frontend_association" {
  subnet_id                 = azurerm_subnet.frontend.id
  network_security_group_id = azurerm_network_security_group.frontend_nsg.id
}

