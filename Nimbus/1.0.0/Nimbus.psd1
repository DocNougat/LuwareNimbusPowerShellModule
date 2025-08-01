@{
    RootModule = 'Nimbus.psm1'
    ModuleVersion = '1.0.0'
    GUID = '00000000-0000-0000-0000-000000000000'
    Author = ''
    CompanyName = ''
    Description = 'A PowerShell module for the Luware Nimbus API'
    PowerShellVersion = '5.1'
    FunctionsToExport = @(
        'Get-NimbusUserDetails',
        'New-NimbusUser',
        'Remove-NimbusUser',
        'Get-NimbusLicenseUsage',
        'Copy-NimbusUser'
    )
}
