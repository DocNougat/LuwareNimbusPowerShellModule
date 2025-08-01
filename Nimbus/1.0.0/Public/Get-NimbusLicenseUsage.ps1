function Get-NimbusLicenseUsage {
    <#
    .SYNOPSIS
    Retrieve Nimbus license usage information.

    .DESCRIPTION
    Returns details about the total, used and available Nimbus licenses.

    .PARAMETER AuthToken
    OAuth token used for authentication.

    .PARAMETER BaseUri
    Base URI of the Nimbus portal.
    #>
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
