<#
.SYNOPSIS
Retrieves Nimbus license usage information for users.

.DESCRIPTION
The Get-NimbusLicenseUsage function sends a GET request to the Nimbus API to obtain license usage details for users. It requires an authentication token and the base URI of the Nimbus API.

.PARAMETER AuthToken
The authentication token used to authorize the API request.

.PARAMETER BaseUri
The base URI of the Nimbus API endpoint.

.EXAMPLE
Get-NimbusLicenseUsage -AuthToken $token -BaseUri "https://portal.ukso-01.luware.cloud"

.REMARKS
This function relies on the Invoke-NimbusApiRequest helper function to perform the API call.

.NOTES
Author: Alex Heimbuch
Module: LuwareNimbusPowerShellModule
#>
function Get-NimbusLicenseUsage {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory=$true)]
        [string]$AuthToken,
        [Parameter(Mandatory=$true)]
        [string]$BaseUri
    )
    try {
        $uri = "$BaseUri/api/public-api-next/user/license-usage"
        Invoke-NimbusApiRequest -Method 'GET' -Uri $uri -AuthToken $AuthToken
    } catch {
        Write-Debug $_
        throw $_
    }
}
