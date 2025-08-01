function New-NimbusUser {
    <#
    .SYNOPSIS
    Create a new Nimbus user.

    .DESCRIPTION
    Sends a request to create a new user based on the provided O365 and organization unit IDs.

    .PARAMETER AuthToken
    OAuth token used for authentication.

    .PARAMETER BaseUri
    Base URI of the Nimbus portal.

    .PARAMETER O365Id
    Azure AD object ID of an existing user.

    .PARAMETER OrganizationUnitId
    ID of the organization unit for the new user.
    #>
    [CmdletBinding()]
    param(
        [Parameter(Mandatory=$true)]
        [string]$AuthToken,
        [Parameter(Mandatory=$true)]
        [string]$BaseUri,
        [Parameter(Mandatory=$true)]
        [string]$O365Id,
        [Parameter(Mandatory=$true)]
        [string]$OrganizationUnitId
    )
    try {
        $uri = "$BaseUri/api/public-api-next/user"
        $body = @{ o365Id = $O365Id; organizationUnitId = $OrganizationUnitId }
        Invoke-NimbusApiRequest -Method 'POST' -Uri $uri -AuthToken $AuthToken -Body $body
    } catch {
        Write-Debug $_
        throw $_
    }
}
