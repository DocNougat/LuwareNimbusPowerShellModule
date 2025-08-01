function Get-NimbusUserDetails {
    <#
    .SYNOPSIS
    Retrieve configuration details of an existing Nimbus user.

    .DESCRIPTION
    Calls the Nimbus API to get details for the specified user by O365 ID.

    .PARAMETER AuthToken
    OAuth token used to authorize the request.

    .PARAMETER BaseUri
    Base URI of the Nimbus portal, e.g. https://portal.eu-1.

    .PARAMETER UserId
    O365 ID of the user to query.
    #>
    [CmdletBinding()]
    param(
        [Parameter(Mandatory=$true)]
        [string]$AuthToken,
        [Parameter(Mandatory=$true)]
        [string]$BaseUri,
        [Parameter(Mandatory=$true)]
        [string]$UserId
    )
    try {
        $uri = "$BaseUri/api/public-api-next/user/$UserId"
        Invoke-NimbusApiRequest -Method 'GET' -Uri $uri -AuthToken $AuthToken
    } catch {
        Write-Debug $_
        throw $_
    }
}
