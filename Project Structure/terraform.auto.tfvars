subscription_id = "6840913c-76e6-488d-xxxx-0a27872c70e6"
client_id       = "c0bcbf81-c51b-4ca2-xxxx-759c688e2d9f"
client_secret   = "zNGdvqm7Ft.xxxxxxx"
tenant_id       = "5759ecf2-97b4-4017-xxxx-4f0b25f016d2"

global_settings = {

  #Set of tags 
  tags = {
    applicationName = "Windows VM Demo"
    businessUnit    = "Technical Solutions"
    costCenter      = "MPN Sponsorship"
    DR              = "NON-DR-ENABLED"
    deploymentType  = "Terraform"
    environment     = "Dev"
    owner           = "Jack Roper"
    version         = "0.1"
  }

}

# Desktop VM variables
desktop_vm_image_publisher  = "MicrosoftWindowsDesktop" 
desktop_vm_image_offer      = "Windows-10" 
desktop_vm_image_sku        = "20h1-pro" 
desktop_vm_image_version    = "latest"
desktop_vm_size             = "Standard_B1s"