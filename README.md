# Luware Nimbus PowerShell Module

This module provides PowerShell cmdlets for interacting with the [Luware Nimbus](https://www.luware.com) API. It helps you manage Nimbus users and query license usage directly from scripts or the command line.

## Requirements

- PowerShell 5.1 or later
- Network access to a Luware Nimbus endpoint
- An Azure AD application registration configured for Nimbus API access

## Installation

Clone this repository or download the module files, then import the module manifest:

```powershell
Import-Module "./Nimbus/1.0.0/Nimbus.psd1"
```

## Authentication

Use `Get-NimbusAppRegAuthToken` to obtain an OAuth token using your Azure AD application registration.

```powershell
$token = Get-NimbusAppRegAuthToken -TenantId "<tenant-id>" -ClientId "<client-id>" -ClientSecret "<client-secret>" -BaseUrl "https://portal.ukso-01.luware.cloud"
```

The token returned is used with all other cmdlets via the `AuthToken` parameter.

## Usage

Retrieve detailed information about a Nimbus user:

```powershell
Get-NimbusUserDetails -AuthToken $token -BaseUri "https://portal.ukso-01.luware.cloud" -UserO365GUID "<user-guid>"
```

Create a new Nimbus user:

```powershell
New-NimbusUser -AuthToken $token -BaseUri "https://portal.ukso-01.luware.cloud" -UserO365GUID "<user-guid>" -OrganizationUnitId "<ou-id>"
```

Remove a Nimbus user:

```powershell
Remove-NimbusUser -AuthToken $token -BaseUri "https://portal.ukso-01.luware.cloud" -UserO365GUID "<user-guid>"
```

Copy an existing Nimbus user to a new user ID:

```powershell
Copy-NimbusUser -AuthToken $token -BaseUri "https://portal.ukso-01.luware.cloud" -SourceO365GUID "<source-guid>" -NewO365GUID "<target-guid>"
```

Retrieve license usage information:

```powershell
Get-NimbusLicenseUsage -AuthToken $token -BaseUri "https://portal.ukso-01.luware.cloud"
```

## Notes

All cmdlets rely on `Invoke-NimbusApiRequest`, which handles REST calls to the Nimbus API. Ensure your token has the necessary permissions for the requested actions.

