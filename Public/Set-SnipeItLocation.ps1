function Set-SnipeItLocation {
<#
.SYNOPSIS
 Partially updates a location

.DESCRIPTION
 Locations: Partially updates a location

.LINK
 https://snipe-it.readme.io/reference#locationsid

#>
[CmdletBinding(DefaultParameterSetName="Locations")]
param (
    <# ParameterSet Locations #>
    
    [Parameter(ParameterSetName='Locations')]
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
    
    [Parameter(ParameterSetName='Locations', Mandatory=$true, ValueFromPipelineByPropertyName=$true)]
    [int]$id,
    
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
        $optionalParameters = . Get-ParameterValue -DefaultExcludeParameter @('id', 'url', 'apiKey', 'Debug', 'Verbose', 'customfields')
        if ($PSBoundParameters.ContainsKey("customfields")) { 
            $optionalParameters += $customfields
            }

        $Parameters = @{
            Uri = "$url/api/v1/locations/$id"
            Method = "patch"
            Body = $optionalParameters | ConvertTo-Json
            Token = $apiKey
            }

        Invoke-SnipeItMethod @Parameters
        }
#endregion


} # End of Set-SnipeItLocation

