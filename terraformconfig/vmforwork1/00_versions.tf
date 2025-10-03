######################################################################
# backend block for partial configuration
######################################################################

terraform {
  required_version = ">= 1.10.0"

  required_providers {
    azurerm = {
      version = ">= 4.0.0"
    }

    azapi = {
      source  = "azure/azapi"
      version = ">=2.0.0"
    }



  }

  backend "azurerm" {}
}
