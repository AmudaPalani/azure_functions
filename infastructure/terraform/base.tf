
resource "azurerm_resource_group" "dcerg" {
  name     = "dce-${var.environment}"
  location = var.location
  tags = {
    environment = var.environment
    application = "dce"
    provisioner = "terraform"
  }
}
