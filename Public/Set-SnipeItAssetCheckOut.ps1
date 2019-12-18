function Set-SnipeItAssetCheckOut {
<#
.SYNOPSIS
 Checkout an asset

.DESCRIPTION
 HardwareCheckout: Checkout an asset

.LINK
 https://snipe-it.readme.io/reference#hardwareidcheckout

#>
[CmdletBinding(DefaultParameterSetName="HardwareCheckout")]
param (
    <# ParameterSet HardwareCheckout #>
    
    # The id (not the asset tag) of the asset you'd like to query
    [Parameter(ParameterSetName='HardwareCheckout', Mandatory=$true, ValueFromPipelineByPropertyName=$true)]
    [int]$id,
    
    # The ID of the user to check the asset out to.
    [Parameter(ParameterSetName='HardwareCheckout')]
    [int]$assigned_user,
    
    # The asset ID to associate the asset to
    [Parameter(ParameterSetName='HardwareCheckout')]
    [int]$assigned_asset,
    
    # The location ID to check the asset out to
    [Parameter(ParameterSetName='HardwareCheckout')]
    [int]$assigned_location,
    
    # Optional date the asset is expected to be checked in
    [Parameter(ParameterSetName='HardwareCheckout')]
    [string]$expected_checkin,
    
    # Optional date to override the checkout time of now
    [Parameter(ParameterSetName='HardwareCheckout')]
    [string]$checkout_at,
    
    # Optional new asset name. This is useful for changing the asset's name on new checkout, for example, an asset that was named "Anna's Macbook Pro" could be renamed on the fly when it's checked out to Elizabeth, to "Beth's Macbook Pro"
    [Parameter(ParameterSetName='HardwareCheckout')]
    [string]$name,
    
    # Optional note about the checkout
    [Parameter(ParameterSetName='HardwareCheckout')]
    [string]$note,
    
    # Type of entity the asset is being checked out to: user, asset, or location
    [Parameter(ParameterSetName='HardwareCheckout', Mandatory=$true)]
    [string]$checkout_to_type,
    
    # URL of the SnipeItApp
    [Parameter(Mandatory=$True)]
    [string]$Url,
    
    # API Key to use for access
    [Parameter(Mandatory=$True)]
    [string]$ApiKey
    )
    
Write-Debug -Message ( "Function {0}, ParameterSetName is {1}" -f $PSCmdlet.MyInvocation.MyCommand, $PsCmdlet.ParameterSetName)

#region    ParameterSet: HardwareCheckout, parameters in body: 8, in query: 0

    if ($PsCmdlet.ParameterSetName -eq "HardwareCheckout") {
        $optionalParameters = . Get-ParameterValue -DefaultExcludeParameter @('id', 'url', 'apiKey', 'Debug', 'Verbose', 'customfields')
        if ($PSBoundParameters.ContainsKey("customfields")) { 
            $optionalParameters += $customfields
            }

        $Parameters = @{
            Uri = "$url/api/v1/hardware/$id/checkout"
            Method = "post"
            Body = $optionalParameters | ConvertTo-Json
            Token = $apiKey
            }

        Invoke-SnipeItMethod @Parameters
        }
#endregion


} # End of Set-SnipeItAssetCheckOut

