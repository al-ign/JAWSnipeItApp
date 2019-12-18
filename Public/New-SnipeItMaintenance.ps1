function New-SnipeItMaintenance {
<#
.SYNOPSIS
 Create a new maintenance

.DESCRIPTION
 Maintenances: Create a new maintenance

.LINK
 https://snipe-it.readme.io/reference#maintenances-1

#>
[CmdletBinding(DefaultParameterSetName="Maintenances")]
param (
    <# ParameterSet Maintenances #>
    
    [Parameter(ParameterSetName='Maintenances', Mandatory=$true)]
    [string]$name,
    
    [Parameter(ParameterSetName='Maintenances')]
    [string]$address,
    
    [Parameter(ParameterSetName='Maintenances')]
    [string]$address2,
    
    [Parameter(ParameterSetName='Maintenances')]
    [string]$state,
    
    [Parameter(ParameterSetName='Maintenances')]
    [string]$country,
    
    [Parameter(ParameterSetName='Maintenances')]
    [string]$zip,
    
    # URL of the SnipeItApp
    [Parameter(Mandatory=$True)]
    [string]$Url,
    
    # API Key to use for access
    [Parameter(Mandatory=$True)]
    [string]$ApiKey
    )
    
Write-Debug -Message ( "Function {0}, ParameterSetName is {1}" -f $PSCmdlet.MyInvocation.MyCommand, $PsCmdlet.ParameterSetName)

#region    ParameterSet: Maintenances, parameters in body: 6, in query: 0

    if ($PsCmdlet.ParameterSetName -eq "Maintenances") {
        $optionalParameters = . Get-ParameterValue
        $Parameters = @{
            Uri = "$url/api/v1/maintenances"
            Method = "post"
            Body = $optionalParameters | ConvertTo-Json
            Token = $apiKey
            }

        Invoke-SnipeItMethod @Parameters
        }
#endregion


} # End of New-SnipeItMaintenance

