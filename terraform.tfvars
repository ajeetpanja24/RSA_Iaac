resource_group_name = "myResourceGroup"
location            = "East US"
vnet_name           = "myVnet"
vnet_address_space  = "10.12.19.0/24"

frontend_subnet_name   = "frontend"
frontend_subnet_prefix = "10.12.19.0/26"
backend_subnet_name    = "backend"
backend_subnet_prefix  = "10.12.19.64/26"

db_subnet_name   = "db"
db_subnet_prefix = "10.12.19.128/26"

frontend_nsg_name = "frontend-nsg"
allowed_ips       = ["122.161.50.132/32"] # Replace with your IP range
