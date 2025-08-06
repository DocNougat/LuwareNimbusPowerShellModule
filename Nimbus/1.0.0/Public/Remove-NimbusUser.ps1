<#
.SYNOPSIS
Removes a user from Nimbus using the specified user ID.

.DESCRIPTION
The Remove-NimbusUser function deletes a user from the Nimbus system by sending a DELETE request to the Nimbus API. 
It requires an authentication token, the base URI of the Nimbus API, and the user ID of the user to be removed.

.PARAMETER AuthToken
The authentication token used to authorize the API request.

.PARAMETER BaseUri
The base URI of the Nimbus API.

.PARAMETER UserO365GUID
The unique identifier of the user to be removed.

.EXAMPLE
Remove-NimbusUser -AuthToken $token -BaseUri "https://portal.ukso-01.luware.cloud" -UserO365GUID "123456789-asdf-1234567890-asdfghjkl"

.NOTES
Throws an exception if the API request fails.
#>
function Remove-NimbusUser {
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
        Invoke-NimbusApiRequest -Method 'DELETE' -Uri $uri -AuthToken $AuthToken
    } catch {
        Write-Debug $_
        throw $_
    }
}
