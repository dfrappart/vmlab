## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.3.0 |
| <a name="requirement_azapi"></a> [azapi](#requirement\_azapi) | >=1.1 |
| <a name="requirement_azuread"></a> [azuread](#requirement\_azuread) | >= 2.30 |
| <a name="requirement_azuredevops"></a> [azuredevops](#requirement\_azuredevops) | >=0.3.0 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | >= 3.3.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azuread"></a> [azuread](#provider\_azuread) | 3.0.2 |
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 4.14.0 |
| <a name="provider_azurerm.defendersubscription"></a> [azurerm.defendersubscription](#provider\_azurerm.defendersubscription) | 4.14.0 |
| <a name="provider_azurerm.monitorsubscription"></a> [azurerm.monitorsubscription](#provider\_azurerm.monitorsubscription) | 4.14.0 |
| <a name="provider_http"></a> [http](#provider\_http) | 3.4.5 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_testvnet"></a> [testvnet](#module\_testvnet) | github.com/dfrappart/Terra-AZModuletest//Custom_Modules/IaaS_NTW_VNet | n/a |

## Resources

| Name | Type |
|------|------|
| [azurerm_bastion_host.Bastion](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/bastion_host) | resource |
| [azurerm_private_dns_zone_virtual_network_link.DnsLinkToVnetAks](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_dns_zone_virtual_network_link) | resource |
| [azurerm_public_ip.BastionIp](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/public_ip) | resource |
| [azurerm_resource_group.RG](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/resource_group) | resource |
| [azurerm_resource_group.RgAgw](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/resource_group) | resource |
| [azurerm_virtual_hub_connection.peering_spoke](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_hub_connection) | resource |
| [azuread_client_config.current](https://registry.terraform.io/providers/hashicorp/azuread/latest/docs/data-sources/client_config) | data source |
| [azurerm_client_config.currentclientconfig](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/client_config) | data source |
| [azurerm_key_vault.SharedKv](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/key_vault) | data source |
| [azurerm_log_analytics_workspace.monitorlaw](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/log_analytics_workspace) | data source |
| [azurerm_resource_group.lawmonitorrg](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/resource_group) | data source |
| [azurerm_storage_account.STALog](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/storage_account) | data source |
| [azurerm_subscription.current](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/subscription) | data source |
| [http_http.myip](https://registry.terraform.io/providers/hashicorp/http/latest/docs/data-sources/http) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_AzureADClientID"></a> [AzureADClientID](#input\_AzureADClientID) | The AAD Client ID | `string` | n/a | yes |
| <a name="input_AzureADClientSecret"></a> [AzureADClientSecret](#input\_AzureADClientSecret) | The AAD Application secret | `string` | n/a | yes |
| <a name="input_AzureClientID"></a> [AzureClientID](#input\_AzureClientID) | The application Id, taken from Azure AD app registration | `string` | n/a | yes |
| <a name="input_AzureClientSecret"></a> [AzureClientSecret](#input\_AzureClientSecret) | The Application secret | `string` | n/a | yes |
| <a name="input_AzureRegion"></a> [AzureRegion](#input\_AzureRegion) | The region for the Azure resource | `string` | `"eastus"` | no |
| <a name="input_AzureSubscriptionCloudShellID"></a> [AzureSubscriptionCloudShellID](#input\_AzureSubscriptionCloudShellID) | The subscription id for cloud shell vnet integrated for the authentication in the provider | `string` | n/a | yes |
| <a name="input_AzureSubscriptionDNSID"></a> [AzureSubscriptionDNSID](#input\_AzureSubscriptionDNSID) | The subscription id for DNS Zones for the authentication in the provider | `string` | n/a | yes |
| <a name="input_AzureSubscriptionDefenderID"></a> [AzureSubscriptionDefenderID](#input\_AzureSubscriptionDefenderID) | The subscription id for Azure Defender for the authentication in the provider | `string` | n/a | yes |
| <a name="input_AzureSubscriptionID"></a> [AzureSubscriptionID](#input\_AzureSubscriptionID) | The subscription id for the authentication in the provider | `string` | n/a | yes |
| <a name="input_AzureSubscriptionMonitorID"></a> [AzureSubscriptionMonitorID](#input\_AzureSubscriptionMonitorID) | The subscription id for monitoring resources for the authentication in the provider | `string` | n/a | yes |
| <a name="input_AzureTenantID"></a> [AzureTenantID](#input\_AzureTenantID) | The Azure AD tenant ID | `string` | n/a | yes |
| <a name="input_CloudShellVnetId"></a> [CloudShellVnetId](#input\_CloudShellVnetId) | The region for the Azure resource | `string` | `"eastus"` | no |
| <a name="input_CustomRouteTableName"></a> [CustomRouteTableName](#input\_CustomRouteTableName) | The custom route table to use | `string` | `"defaultRouteTable"` | no |
| <a name="input_FwId"></a> [FwId](#input\_FwId) | The Id of the Firewall | `string` | `""` | no |
| <a name="input_FwPolicyId"></a> [FwPolicyId](#input\_FwPolicyId) | The Id of the Firewall Policy used | `string` | `""` | no |
| <a name="input_LawMonitorId"></a> [LawMonitorId](#input\_LawMonitorId) | Id of the Log Analytics Workspace used for Monitoring | `string` | n/a | yes |
| <a name="input_RgAgw"></a> [RgAgw](#input\_RgAgw) | An object to define the resource group containing the resources | <pre>object({<br/>    Name     = string<br/>    Location = optional(string, "eastus")<br/>  })</pre> | n/a | yes |
| <a name="input_SharedKv"></a> [SharedKv](#input\_SharedKv) | The shared KV used to store keys | `string` | n/a | yes |
| <a name="input_StaMonitorId"></a> [StaMonitorId](#input\_StaMonitorId) | Id of the sto for logs. Must be in the same region as resource | `string` | n/a | yes |
| <a name="input_VirtualHubId"></a> [VirtualHubId](#input\_VirtualHubId) | The virtual hub id | `string` | n/a | yes |
| <a name="input_VnetConfig"></a> [VnetConfig](#input\_VnetConfig) | value | <pre>map(object({<br/>    AppName                 = optional(string, null)<br/>    VnetCustomName          = optional(bool, null)<br/>    VNetDiagSettingsEnabled = optional(bool, null)<br/>    VNetAddressSpace        = string<br/>    VnetDnsServers          = optional(list(string), null)<br/>    VnetLocation            = optional(string, "eastus")<br/>    VnetPeered              = optional(bool, false)<br/>    VnetPrivate             = optional(bool, false)<br/>    VnetObjectIndex         = optional(number, 1)<br/>    VnetEnableBastion       = optional(bool, false)<br/>    VnetLinkToAksEasUsDns   = optional(bool, false)<br/>    SubnetsConfig = list(object({<br/>      Name            = optional(string, null)<br/>      AllowCustomName = optional(bool, false)<br/>      EnableNsg       = optional(bool, true)<br/>      delegation = optional(object({<br/>        delegation_name            = string<br/>        service_delegation_name    = string<br/>        service_delegation_actions = list(string)<br/>      }), null)<br/>      Nsg = optional(object({<br/>        Name = string<br/>        Rules = map(object({<br/>          Name                       = string<br/>          Priority                   = number<br/>          Direction                  = string<br/>          Access                     = string<br/>          Protocol                   = string<br/>          SourcePortRange            = optional(string, null)<br/>          SourcePortRanges           = optional(list(string), null)<br/>          DestinationPortRange       = optional(string, null)<br/>          DestinationPortRanges      = optional(list(string), null)<br/>          SourceAddressPrefix        = optional(string, null)<br/>          SourceAddressPrefixes      = optional(list(string), null)<br/>          DestinationAddressPrefix   = optional(string, null)<br/>          DestinationAddressPrefixes = optional(list(string), null)<br/>        }))<br/>      }))<br/>    }))<br/>  }))</pre> | n/a | yes |
| <a name="input_extra_tags"></a> [extra\_tags](#input\_extra\_tags) | n/a | `map(string)` | `{}` | no |
| <a name="input_mandatory_tags"></a> [mandatory\_tags](#input\_mandatory\_tags) | n/a | <pre>object({<br/>    data_classification  = optional(string, null)<br/>    operation_commitment = optional(string, null)<br/>    usage                = optional(string, null)<br/>    start_time           = optional(string, null)<br/>    stop_time            = optional(string, null)<br/><br/>  })</pre> | `{}` | no |
| <a name="input_optional_tags"></a> [optional\_tags](#input\_optional\_tags) | n/a | <pre>object({<br/>    owner      = optional(string, "N/A")<br/>    start_date = optional(string, "N/A")<br/><br/>  })</pre> | `{}` | no |

## Outputs

No outputs.
