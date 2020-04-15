resource "azurerm_storage_account" "dcestorage" {
  name                      = "dcestorage-${var.environment}"
  resource_group_name       = azurerm_resource_group.dcerg.name
  location                  = var.location
  account_kind              = "StorageV2"
  account_tier              = "Standard"
  account_replication_type  = "LRS"
  enable_https_traffic_only = true
  tags = {
    environment = "${var.environment}"
    application = "dce"
    provisioner = "terraform"
  }
}

resource "azurerm_app_service_plan" "dce" {
  name                = "dce"
  location            = var.location
  resource_group_name = azurerm_resource_group.mathshammer.name
  kind                = "FunctionApp"
  sku {
    tier = "Dynamic"
    size = "Y1"
  }
  tags = {
    environment = var.environment
    application = "dce"
    provisioner = "terraform"
  }
}

resource "azurerm_function_app" "dce" {
  name                      = "dce"
  resource_group_name       = azurerm_resource_group.dcerg.name
  location                  = var.location
  app_service_plan_id       = azurerm_app_service_plan.dce.id
  storage_connection_string = azurerm_storage_account.dcestorage.primary_connection_string
  https_only                = true
  version                   = "~2"
  site_config {
    use_32_bit_worker_process = false
    #cors {
    #  allowed_origins = ["*"]
    # }
  }
  app_settings = {
    "APPINSIGHTS_INSTRUMENTATIONKEY" = "${azurerm_application_insights.dce.instrumentation_key}"
  }
  tags = {
    environment = var.environment
    application = "dce"
    provisioner = "terraform"
  }
}
