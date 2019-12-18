function Get-SnipeItConsumable {
<#
.SYNOPSIS
 Return a listing of consumables

.DESCRIPTION
 Consumables: Return a listing of consumables

 ConsumablesById: Get the details on a consumable

.LINK
 https://snipe-it.readme.io/reference#consumables

.LINK
 https://snipe-it.readme.io/reference#consumablesid

#>
[CmdletBinding(DefaultParameterSetName="Consumables")]
param (
    <# ParameterSet Consumables #>
    
    [Parameter(ParameterSetName='Consumables')]
    [switch]$Consumables,
    
    # Specify the number of results you wish to return
    [Parameter(ParameterSetName='Consumables')]
    [int]$limit,
    
    # Offset to use
    [Parameter(ParameterSetName='Consumables')]
    [int]$offset,
    
    # A text string to search the assets data for
    [Parameter(ParameterSetName='Consumables')]
    [string]$search,
    
    # Return only assets associated with a specific order number
    [Parameter(ParameterSetName='Consumables')]
    [string]$order_number,
    
    # Specify the column name you wish to sort by
    [Parameter(ParameterSetName='Consumables')]
    [string]$sort,
    
    # Specify the order (asc or desc) you wish to order by on your sort column
    [Parameter(ParameterSetName='Consumables')]
    [ValidateSet($null, "asc", "desc")]
    [string]$order,
    
    # Whether to include detailed information on categories, etc (true) or just the text name (false)
    [Parameter(ParameterSetName='Consumables')]
    [string]$expand,
    
    # Category ID to filter by
    [Parameter(ParameterSetName='Consumables')]
    [int]$category_id,
    
    # Company ID to filter by
    [Parameter(ParameterSetName='Consumables')]
    [int]$company_id,
    
    # Manufacturer ID to filter by
    [Parameter(ParameterSetName='Consumables')]
    [int]$manufacturer_id,
    
    <# ParameterSet ConsumablesById #>
    
    [Parameter(ParameterSetName='ConsumablesById', Mandatory=$true, ValueFromPipelineByPropertyName=$true)]
    [int]$id,
    
    # URL of the SnipeItApp
    [Parameter(Mandatory=$True)]
    [string]$Url,
    
    # API Key to use for access
    [Parameter(Mandatory=$True)]
    [string]$ApiKey
    )
    
Write-Debug -Message ( "Function {0}, ParameterSetName is {1}" -f $PSCmdlet.MyInvocation.MyCommand, $PsCmdlet.ParameterSetName)

#region    ParameterSet: Consumables, parameters in body: 0, in query: 10

    if ($PsCmdlet.ParameterSetName -eq "Consumables") {
        $optionalParameters = . Get-ParameterValue
        $Parameters = @{
            Uri = "$url/api/v1/consumables"
            Method = "get"
            UriQuery = $optionalParameters
            Token = $apiKey
            }

        Invoke-SnipeItMethod @Parameters
        }
#endregion

#region    ParameterSet: ConsumablesById, parameters in body: 0, in query: 0

    if ($PsCmdlet.ParameterSetName -eq "ConsumablesById") {
        $Parameters = @{
            Uri = "$url/api/v1/consumables/$id"
            Method = "get"
            Token = $apiKey
            }

        Invoke-SnipeItMethod @Parameters
        }
#endregion


} # End of Get-SnipeItConsumable

