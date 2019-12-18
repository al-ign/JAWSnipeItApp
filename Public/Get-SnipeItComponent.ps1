function Get-SnipeItComponent {
<#
.SYNOPSIS
 Return a listing of components

.DESCRIPTION
 Components: Return a listing of components

 ComponentsById: Get the details on a component

.LINK
 https://snipe-it.readme.io/reference#components

.LINK
 https://snipe-it.readme.io/reference#componentsid

#>
[CmdletBinding(DefaultParameterSetName="Components")]
param (
    <# ParameterSet Components #>
    
    [Parameter(ParameterSetName='Components')]
    [switch]$Components,
    
    # Specify the number of results you wish to return
    [Parameter(ParameterSetName='Components')]
    [int]$limit,
    
    # Offset to use
    [Parameter(ParameterSetName='Components')]
    [int]$offset,
    
    # A text string to search the assets data for
    [Parameter(ParameterSetName='Components')]
    [string]$search,
    
    # Return only assets associated with a specific order number
    [Parameter(ParameterSetName='Components')]
    [string]$order_number,
    
    # Specify the column name you wish to sort by
    [Parameter(ParameterSetName='Components')]
    [string]$sort,
    
    # Specify the order (asc or desc) you wish to order by on your sort column
    [Parameter(ParameterSetName='Components')]
    [ValidateSet($null, "asc", "desc")]
    [string]$order,
    
    # Whether to include detailed information on categories, etc (true) or just the text name (false)
    [Parameter(ParameterSetName='Components')]
    [string]$expand,
    
    <# ParameterSet ComponentsById #>
    
    [Parameter(ParameterSetName='ComponentsById', Mandatory=$true, ValueFromPipelineByPropertyName=$true)]
    [int]$id,
    
    # URL of the SnipeItApp
    [Parameter(Mandatory=$True)]
    [string]$Url,
    
    # API Key to use for access
    [Parameter(Mandatory=$True)]
    [string]$ApiKey
    )
    
Write-Debug -Message ( "Function {0}, ParameterSetName is {1}" -f $PSCmdlet.MyInvocation.MyCommand, $PsCmdlet.ParameterSetName)

#region    ParameterSet: Components, parameters in body: 0, in query: 7

    if ($PsCmdlet.ParameterSetName -eq "Components") {
        $optionalParameters = . Get-ParameterValue
        $Parameters = @{
            Uri = "$url/api/v1/components"
            Method = "get"
            UriQuery = $optionalParameters
            Token = $apiKey
            }

        Invoke-SnipeItMethod @Parameters
        }
#endregion

#region    ParameterSet: ComponentsById, parameters in body: 0, in query: 0

    if ($PsCmdlet.ParameterSetName -eq "ComponentsById") {
        $Parameters = @{
            Uri = "$url/api/v1/components/$id"
            Method = "get"
            Token = $apiKey
            }

        Invoke-SnipeItMethod @Parameters
        }
#endregion


} # End of Get-SnipeItComponent

