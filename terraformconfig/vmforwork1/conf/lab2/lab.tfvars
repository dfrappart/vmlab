

VnetConfig = {
  lab2vm1 = {
    AppName           = "lab2vm1"
    VNetAddressSpace  = "172.22.0.0/24"
    VnetEnableBastion = true
    VnetPeered        = false
    SubnetsConfig = [
      {
        Name          = "Subnet1"
        AddressPrefix = "172.22.0.0/26"
        EnableNsg     = true
        Nsg = {
          Name = "sub1"
          Rules = {

          }
        }
      },
      {
        Name          = "Subnet2"
        AddressPrefix = "172.22.0.64/26"
        EnableNsg     = true
        Nsg = {
          Name = "value"
          Rules = {

          }
        }
      },
      {
        Name          = "Subnet3"
        AddressPrefix = "172.22.0.128/26"
        EnableNsg     = true
        Nsg = {
          Name = "value"
          Rules = {

          }
        }
      },
      {
        Name            = "AzureBastionSubnet"
        AddressPrefix   = "172.22.0.192/26"
        AllowCustomName = true
        EnableNsg       = false
        Nsg = {
          Name = "value"
          Rules = {

          }
        }
      }
    ]
    VmEnabled = true
    WinVm = {
      Enabled   = true
      Publisher = "MicrosoftWindowsDesktop"
      Offer     = "windows-11"
      Sku       = "win11-25h2-ent"
      VmSize    = "Standard_E4as_v5"
      VmSuffix  = "server1"
    }
    LinuxVmEnabled = true
    LinuxVm = {
      Enabled  = true
      VmSize   = "Standard_E4as_v5"
      VmSuffix = "server2"

    }


  }
}

CustomizeStaName = true

RgConfig = {
  "rsg-monitor" = {
    RgLocation = "francecentral"
    RgName     = "rsg-monitor-lab2"
  }
  "rsg-kv" = {
    RgLocation = "francecentral"
    RgName     = "rsg-kv-lab2"
  }
  "rsg-dns" = {
    RgLocation = "francecentral"
    RgName     = "rsg-dns-lab2"
  }
}

