# 定义了在Azure中创建虚拟机所需的资源组


resource "random_string" "nic_prefix" {
  length  = 4
  special = false
}

#网络
resource "azurerm_network_interface" "vm_nic" {
  name                = "${var.vm_name}-nic1"
  location            = var.location
  resource_group_name = var.resource_group_name

  ip_configuration {
    name                          = "${var.vm_name}_nic_${random_string.nic_prefix.result}"
    subnet_id                     = var.vm_subnet_id
    private_ip_address_allocation = "Static"
    private_ip_address            = var.static_ip_address
  }
  tags = var.tags
}

#安全组
resource "azurerm_network_interface_security_group_association" "vm_nic_sg" {
  network_interface_id      = azurerm_network_interface.vm_nic.id
  network_security_group_id = var.network_security_group_id
  count                     = var.network_security_group_id == "" ? 0 : 1
}

#计算实例
resource "azurerm_virtual_machine" "windows_vm" {
  name                = var.vm_name
  vm_size             = var.vm_size
  location            = var.location
  resource_group_name = var.resource_group_name

  tags = merge(var.tags, { activityName = "${var.activity_tag} " })

  network_interface_ids = [
    "${azurerm_network_interface.vm_nic.id}",
  ]

  storage_image_reference {
    publisher = var.publisher
    offer     = var.offer
    sku       = var.sku
    version   = "latest"
  }

  identity {
    type = "SystemAssigned"
  }

  storage_os_disk {
    name              = "${var.vm_name}-os-disk"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }

  os_profile {
    admin_password = var.admin_password
    admin_username = "azureuser"
    computer_name  = var.vm_name
  }

  os_profile_windows_config {
    provision_vm_agent = true
  }

  delete_os_disk_on_termination    = var.vm_os_disk_delete_flag
  delete_data_disks_on_termination = var.vm_data_disk_delete_flag
}