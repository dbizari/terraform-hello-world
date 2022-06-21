resource "azurerm_public_ip" "vm_public_ip" {
    name = "vm_public_ip"
    resource_group_name = azurerm_resource_group.dani_rg.name # Todos los recursos deben pertencer a un resource group
    location = azurerm_resource_group.dani_rg.location

    allocation_method = "Dynamic"
}

# placa de la red de la VM
resource "azurerm_network_interface" "vm_nic" {
    name = "vm_nic"
    resource_group_name = azurerm_resource_group.dani_rg.name # Todos los recursos deben pertencer a un resource group
    location = azurerm_resource_group.dani_rg.location

    ip_configuration {
        name = "vm_nic_ip_config"
        private_ip_address_allocation = "Dynamic"
        subnet_id = azurerm_subnet.dani_subnet.id
        public_ip_address_id = azurerm_public_ip.vm_public_ip.id
    }
}