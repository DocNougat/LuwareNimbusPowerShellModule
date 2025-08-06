<#
.SYNOPSIS
Retrieves detailed information about a Nimbus user by their O365 GUID.

.DESCRIPTION
The Get-NimbusUserDetails function calls the Nimbus API to fetch user details for a specified O365 GUID. It requires an authentication token, the base URI of the Nimbus API, and the user's O365 GUID. The function handles errors by writing debug information and rethrowing exceptions.

.PARAMETER AuthToken
The authentication token used to authorize the API request.

.PARAMETER BaseUri
The base URI of the Nimbus API endpoint.

.PARAMETER UserO365GUID
The Office 365 GUID of the user whose details are to be retrieved.

.EXAMPLE
Get-NimbusUserDetails -AuthToken $token -BaseUri ""https://portal.ukso-01.luware.cloud" -UserO365GUID "12345678-90ab-cdef-1234-567890abcdef"

.REMARKS
Requires the Invoke-NimbusApiRequest function to be available in the session.
#>
function Get-NimbusUserDetails {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory=$true)]
        [string]$AuthToken,
        [Parameter(Mandatory=$true)]
        [string]$BaseUri,
        [Parameter(Mandatory=$true)]
        [string]$UserO365GUID
    )
    try {
        $uri = "$BaseUri/api/public-api-next/user/$UserO365GUID"
        Invoke-NimbusApiRequest -Method 'GET' -Uri $uri -AuthToken $AuthToken
    } catch {
        Write-Debug $_
        throw $_
    }
}
