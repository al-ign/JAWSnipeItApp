function Set-SnipeItAssetAudit {
<#
.SYNOPSIS
 Mark an asset as audited

.DESCRIPTION
 HardwareAudit: Mark an asset as audited

.LINK
 https://snipe-it.readme.io/reference#hardwareaudit

#>
[CmdletBinding(DefaultParameterSetName="HardwareAudit")]
param (
    <# ParameterSet HardwareAudit #>
    
    # The asset tag of the asset you wish to audit
    [Parameter(ParameterSetName='HardwareAudit', Mandatory=$true)]
    [string]$asset_tag,
    
    # ID of the location you want to associate with the audit
    [Parameter(ParameterSetName='HardwareAudit')]
    [int]$location_id,
    
    # URL of the SnipeItApp
    [Parameter(Mandatory=$True)]
    [string]$Url,
    
    # API Key to use for access
    [Parameter(Mandatory=$True)]
    [string]$ApiKey
    )
    
Write-Debug -Message ( "Function {0}, ParameterSetName is {1}" -f $PSCmdlet.MyInvocation.MyCommand, $PsCmdlet.ParameterSetName)

#region    ParameterSet: HardwareAudit, parameters in body: 2, in query: 0

    if ($PsCmdlet.ParameterSetName -eq "HardwareAudit") {
        $optionalParameters = . Get-ParameterValue
        $Parameters = @{
            Uri = "$url/api/v1/hardware/audit"
            Method = "post"
            Body = $optionalParameters | ConvertTo-Json
            Token = $apiKey
            }

        Invoke-SnipeItMethod @Parameters
        }
#endregion


} # End of Set-SnipeItAssetAudit

