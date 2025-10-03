######################################################
# Variables
######################################################

##############################################################
#Variable declaration for provider

variable "AzureSubscriptionID" {
  type        = string
  description = "The subscription id for the authentication in the provider"
}




variable "AzureClientID" {
  type        = string
  description = "The application Id, taken from Azure AD app registration"
}


variable "AzureClientSecret" {
  type        = string
  description = "The Application secret"

}

variable "AzureTenantID" {
  type        = string
  description = "The Azure AD tenant ID"
}

######################################################
# Common variables

variable "AzureRegion" {
  type        = string
  description = "The region for the Azure resource"
  default     = "francecentral"

}

###################################
# tags

variable "mandatory_tags" {
  type = object({
    data_classification  = optional(string, null)
    operation_commitment = optional(string, null)
    usage                = optional(string, null)
    start_time           = optional(string, null)
    stop_time            = optional(string, null)

  })

  default = {}
}

variable "optional_tags" {
  type = object({
    owner      = optional(string, "N/A")
    start_date = optional(string, "N/A")

  })
  default = {}
}

variable "extra_tags" {
  type    = map(string)
  default = {}
}

######################################################
# Rg variables

variable "RgConfig" {
  type = map(object({
    RgLocation = string


  }))

  default = {
    "rsg-monitor" = {
      RgLocation = "francecentral"
    }
    "rsg-security" = {
      RgLocation = "francecentral"
    }
    "rsg-kv" = {
      RgLocation = "francecentral"
    }
    "rsg-dns" = {
      RgLocation = "francecentral"
    }
    "rsg-acr" = {
      RgLocation = "francecentral"
    }
  }
}

######################################################
# Vnet variable, singular, because this is a big map of objects ^^

variable "VnetConfig" {
  type = map(object({
    AppName                 = optional(string, null)
    VnetCustomName          = optional(bool, null)
    VNetDiagSettingsEnabled = optional(bool, null)
    VNetAddressSpace        = string
    VnetDnsServers          = optional(list(string), null)
    VnetLocation            = optional(string, "francecentral")
    VnetPeered              = optional(bool, false)
    VnetPrivate             = optional(bool, false)
    VnetObjectIndex         = optional(number, 1)
    VnetEnableBastion       = optional(bool, false)
    VnetLinkToAksEasUsDns   = optional(bool, false)
    VnetLinkToAksFrCeDns    = optional(bool, false)
    SubnetsConfig = list(object({
      Name            = optional(string, null)
      AllowCustomName = optional(bool, false)
      EnableNsg       = optional(bool, true)
      AddressPrefix   = optional(string, null)
      Delegation = optional(object({
        DelegationName           = string
        ServiceDelegationName    = string
        ServiceDelegationActions = list(string)
      }), null)
      Nsg = optional(object({
        Name = string
        Rules = map(object({
          Name                       = string
          Priority                   = number
          Direction                  = string
          Access                     = string
          Protocol                   = string
          SourcePortRange            = optional(string, null)
          SourcePortRanges           = optional(list(string), null)
          DestinationPortRange       = optional(string, null)
          DestinationPortRanges      = optional(list(string), null)
          SourceAddressPrefix        = optional(string, null)
          SourceAddressPrefixes      = optional(list(string), null)
          DestinationAddressPrefix   = optional(string, null)
          DestinationAddressPrefixes = optional(list(string), null)
        }))
      }))
    }))
    VmEnabled = optional(bool, false)

  }))

  description = "A big map of objects to define the Vnet configuration. Is it more simple or not ?"
}








