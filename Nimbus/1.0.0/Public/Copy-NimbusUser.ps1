function Copy-NimbusUser {
    <#
    .SYNOPSIS
    Create a new Nimbus user by copying settings from an existing user.

    .DESCRIPTION
    Sends a request to copy the configuration of an existing user to a new user identified by their O365 IDs.

    .PARAMETER AuthToken
    OAuth token used for authentication.

    .PARAMETER BaseUri
    Base URI of the Nimbus portal.

    .PARAMETER SourceO365Id
    O365 ID of the user whose settings should be used as a template.

    .PARAMETER NewO365Id
    O365 ID for the new user that will be created.
    #>
    [CmdletBinding()]
    param(
        [Parameter(Mandatory=$true)]
        [string]$AuthToken,
        [Parameter(Mandatory=$true)]
        [string]$BaseUri,
        [Parameter(Mandatory=$true)]
        [string]$SourceO365Id,
        [Parameter(Mandatory=$true)]
        [string]$NewO365Id
    )
    try {
        $uri = "$BaseUri/api/public-api-next/user/copy"
        $body = @{ sourceO365Id = $SourceO365Id; newO365Id = $NewO365Id }
        Invoke-NimbusApiRequest -Method 'POST' -Uri $uri -AuthToken $AuthToken -Body $body
    } catch {
        Write-Debug $_
        throw $_
    }
}
