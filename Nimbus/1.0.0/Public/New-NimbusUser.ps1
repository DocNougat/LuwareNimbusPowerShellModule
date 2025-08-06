<#
.SYNOPSIS
Creates a new Nimbus user in the specified organization unit.

.DESCRIPTION
The New-NimbusUser function sends a POST request to the Nimbus API to create a new user with the provided Office 365 ID and organization unit ID. Requires authentication via an AuthToken and the base URI of the Nimbus API.

.PARAMETER AuthToken
The authentication token used to authorize the API request.

.PARAMETER BaseUri
The base URI of the Nimbus API endpoint.

.PARAMETER UserO365GUID
The Office 365 ID of the user to be created.

.PARAMETER OrganizationUnitId
The ID of the organization unit where the user will be created.

.EXAMPLE
New-NimbusUser -AuthToken $token -BaseUri "https://portal.ukso-01.luware.cloud" -UserO365GUID "user@domain.com" -OrganizationUnitId "ou-12345"

.NOTES
Throws an exception if the API request fails.
#>
function New-NimbusUser {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory=$true)]
        [string]$AuthToken,
        [Parameter(Mandatory=$true)]
        [string]$BaseUri,
        [Parameter(Mandatory=$true)]
        [string]$UserO365GUID,
        [Parameter(Mandatory=$true)]
        [string]$OrganizationUnitId
    )
    try {
        $uri = "$BaseUri/api/public-api-next/user"
        $body = @{ UserO365GUID = $UserO365GUID; organizationUnitId = $OrganizationUnitId }
        Invoke-NimbusApiRequest -Method 'POST' -Uri $uri -AuthToken $AuthToken -Body $body
    } catch {
        Write-Debug $_
        throw $_
    }
}
