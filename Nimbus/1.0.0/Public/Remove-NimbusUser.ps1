function Remove-NimbusUser {
    <#
    .SYNOPSIS
    Delete an existing Nimbus user.

    .DESCRIPTION
    Removes a user profile from Nimbus. This does not remove the user from the Azure tenant.

    .PARAMETER AuthToken
    OAuth token used for authentication.

    .PARAMETER BaseUri
    Base URI of the Nimbus portal.

    .PARAMETER UserId
    O365 ID of the user to remove.
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
        Invoke-NimbusApiRequest -Method 'DELETE' -Uri $uri -AuthToken $AuthToken
    } catch {
        Write-Debug $_
        throw $_
    }
}
