function Invoke-NimbusApiRequest {
    <#
    .SYNOPSIS
    Helper function to send requests to the Nimbus API.

    .PARAMETER Method
    HTTP method to use (GET, POST, DELETE, etc.).

    .PARAMETER Uri
    Full request URI.

    .PARAMETER AuthToken
    OAuth token used for authentication.

    .PARAMETER Body
    Optional body for POST/PUT requests.
    #>
    [CmdletBinding()]
    param (
        [Parameter(Mandatory=$true)]
        [string]$Method,
        [Parameter(Mandatory=$true)]
        [string]$Uri,
        [Parameter(Mandatory=$true)]
        [string]$AuthToken,
        $Body
    )

    $headers = @{ Authorization = "Bearer $AuthToken" }
    if ($Body) {
        $json = $Body | ConvertTo-Json -Compress -Depth 5
        return Invoke-RestMethod -Method $Method -Uri $Uri -Headers $headers -Body $json -ContentType 'application/json' -UserAgent 'NimbusPowerShellModule/1.0.0'
    } else {
        return Invoke-RestMethod -Method $Method -Uri $Uri -Headers $headers -UserAgent 'NimbusPowerShellModule/1.0.0'
    }
}
