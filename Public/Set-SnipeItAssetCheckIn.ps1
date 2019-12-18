function Set-SnipeItAssetCheckIn {
<#
.SYNOPSIS
 Checkin an asset

.DESCRIPTION
 HardwareCheckin: Checkin an asset

.LINK
 https://snipe-it.readme.io/reference#hardwareidcheckin

#>
[CmdletBinding(DefaultParameterSetName="HardwareCheckin")]
param (
    <# ParameterSet HardwareCheckin #>
    
    # The id (not the asset tag) of the asset you'd like to query
    [Parameter(ParameterSetName='HardwareCheckin', Mandatory=$true, ValueFromPipelineByPropertyName=$true)]
    [int]$id,
    
    # Note about the checkin
    [Parameter(ParameterSetName='HardwareCheckin')]
    [string]$note,
    
    # Updated Location for this item.
    [Parameter(ParameterSetName='HardwareCheckin')]
    [string]$location_id,
    
    # URL of the SnipeItApp
    [Parameter(Mandatory=$True)]
    [string]$Url,
    
    # API Key to use for access
    [Parameter(Mandatory=$True)]
    [string]$ApiKey
    )
    
Write-Debug -Message ( "Function {0}, ParameterSetName is {1}" -f $PSCmdlet.MyInvocation.MyCommand, $PsCmdlet.ParameterSetName)

#region    ParameterSet: HardwareCheckin, parameters in body: 2, in query: 0

    if ($PsCmdlet.ParameterSetName -eq "HardwareCheckin") {
        $optionalParameters = . Get-ParameterValue -DefaultExcludeParameter @('id', 'url', 'apiKey', 'Debug', 'Verbose', 'customfields')
        if ($PSBoundParameters.ContainsKey("customfields")) { 
            $optionalParameters += $customfields
            }

        $Parameters = @{
            Uri = "$url/api/v1/hardware/$id/checkin"
            Method = "post"
            Body = $optionalParameters | ConvertTo-Json
            Token = $apiKey
            }

        Invoke-SnipeItMethod @Parameters
        }
#endregion


} # End of Set-SnipeItAssetCheckIn

