function Get-SnipeItMaintenance {
<#
.SYNOPSIS
 List asset maintenances

.DESCRIPTION
 Maintenances: List asset maintenances

.LINK
 https://snipe-it.readme.io/reference#maintenances

#>
[CmdletBinding(DefaultParameterSetName="Maintenances")]
param (
    <# ParameterSet Maintenances #>
    
    [Parameter(ParameterSetName='Maintenances')]
    [switch]$Maintenances,
    
    # Number of results to return
    [Parameter(ParameterSetName='Maintenances')]
    [int]$limit,
    
    # Offset to use when retrieving results (useful in pagination)
    [Parameter(ParameterSetName='Maintenances')]
    [int]$offset,
    
    # Search string
    [Parameter(ParameterSetName='Maintenances')]
    [string]$search,
    
    # Field to order by
    [Parameter(ParameterSetName='Maintenances')]
    [string]$sort,
    
    # Sort order (asc or desc)
    [Parameter(ParameterSetName='Maintenances')]
    [ValidateSet($null, "asc", "desc")]
    [string]$order,
    
    # Asset ID of the asset you'd like to return maintenances for
    [Parameter(ParameterSetName='Maintenances')]
    [int]$asset_id,
    
    # URL of the SnipeItApp
    [Parameter(Mandatory=$True)]
    [string]$Url,
    
    # API Key to use for access
    [Parameter(Mandatory=$True)]
    [string]$ApiKey
    )
    
Write-Debug -Message ( "Function {0}, ParameterSetName is {1}" -f $PSCmdlet.MyInvocation.MyCommand, $PsCmdlet.ParameterSetName)

#region    ParameterSet: Maintenances, parameters in body: 0, in query: 6

    if ($PsCmdlet.ParameterSetName -eq "Maintenances") {
        $optionalParameters = . Get-ParameterValue
        $Parameters = @{
            Uri = "$url/api/v1/maintenances"
            Method = "get"
            UriQuery = $optionalParameters
            Token = $apiKey
            }

        Invoke-SnipeItMethod @Parameters
        }
#endregion


} # End of Get-SnipeItMaintenance

