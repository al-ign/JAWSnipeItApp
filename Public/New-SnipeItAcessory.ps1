function New-SnipeItAcessory {
<#
.SYNOPSIS
 Create a new accessory

.DESCRIPTION
 Accessories: Create a new accessory

.LINK
 https://snipe-it.readme.io/reference#accessories-1

#>
[CmdletBinding(DefaultParameterSetName="Accessories")]
param (
    <# ParameterSet Accessories #>
    
    [Parameter(ParameterSetName='Accessories', Mandatory=$true)]
    [string]$name,
    
    # Quantity of the accessory you have
    [Parameter(ParameterSetName='Accessories', Mandatory=$true)]
    [int]$qty,
    
    # Order number for this accessory.
    [Parameter(ParameterSetName='Accessories')]
    [string]$order_number,
    
    # Cost of item being purchased.
    [Parameter(ParameterSetName='Accessories')]
    [float]$purchase_cost,
    
    # Date accessory was purchased
    [Parameter(ParameterSetName='Accessories')]
    [string]$purchase_date,
    
    # Model number of Accessory
    [Parameter(ParameterSetName='Accessories')]
    [string]$model_number,
    
    # ID number of the category the accessory belongs to
    [Parameter(ParameterSetName='Accessories', Mandatory=$true)]
    [int]$category_id,
    
    # ID Number of the company the accessory is assigned to
    [Parameter(ParameterSetName='Accessories')]
    [int]$company_id,
    
    # ID number of the location the accessory is assigned to
    [Parameter(ParameterSetName='Accessories')]
    [int]$location_id,
    
    # ID number of the manufacturer for this accessory.
    [Parameter(ParameterSetName='Accessories')]
    [int]$manufacturer_id,
    
    # ID number of the supplier for this accessory
    [Parameter(ParameterSetName='Accessories')]
    [int]$supplier_id,
    
    # URL of the SnipeItApp
    [Parameter(Mandatory=$True)]
    [string]$Url,
    
    # API Key to use for access
    [Parameter(Mandatory=$True)]
    [string]$ApiKey
    )
    
Write-Debug -Message ( "Function {0}, ParameterSetName is {1}" -f $PSCmdlet.MyInvocation.MyCommand, $PsCmdlet.ParameterSetName)

#region    ParameterSet: Accessories, parameters in body: 11, in query: 0

    if ($PsCmdlet.ParameterSetName -eq "Accessories") {
        $optionalParameters = . Get-ParameterValue
        $Parameters = @{
            Uri = "$url/api/v1/accessories"
            Method = "post"
            Body = $optionalParameters | ConvertTo-Json
            Token = $apiKey
            }

        Invoke-SnipeItMethod @Parameters
        }
#endregion


} # End of New-SnipeItAcessory

