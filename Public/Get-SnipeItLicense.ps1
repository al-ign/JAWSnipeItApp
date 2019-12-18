function Get-SnipeItLicense {
<#
.SYNOPSIS
 Return a listing of licenses

.DESCRIPTION
 Licenses: Return a listing of licenses

 LicensesById: no description was provided in the API reference

.LINK
 https://snipe-it.readme.io/reference#licenses

.LINK
 https://snipe-it.readme.io/reference#licensesid

#>
[CmdletBinding(DefaultParameterSetName="Licenses")]
param (
    <# ParameterSet Licenses #>
    
    [Parameter(ParameterSetName='Licenses')]
    [switch]$Licenses,
    
    # Specify the number of results you wish to return
    [Parameter(ParameterSetName='Licenses')]
    [int]$limit,
    
    # Offset to use
    [Parameter(ParameterSetName='Licenses')]
    [int]$offset,
    
    # A text string to search the assets data for
    [Parameter(ParameterSetName='Licenses')]
    [string]$search,
    
    # Return only assets associated with a specific order number
    [Parameter(ParameterSetName='Licenses')]
    [string]$order_number,
    
    # Specify the column name you wish to sort by
    [Parameter(ParameterSetName='Licenses')]
    [string]$sort,
    
    # Specify the order (asc or desc) you wish to order by on your sort column
    [Parameter(ParameterSetName='Licenses')]
    [ValidateSet($null, "asc", "desc")]
    [string]$order,
    
    # Whether to include detailed information on categories, etc (true) or just the text name (false)
    [Parameter(ParameterSetName='Licenses')]
    [string]$expand,
    
    <# ParameterSet LicensesById #>
    
    # The id (not name) of the license.
    [Parameter(ParameterSetName='LicensesById', Mandatory=$true, ValueFromPipelineByPropertyName=$true)]
    [int]$id,
    
    # URL of the SnipeItApp
    [Parameter(Mandatory=$True)]
    [string]$Url,
    
    # API Key to use for access
    [Parameter(Mandatory=$True)]
    [string]$ApiKey
    )
    
Write-Debug -Message ( "Function {0}, ParameterSetName is {1}" -f $PSCmdlet.MyInvocation.MyCommand, $PsCmdlet.ParameterSetName)

#region    ParameterSet: Licenses, parameters in body: 0, in query: 7

    if ($PsCmdlet.ParameterSetName -eq "Licenses") {
        $optionalParameters = . Get-ParameterValue
        $Parameters = @{
            Uri = "$url/api/v1/licenses"
            Method = "get"
            UriQuery = $optionalParameters
            Token = $apiKey
            }

        Invoke-SnipeItMethod @Parameters
        }
#endregion

#region    ParameterSet: LicensesById, parameters in body: 0, in query: 0

    if ($PsCmdlet.ParameterSetName -eq "LicensesById") {
        $Parameters = @{
            Uri = "$url/api/v1/licenses/$id"
            Method = "get"
            Token = $apiKey
            }

        Invoke-SnipeItMethod @Parameters
        }
#endregion


} # End of Get-SnipeItLicense

