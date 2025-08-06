<#
.SYNOPSIS
Invokes a REST API request to the Nimbus API with specified method, URI, authentication token, and optional body.

.DESCRIPTION
This function sends an HTTP request to the specified Nimbus API endpoint using the provided HTTP method, URI, and authentication token. Optionally, a JSON body can be included for requests that require it (e.g., POST or PUT). The function sets the appropriate headers for authorization and content type, and returns the response from the API.

.PARAMETER Method
The HTTP method to use for the request (e.g., GET, POST, PUT, DELETE).

.PARAMETER Uri
The URI of the Nimbus API endpoint to target.

.PARAMETER AuthToken
The bearer token used for authentication with the Nimbus API.

.PARAMETER Body
Optional. The JSON body to include in the request, typically used with POST or PUT methods.

.EXAMPLE
Invoke-NimbusApiRequest -Method $Method -Uri $URI -AuthToken $token

.EXAMPLE
Invoke-NimbusApiRequest -Method $Method -Uri $URI -AuthToken $token -Body $jsonBody

.NOTES
Requires PowerShell 5.1 or later and network connectivity to the Nimbus API endpoint.
#>
function Invoke-NimbusApiRequest {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory=$true)]
        [string]$Method,
        [Parameter(Mandatory=$true)]
        [string]$Uri,
        [Parameter(Mandatory=$true)]
        [string]$AuthToken,
        [Parameter(Mandatory=$false)]
        [JSON]$Body
    )

    $headers = @{
        "Authorization" = "Bearer $AuthToken"
        "Content-Type"  = "application/json"
    }
    $params = @{
        Method  = $Method
        Uri     = $Uri
        Headers = $headers
    }

    if ($Body) {
        $params.Body = $Body
    }

    return Invoke-RestMethod @params
}
