function Remove-SnipeItStatusLabel {
<#
.SYNOPSIS
 Delete a status label

.DESCRIPTION
 Statuslabels: Delete a status label

.LINK
 https://snipe-it.readme.io/reference#statuslabelsid-1

#>
[CmdletBinding(DefaultParameterSetName="Statuslabels")]
param (
    <# ParameterSet Statuslabels #>
    
    [Parameter(ParameterSetName='Statuslabels', Mandatory=$true, ValueFromPipelineByPropertyName=$true)]
    [int]$id,
    
    # URL of the SnipeItApp
    [Parameter(Mandatory=$True)]
    [string]$Url,
    
    # API Key to use for access
    [Parameter(Mandatory=$True)]
    [string]$ApiKey
    )
    
Write-Debug -Message ( "Function {0}, ParameterSetName is {1}" -f $PSCmdlet.MyInvocation.MyCommand, $PsCmdlet.ParameterSetName)

#region    ParameterSet: Statuslabels, parameters in body: 0, in query: 0

    if ($PsCmdlet.ParameterSetName -eq "Statuslabels") {
        $Parameters = @{
            Uri = "$url/api/v1/statuslabels/$id"
            Method = "delete"
            Token = $apiKey
            }

        Invoke-SnipeItMethod @Parameters
        }
#endregion


} # End of Remove-SnipeItStatusLabel

