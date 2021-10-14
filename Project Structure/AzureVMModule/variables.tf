# 这个文件定义了模块期望从根模块调用中定义的所有变量
variable "resource_group_name" {
}

variable "location" {
}

variable "sloc" {
}

variable "vm_size" {
  default = "Standard_B1s"
}

variable "vm_subnet_id" {
}

variable "vm_name" {
}

variable "vm_os_disk_delete_flag" {
  default = true
}

variable "vm_data_disk_delete_flag" {
  default = true
}

variable "network_security_group_id" {
  default = ""
}

variable "static_ip_address" {
}

variable "publisher" {
}

variable "offer" {
}

variable "sku" {
}

variable "tags" {
  type        = map
  description = "All mandatory tags to use on all assets"

  default = {
    activityName       = "AzureVMWindowsDemo"
    automation         = "Terraform"
    costCenter1        = "A00000"
    dataClassification = "Demo"
    managedBy          = "bt@bt.com"
    solutionOwner      = "bt@bt.com"
  }
}

variable "activity_tag" {
}

variable "admin_password" {
}