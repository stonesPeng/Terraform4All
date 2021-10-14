#这个文件输出任何我们想要传递回根用户以供重用的内容
output "vm_id" {
  value = "${azurerm_virtual_machine.windows_vm.id}"
}

output "vm_name" {
  value = "${azurerm_virtual_machine.windows_vm.name}"
}

output "vm_location" {
  value = "${azurerm_virtual_machine.windows_vm.location}"
}

output "vm_resource_group_name" {
  value = "${azurerm_virtual_machine.windows_vm.resource_group_name}"
}