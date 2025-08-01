<#
.SYNOPSIS
Retrieves an OAuth 2.0 access token for Microsoft Graph using application credentials.

.DESCRIPTION
The Get-GraphAuthToken function requests an access token from Azure AD for Microsoft Graph API using the client credentials flow. It requires the tenant ID, client ID, and client secret of an Azure AD application.

.PARAMETER TenantId
The Azure Active Directory tenant ID.

.PARAMETER ClientId
The client ID of the Azure AD application.

.PARAMETER ClientSecret
The client secret of the Azure AD application.

.OUTPUTS
System.String
Returns the access token as a string.

.EXAMPLE
$token = Get-GraphAuthToken -TenantId "your-tenant-id" -ClientId "your-client-id" -ClientSecret "your-client-secret"

.NOTES
Requires network connectivity and valid Azure AD application credentials.
#>
function Get-NimbusAppRegAuthToken {
    param (
        [string]$TenantId,
        [string]$ClientId,
        [string]$ClientSecret,
        [string]$BaseURL
    )

    $body = @{
        grant_type    = "client_credentials"
        client_id     = $ClientId
        client_secret = $ClientSecret
        scope         = $BaseURL + "/.default"
    }

    $tokenResponse = Invoke-RestMethod -Method POST -Uri "https://login.microsoftonline.com/$TenantId/oauth2/v2.0/token" -Body $body
    return $tokenResponse.access_token
}