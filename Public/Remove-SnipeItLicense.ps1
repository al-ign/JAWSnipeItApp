function Remove-SnipeItLicense {
<#
.SYNOPSIS
 Sorry, no description was provided in the API reference

.DESCRIPTION
 Licenses: no description was provided in the API reference

.LINK
 https://snipe-it.readme.io/reference#licensesid-3

#>
[CmdletBinding(DefaultParameterSetName="Licenses")]
param (
    <# ParameterSet Licenses #>
    
    # ID (not name) of license to delete
    [Parameter(ParameterSetName='Licenses', Mandatory=$true, ValueFromPipelineByPropertyName=$true)]
    [int]$id,
    
    # URL of the SnipeItApp
    [Parameter(Mandatory=$True)]
    [string]$Url,
    
    # API Key to use for access
    [Parameter(Mandatory=$True)]
    [string]$ApiKey
    )
    
Write-Debug -Message ( "Function {0}, ParameterSetName is {1}" -f $PSCmdlet.MyInvocation.MyCommand, $PsCmdlet.ParameterSetName)

#region    ParameterSet: Licenses, parameters in body: 0, in query: 0

    if ($PsCmdlet.ParameterSetName -eq "Licenses") {
        $Parameters = @{
            Uri = "$url/api/v1/licenses/$id"
            Method = "delete"
            Token = $apiKey
            }

        Invoke-SnipeItMethod @Parameters
        }
#endregion


} # End of Remove-SnipeItLicense

