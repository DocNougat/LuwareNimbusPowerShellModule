<#
.SYNOPSIS
Retrieves an OAuth 2.0 access token for an Azure AD application registration using client credentials.

.DESCRIPTION
The Get-NimbusAppRegAuthToken function requests an access token from Azure Active Directory for a specified tenant and application registration. It uses the client credentials grant type and returns the access token required for authentication against APIs secured by Azure AD.

.PARAMETER TenantId
The Azure Active Directory tenant ID.

.PARAMETER ClientId
The application (client) ID of the Azure AD app registration.

.PARAMETER ClientSecret
The client secret associated with the Azure AD app registration.

.PARAMETER BaseURL
The base URL of the resource for which the access token is requested.

.EXAMPLE
$token = Get-NimbusAppRegAuthToken -TenantId "your-tenant-id" -ClientId "your-client-id" -ClientSecret "your-client-secret" -BaseURL "https://portal.ukso-01.luware.cloud"

.RETURNS
Returns the OAuth 2.0 access token as a string.

.NOTES
Ensure that the provided client ID and client secret have the necessary permissions to request tokens for the specified resource.
#>
function Get-NimbusAppRegAuthToken {
    param (
        [string]$TenantId,
        [string]$ClientId,
        [string]$ClientSecret,
        [string]$BaseURL
    )

    $scope = "$BaseURL/.default"

    $pair = "$($ClientId):$($ClientSecret)"
    $encodedAuth = [Convert]::ToBase64String([System.Text.Encoding]::UTF8.GetBytes($pair))
    $headers = @{
        Authorization = "Basic $encodedAuth"
        "Content-Type" = "application/x-www-form-urlencoded"
    }

    $body = @{
        grant_type = "client_credentials"
        scope      = $scope
    }

    $response = Invoke-RestMethod -Method POST `
        -Uri "https://login.microsoftonline.com/$TenantId/oauth2/v2.0/token" `
        -Headers $headers `
        -Body $body `
        -ContentType "application/x-www-form-urlencoded"

    return $response.access_token
}
