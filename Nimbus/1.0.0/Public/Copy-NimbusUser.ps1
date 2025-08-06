<#
.SYNOPSIS
Copies a Nimbus user from a source O365 ID to a new O365 ID.

.DESCRIPTION
The Copy-NimbusUser function sends a request to the Nimbus API to duplicate a user, identified by their O365 ID, to a new O365 ID. This is useful for provisioning or migrating users within the Nimbus system.

.PARAMETER AuthToken
The authentication token required to authorize the API request.

.PARAMETER BaseUri
The base URI of the Nimbus API endpoint.

.PARAMETER SourceO365GUID
The O365 ID of the user to be copied.

.PARAMETER NewO365GUID
The O365 ID for the new user to be created.

.EXAMPLE
Copy-NimbusUser -AuthToken $token -BaseUri "https://portal.ukso-01.luware.cloud" -SourceO365GUID "source-guid" -NewO365GUID "new-guid"

.NOTES
Requires the Invoke-NimbusApiRequest function to be available in the session.
#>
function Copy-NimbusUser {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory=$true)]
        [string]$AuthToken,
        [Parameter(Mandatory=$true)]
        [string]$BaseUri,
        [Parameter(Mandatory=$true)]
        [string]$SourceO365GUID,
        [Parameter(Mandatory=$true)]
        [string]$NewO365GUID
    )
    try {
        $uri = "$BaseUri/api/public-api-next/user/copy"
        $body = @{ sourceO365GUID = $SourceO365GUID; newO365GUID = $NewO365GUID }
        Invoke-NimbusApiRequest -Method 'POST' -Uri $uri -AuthToken $AuthToken -Body $body
    } catch {
        Write-Debug $_
        throw $_
    }
}
