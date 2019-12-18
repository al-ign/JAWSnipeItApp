function Set-SnipeItAsset {
<#
.SYNOPSIS
 Partially updates a specific asset

.DESCRIPTION
 Hardware: Partially updates a specific asset

.LINK
 https://snipe-it.readme.io/reference#hardware-partial-update

#>
[CmdletBinding(DefaultParameterSetName="Hardware")]
param (
    <# ParameterSet Hardware #>
    
    # The id of the asset you'd like to query
    [Parameter(ParameterSetName='Hardware', Mandatory=$true, ValueFromPipelineByPropertyName=$true)]
    [int]$id,
    
    # Unique asset tag of the asset
    [Parameter(ParameterSetName='Hardware')]
    [string]$asset_tag,
    
    # Asset notes
    [Parameter(ParameterSetName='Hardware')]
    [string]$notes,
    
    # The id of the corresponding status label
    [Parameter(ParameterSetName='Hardware')]
    [int]$status_id,
    
    # The id of the associated asset model id
    [Parameter(ParameterSetName='Hardware')]
    [int]$model_id,
    
    # Date the asset was last checked out
    [Parameter(ParameterSetName='Hardware')]
    [string]$last_checkout,
    
    # The id of the user the asset is currently checked out to
    [Parameter(ParameterSetName='Hardware')]
    [int]$assigned_to,
    
    # The id of an associated company id
    [Parameter(ParameterSetName='Hardware')]
    [int]$company_id,
    
    # Serial number of the asset
    [Parameter(ParameterSetName='Hardware')]
    [string]$serial,
    
    # Order number for the asset
    [Parameter(ParameterSetName='Hardware')]
    [string]$order_number,
    
    # Number of months for the asset warranty
    [Parameter(ParameterSetName='Hardware')]
    [int]$warranty_months,
    
    # Purchase cost of the asset, without a currency symbol
    [Parameter(ParameterSetName='Hardware')]
    [float]$purchase_cost,
    
    # Date of asset purchase
    [Parameter(ParameterSetName='Hardware')]
    [string]$purchase_date,
    
    # Whether or not the asset can be requested by users with the permission to request assets
    [Parameter(ParameterSetName='Hardware')]
    [boolean]$requestable,
    
    # Whether or not the asset is archived. Archived assets cannot be checked out and do not show up in the deployable asset screens
    [Parameter(ParameterSetName='Hardware')]
    [boolean]$archived,
    
    # The id that corresponds to the location where the asset is usually located when not checked out
    [Parameter(ParameterSetName='Hardware')]
    [int]$rtd_location_id,
    
    # Asset name
    [Parameter(ParameterSetName='Hardware')]
    [string]$name,
    
    # Hastable of custom fields and extra fields that need passing through to Snipeit
    [Parameter(ParameterSetName='Hardware')]
    [hashtable]$customfields,
    
    # URL of the SnipeItApp
    [Parameter(Mandatory=$True)]
    [string]$Url,
    
    # API Key to use for access
    [Parameter(Mandatory=$True)]
    [string]$ApiKey
    )
    
Write-Debug -Message ( "Function {0}, ParameterSetName is {1}" -f $PSCmdlet.MyInvocation.MyCommand, $PsCmdlet.ParameterSetName)

#region    ParameterSet: Hardware, parameters in body: 16, in query: 0

    if ($PsCmdlet.ParameterSetName -eq "Hardware") {
        $optionalParameters = . Get-ParameterValue -DefaultExcludeParameter @('id', 'url', 'apiKey', 'Debug', 'Verbose', 'customfields')
        if ($PSBoundParameters.ContainsKey("customfields")) { 
            $optionalParameters += $customfields
            }

        $Parameters = @{
            Uri = "$url/api/v1/hardware/$id"
            Method = "patch"
            Body = $optionalParameters | ConvertTo-Json
            Token = $apiKey
            }

        Invoke-SnipeItMethod @Parameters
        }
#endregion


} # End of Set-SnipeItAsset

