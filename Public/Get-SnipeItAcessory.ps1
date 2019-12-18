function Get-SnipeItAcessory {
<#
.SYNOPSIS
 Return a listing of accessories

.DESCRIPTION
 Accessories: Return a listing of accessories

 AccessoriesById: Get the details on an accessory

.LINK
 https://snipe-it.readme.io/reference#accessories

.LINK
 https://snipe-it.readme.io/reference#accessoriesid

#>
[CmdletBinding(DefaultParameterSetName="Accessories")]
param (
    <# ParameterSet Accessories #>
    
    [Parameter(ParameterSetName='Accessories')]
    [switch]$Accessories,
    
    # Specify the number of results you wish to return
    [Parameter(ParameterSetName='Accessories')]
    [int]$limit,
    
    # Offset to use
    [Parameter(ParameterSetName='Accessories')]
    [int]$offset,
    
    # A text string to search the assets data for
    [Parameter(ParameterSetName='Accessories')]
    [string]$search,
    
    # Return only assets associated with a specific order number
    [Parameter(ParameterSetName='Accessories')]
    [string]$order_number,
    
    # Specify the column name you wish to sort by
    [Parameter(ParameterSetName='Accessories')]
    [string]$sort,
    
    # Specify the order (asc or desc) you wish to order by on your sort column
    [Parameter(ParameterSetName='Accessories')]
    [ValidateSet($null, "asc", "desc")]
    [string]$order,
    
    # Whether to include detailed information on categories, etc (true) or just the text name (false)
    [Parameter(ParameterSetName='Accessories')]
    [string]$expand,
    
    <# ParameterSet AccessoriesById #>
    
    [Parameter(ParameterSetName='AccessoriesById', Mandatory=$true, ValueFromPipelineByPropertyName=$true)]
    [int]$id,
    
    # URL of the SnipeItApp
    [Parameter(Mandatory=$True)]
    [string]$Url,
    
    # API Key to use for access
    [Parameter(Mandatory=$True)]
    [string]$ApiKey
    )
    
Write-Debug -Message ( "Function {0}, ParameterSetName is {1}" -f $PSCmdlet.MyInvocation.MyCommand, $PsCmdlet.ParameterSetName)

#region    ParameterSet: Accessories, parameters in body: 0, in query: 7

    if ($PsCmdlet.ParameterSetName -eq "Accessories") {
        $optionalParameters = . Get-ParameterValue
        $Parameters = @{
            Uri = "$url/api/v1/accessories"
            Method = "get"
            UriQuery = $optionalParameters
            Token = $apiKey
            }

        Invoke-SnipeItMethod @Parameters
        }
#endregion

#region    ParameterSet: AccessoriesById, parameters in body: 0, in query: 0

    if ($PsCmdlet.ParameterSetName -eq "AccessoriesById") {
        $Parameters = @{
            Uri = "$url/api/v1/accessories/$id"
            Method = "get"
            Token = $apiKey
            }

        Invoke-SnipeItMethod @Parameters
        }
#endregion


} # End of Get-SnipeItAcessory

