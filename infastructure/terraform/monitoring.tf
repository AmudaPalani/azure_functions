resource "azurerm_application_insights" "dce" {
  name                = "dce"
  location            = var.location
  resource_group_name = azurerm_resource_group.dcerg.name
  application_type    = "web"
  tags = {
    environment = var.environment
    application = "dce"
    provisioner = "terraform"
  }
}
