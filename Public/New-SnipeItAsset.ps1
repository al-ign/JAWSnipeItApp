function New-SnipeItAsset {
<#
.SYNOPSIS
 Creates a new asset

.DESCRIPTION
 Hardware: Creates a new asset

.LINK
 https://snipe-it.readme.io/reference#hardware-create

#>
[CmdletBinding(DefaultParameterSetName="Hardware")]
param (
    <# ParameterSet Hardware #>
    
    # The asset tag of the asset. If auto-incrementing is enabled in the settings, this is not required and will be generated.
    [Parameter(ParameterSetName='Hardware')]
    [string]$asset_tag,
    
    # The id of the related status label
    [Parameter(ParameterSetName='Hardware')]
    [int]$status_id,
    
    # The id of the related asset model
    [Parameter(ParameterSetName='Hardware')]
    [int]$model_id,
    
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

#region    ParameterSet: Hardware, parameters in body: 4, in query: 0

    if ($PsCmdlet.ParameterSetName -eq "Hardware") {
        $optionalParameters = . Get-ParameterValue
        $Parameters = @{
            Uri = "$url/api/v1/hardware"
            Method = "post"
            Body = $optionalParameters | ConvertTo-Json
            Token = $apiKey
            }

        Invoke-SnipeItMethod @Parameters
        }
#endregion


} # End of New-SnipeItAsset

