function New-SnipeItStatusLabel {
<#
.SYNOPSIS
 Create a new status label

.DESCRIPTION
 Statuslabels: Create a new status label

.LINK
 https://snipe-it.readme.io/reference#statuslabels-1

#>
[CmdletBinding(DefaultParameterSetName="Statuslabels")]
param (
    <# ParameterSet Statuslabels #>
    
    [Parameter(ParameterSetName='Statuslabels', Mandatory=$true)]
    [string]$name,
    
    # `deployable` | `pending` | `archived`
    [Parameter(ParameterSetName='Statuslabels')]
    [string]$type,
    
    # URL of the SnipeItApp
    [Parameter(Mandatory=$True)]
    [string]$Url,
    
    # API Key to use for access
    [Parameter(Mandatory=$True)]
    [string]$ApiKey
    )
    
Write-Debug -Message ( "Function {0}, ParameterSetName is {1}" -f $PSCmdlet.MyInvocation.MyCommand, $PsCmdlet.ParameterSetName)

#region    ParameterSet: Statuslabels, parameters in body: 2, in query: 0

    if ($PsCmdlet.ParameterSetName -eq "Statuslabels") {
        $optionalParameters = . Get-ParameterValue
        $Parameters = @{
            Uri = "$url/api/v1/statuslabels"
            Method = "post"
            Body = $optionalParameters | ConvertTo-Json
            Token = $apiKey
            }

        Invoke-SnipeItMethod @Parameters
        }
#endregion


} # End of New-SnipeItStatusLabel

