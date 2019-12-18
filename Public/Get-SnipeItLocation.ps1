function Get-SnipeItLocation {
<#
.SYNOPSIS
 List locations

.DESCRIPTION
 Locations: List locations

 LocationsById: Get location details by id

.LINK
 https://snipe-it.readme.io/reference#locations

.LINK
 https://snipe-it.readme.io/reference#locations-1

#>
[CmdletBinding(DefaultParameterSetName="Locations")]
param (
    <# ParameterSet Locations #>
    
    [Parameter(ParameterSetName='Locations')]
    [switch]$Locations,
    
    # Number of results to return
    [Parameter(ParameterSetName='Locations')]
    [int]$limit,
    
    # Offset to use when retrieving results (useful in pagination)
    [Parameter(ParameterSetName='Locations')]
    [int]$offset,
    
    # Search string
    [Parameter(ParameterSetName='Locations')]
    [string]$search,
    
    # Field to order by
    [Parameter(ParameterSetName='Locations')]
    [string]$sort,
    
    # Sort order (asc or desc)
    [Parameter(ParameterSetName='Locations')]
    [ValidateSet($null, "asc", "desc")]
    [string]$order,
    
    <# ParameterSet LocationsById #>
    
    [Parameter(ParameterSetName='LocationsById', Mandatory=$true, ValueFromPipelineByPropertyName=$true)]
    [int]$id,
    
    # URL of the SnipeItApp
    [Parameter(Mandatory=$True)]
    [string]$Url,
    
    # API Key to use for access
    [Parameter(Mandatory=$True)]
    [string]$ApiKey
    )
    
Write-Debug -Message ( "Function {0}, ParameterSetName is {1}" -f $PSCmdlet.MyInvocation.MyCommand, $PsCmdlet.ParameterSetName)

#region    ParameterSet: Locations, parameters in body: 0, in query: 5

    if ($PsCmdlet.ParameterSetName -eq "Locations") {
        $optionalParameters = . Get-ParameterValue
        $Parameters = @{
            Uri = "$url/api/v1/locations"
            Method = "get"
            UriQuery = $optionalParameters
            Token = $apiKey
            }

        Invoke-SnipeItMethod @Parameters
        }
#endregion

#region    ParameterSet: LocationsById, parameters in body: 0, in query: 0

    if ($PsCmdlet.ParameterSetName -eq "LocationsById") {
        $Parameters = @{
            Uri = "$url/api/v1/locations/$id"
            Method = "get"
            Token = $apiKey
            }

        Invoke-SnipeItMethod @Parameters
        }
#endregion


} # End of Get-SnipeItLocation

