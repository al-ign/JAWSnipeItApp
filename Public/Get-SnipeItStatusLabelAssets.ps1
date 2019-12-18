function Get-SnipeItStatusLabelAssets {
<#
.SYNOPSIS
 View assets with a specific status label

.DESCRIPTION
 StatuslabelsAssetlist: View assets with a specific status label

.LINK
 https://snipe-it.readme.io/reference#statuslabelsidassetlist

#>
[CmdletBinding(DefaultParameterSetName="StatuslabelsAssetlist")]
param (
    <# ParameterSet StatuslabelsAssetlist #>
    
    [Parameter(ParameterSetName='StatuslabelsAssetlist', Mandatory=$true, ValueFromPipelineByPropertyName=$true)]
    [int]$id,
    
    # URL of the SnipeItApp
    [Parameter(Mandatory=$True)]
    [string]$Url,
    
    # API Key to use for access
    [Parameter(Mandatory=$True)]
    [string]$ApiKey
    )
    
Write-Debug -Message ( "Function {0}, ParameterSetName is {1}" -f $PSCmdlet.MyInvocation.MyCommand, $PsCmdlet.ParameterSetName)

#region    ParameterSet: StatuslabelsAssetlist, parameters in body: 0, in query: 0

    if ($PsCmdlet.ParameterSetName -eq "StatuslabelsAssetlist") {
        $Parameters = @{
            Uri = "$url/api/v1/statuslabels/$id/assetlist"
            Method = "get"
            Token = $apiKey
            }

        Invoke-SnipeItMethod @Parameters
        }
#endregion


} # End of Get-SnipeItStatusLabelAssets

