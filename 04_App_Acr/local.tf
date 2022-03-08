locals {
  #Appsvc Settings
  app_settings = sensitive({
    default_settings = {
      APPINSIGHTS_INSTRUMENTATIONKEY = "${azurerm_application_insights.INSIGHTS.instrumentation_key}"
      DOKCER_REGISTRY_SERVER_URL     = "${var.acr_name}.azurecr.io"
    }
    linux_app_settings = {
      APPINSIGHTS_INSTRUMENTATIONKEY = "${azurerm_application_insights.INSIGHTS.instrumentation_key}"
      DOKCER_REGISTRY_SERVER_URL     = "${var.acr_name}.azurecr.io"
      WEBSITE_PULL_IMAGE_OVER_VNET   = "true"
    }
  })
  linux_fx_version = "DOCKER|${var.acr_name}/${var.appsvc_name}:latest"
}