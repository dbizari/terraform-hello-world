resource "azurerm_linux_virtual_machine" "vm" {
    name = "vm"
    resource_group_name = azurerm_resource_group.dani_rg.name
    location = azurerm_resource_group.dani_rg.location

    size = "Standard_B1s"
    admin_username = "azureuser"

    admin_ssh_key {
      username = "azureuser"
      public_key = file("./pubkey")
    }

    source_image_reference {
        publisher = "Debian"
        offer     = "debian-10"
        sku       = "10"
        version   = "latest"
    }

    os_disk {
        caching              = "ReadWrite"
        storage_account_type = "Standard_LRS"
    }

    network_interface_ids = [
        azurerm_network_interface.vm_nic.id
    ]

    # esto corre una vez que la vm esta creada
    provisioner "local-exec" {
      command = "echo ${self.public_ip_address} > ip.txt"
    }
}