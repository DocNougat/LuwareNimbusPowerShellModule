# LuwareNimbusPowerShellModule

PowerShell module for the Luware Nimbus API.

This repository contains a sample PowerShell module structured similarly to the Meraki PowerShell module. Each Nimbus command is implemented in its own script under `Nimbus/1.0.0/Public` and loaded through the module manifest.

## Usage

Import the module from the `Nimbus/1.0.0` directory, retrieve an authentication token, and call the other commands:

```powershell
Import-Module ./Nimbus/1.0.0/Nimbus.psd1
$token = Get-NimbusAppRegAuthToken -TenantId "<tenantId>" -ClientId "<clientId>" -ClientSecret "<clientSecret>" -BaseURL "https://portal.eu-1"
Get-NimbusUserDetails -AuthToken $token -BaseUri "https://portal.eu-1" -UserId "<id>"
Copy-NimbusUser -AuthToken $token -BaseUri "https://portal.eu-1" -SourceO365Id "<templateUserId>" -NewO365Id "<newUserId>"
```

The functions rely on the Nimbus REST API as documented on [help.luware.com](https://help.luware.com/nimbus-integrations/nimbus-api).
