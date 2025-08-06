@{
    RootModule = 'Nimbus.psm1'
    ModuleVersion = '1.0.0'
    GUID = '4a9b4723-28eb-4251-8b55-727e7dc0975f'
    Author = 'Alex Heimbuch'
    CompanyName = ''
    Description = 'A PowerShell module for the Luware Nimbus API'
    PowerShellVersion = '5.1'
    FunctionsToExport = @(
        'Get-NimbusUserDetails',
        'New-NimbusUser',
        'Remove-NimbusUser',
        'Get-NimbusAppRegAuthToken',
        'Get-NimbusLicenseUsage',
        'Copy-NimbusUser',
        'Get-NimbusLicenseUsage'
    )
}
