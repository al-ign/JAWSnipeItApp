function Remove-SnipeItAsset {
<#
.SYNOPSIS
 Deletes a specific asset

.DESCRIPTION
 Hardware: Deletes a specific asset

.LINK
 https://snipe-it.readme.io/reference#hardware-delete

#>
[CmdletBinding(DefaultParameterSetName="Hardware")]
param (
    <# ParameterSet Hardware #>
    
    # The id of the asset to delete
    [Parameter(ParameterSetName='Hardware', Mandatory=$true, ValueFromPipelineByPropertyName=$true)]
    [int]$id,
    
    # URL of the SnipeItApp
    [Parameter(Mandatory=$True)]
    [string]$Url,
    
    # API Key to use for access
    [Parameter(Mandatory=$True)]
    [string]$ApiKey
    )
    
Write-Debug -Message ( "Function {0}, ParameterSetName is {1}" -f $PSCmdlet.MyInvocation.MyCommand, $PsCmdlet.ParameterSetName)

#region    ParameterSet: Hardware, parameters in body: 0, in query: 0

    if ($PsCmdlet.ParameterSetName -eq "Hardware") {
        $Parameters = @{
            Uri = "$url/api/v1/hardware/$id"
            Method = "delete"
            Token = $apiKey
            }

        Invoke-SnipeItMethod @Parameters
        }
#endregion


} # End of Remove-SnipeItAsset

