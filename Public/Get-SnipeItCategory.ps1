function Get-SnipeItCategory {
<#
.SYNOPSIS
 List categories

.DESCRIPTION
 Categories: List categories

 CategoriesById: Return a Category by id

.LINK
 https://snipe-it.readme.io/reference#categories-1

.LINK
 https://snipe-it.readme.io/reference#categoriesid-3

#>
[CmdletBinding(DefaultParameterSetName="Categories")]
param (
    <# ParameterSet Categories #>
    
    [Parameter(ParameterSetName='Categories')]
    [switch]$Categories,
    
    # Number of results to return
    [Parameter(ParameterSetName='Categories')]
    [int]$limit,
    
    # Offset number (useful in pagination)
    [Parameter(ParameterSetName='Categories')]
    [int]$offset,
    
    # Search string
    [Parameter(ParameterSetName='Categories')]
    [string]$search,
    
    [Parameter(ParameterSetName='Categories')]
    [string]$sort,
    
    # Sort order (asc or desc)
    [Parameter(ParameterSetName='Categories')]
    [ValidateSet($null, "asc", "desc")]
    [string]$order,
    
    <# ParameterSet CategoriesById #>
    
    # Category ID
    [Parameter(ParameterSetName='CategoriesById', Mandatory=$true, ValueFromPipelineByPropertyName=$true)]
    [int]$id,
    
    # URL of the SnipeItApp
    [Parameter(Mandatory=$True)]
    [string]$Url,
    
    # API Key to use for access
    [Parameter(Mandatory=$True)]
    [string]$ApiKey
    )
    
Write-Debug -Message ( "Function {0}, ParameterSetName is {1}" -f $PSCmdlet.MyInvocation.MyCommand, $PsCmdlet.ParameterSetName)

#region    ParameterSet: Categories, parameters in body: 0, in query: 5

    if ($PsCmdlet.ParameterSetName -eq "Categories") {
        $optionalParameters = . Get-ParameterValue
        $Parameters = @{
            Uri = "$url/api/v1/categories"
            Method = "get"
            UriQuery = $optionalParameters
            Token = $apiKey
            }

        Invoke-SnipeItMethod @Parameters
        }
#endregion

#region    ParameterSet: CategoriesById, parameters in body: 0, in query: 0

    if ($PsCmdlet.ParameterSetName -eq "CategoriesById") {
        $Parameters = @{
            Uri = "$url/api/v1/categories/$id"
            Method = "get"
            Token = $apiKey
            }

        Invoke-SnipeItMethod @Parameters
        }
#endregion


} # End of Get-SnipeItCategory

