resource "azurerm_virtual_network" "dani_vnet" {
    name = "dani_vnet"
    resource_group_name = azurerm_resource_group.dani_rg.name # Todos los recursos deben pertencer a un resource group
    location = azurerm_resource_group.dani_rg.location

    address_space = [ "10.0.0.0/16" ]
}

# clase/tipo de recurso.nombre_del_recurso.props

resource "azurerm_subnet" "dani_subnet" {
    virtual_network_name = azurerm_virtual_network.dani_vnet.name
    name = "dani_subnet"
    resource_group_name = azurerm_resource_group.dani_rg.name

    address_prefixes = [ "10.0.1.0/24" ]
}