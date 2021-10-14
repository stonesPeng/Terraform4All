module windows_desktop_vm_using_local_module {
  source              = "./AzureVMModule"
  resource_group_name = azurerm_resource_group.rg.name
  location            = "uksouth"
  sloc                = "uks"
  vm_subnet_id        = module.network.vnet_subnets[0]
  vm_name             = "tfdtlocmod"
  vm_size             = var.desktop_vm_size
  publisher           = var.desktop_vm_image_publisher
  offer               = var.desktop_vm_image_offer
  sku                 = var.desktop_vm_image_sku
  static_ip_address   = "10.0.1.15"
  activity_tag        = "Windows Desktop"
  admin_password      = module.vmpassword.secretvalue
}