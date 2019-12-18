function Get-SnipeItManufacturer {
<#
.SYNOPSIS
 Sorry, no description was provided in the API reference

.DESCRIPTION
 Manufacturers: no description was provided in the API reference

 ManufacturersById: View a manufacturer

.LINK
 https://snipe-it.readme.io/reference#manufacturers

.LINK
 https://snipe-it.readme.io/reference#manufacturersid-1

#>
[CmdletBinding(DefaultParameterSetName="Manufacturers")]
param (
    <# ParameterSet Manufacturers #>
    
    [Parameter(ParameterSetName='Manufacturers')]
    [switch]$Manufacturers,
    
    [Parameter(ParameterSetName='Manufacturers')]
    [string]$search,
    
    <# ParameterSet ManufacturersById #>
    
    # Manufacturer ID
    [Parameter(ParameterSetName='ManufacturersById', Mandatory=$true, ValueFromPipelineByPropertyName=$true)]
    [int]$id,
    
    # URL of the SnipeItApp
    [Parameter(Mandatory=$True)]
    [string]$Url,
    
    # API Key to use for access
    [Parameter(Mandatory=$True)]
    [string]$ApiKey
    )
    
Write-Debug -Message ( "Function {0}, ParameterSetName is {1}" -f $PSCmdlet.MyInvocation.MyCommand, $PsCmdlet.ParameterSetName)

#region    ParameterSet: Manufacturers, parameters in body: 0, in query: 1

    if ($PsCmdlet.ParameterSetName -eq "Manufacturers") {
        $optionalParameters = . Get-ParameterValue
        $Parameters = @{
            Uri = "$url/api/v1/manufacturers"
            Method = "get"
            UriQuery = $optionalParameters
            Token = $apiKey
            }

        Invoke-SnipeItMethod @Parameters
        }
#endregion

#region    ParameterSet: ManufacturersById, parameters in body: 0, in query: 0

    if ($PsCmdlet.ParameterSetName -eq "ManufacturersById") {
        $Parameters = @{
            Uri = "$url/api/v1/manufacturers/$id"
            Method = "get"
            Token = $apiKey
            }

        Invoke-SnipeItMethod @Parameters
        }
#endregion


} # End of Get-SnipeItManufacturer

