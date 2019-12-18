function New-SnipeItLocation {
<#
.SYNOPSIS
 Create a new location

.DESCRIPTION
 Locations: Create a new location

.LINK
 https://snipe-it.readme.io/reference#locations-2

#>
[CmdletBinding(DefaultParameterSetName="Locations")]
param (
    <# ParameterSet Locations #>
    
    [Parameter(ParameterSetName='Locations', Mandatory=$true)]
    [string]$name,
    
    [Parameter(ParameterSetName='Locations')]
    [string]$address,
    
    [Parameter(ParameterSetName='Locations')]
    [string]$address2,
    
    [Parameter(ParameterSetName='Locations')]
    [string]$state,
    
    [Parameter(ParameterSetName='Locations')]
    [string]$country,
    
    [Parameter(ParameterSetName='Locations')]
    [string]$zip,
    
    # URL of the SnipeItApp
    [Parameter(Mandatory=$True)]
    [string]$Url,
    
    # API Key to use for access
    [Parameter(Mandatory=$True)]
    [string]$ApiKey
    )
    
Write-Debug -Message ( "Function {0}, ParameterSetName is {1}" -f $PSCmdlet.MyInvocation.MyCommand, $PsCmdlet.ParameterSetName)

#region    ParameterSet: Locations, parameters in body: 6, in query: 0

    if ($PsCmdlet.ParameterSetName -eq "Locations") {
        $optionalParameters = . Get-ParameterValue
        $Parameters = @{
            Uri = "$url/api/v1/locations"
            Method = "post"
            Body = $optionalParameters | ConvertTo-Json
            Token = $apiKey
            }

        Invoke-SnipeItMethod @Parameters
        }
#endregion


} # End of New-SnipeItLocation

