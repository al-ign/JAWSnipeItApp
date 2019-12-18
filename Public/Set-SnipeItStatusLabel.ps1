function Set-SnipeItStatusLabel {
<#
.SYNOPSIS
 Edit a status label

.DESCRIPTION
 Statuslabels: Edit a status label

.LINK
 https://snipe-it.readme.io/reference#statuslabels-3

#>
[CmdletBinding(DefaultParameterSetName="Statuslabels")]
param (
    <# ParameterSet Statuslabels #>
    
    [Parameter(ParameterSetName='Statuslabels', Mandatory=$true)]
    [string]$name,
    
    [Parameter(ParameterSetName='Statuslabels', Mandatory=$true)]
    [boolean]$deployable,
    
    [Parameter(ParameterSetName='Statuslabels', Mandatory=$true)]
    [boolean]$pending,
    
    [Parameter(ParameterSetName='Statuslabels', Mandatory=$true)]
    [boolean]$archived,
    
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

#region    ParameterSet: Statuslabels, parameters in body: 4, in query: 0

    if ($PsCmdlet.ParameterSetName -eq "Statuslabels") {
        $optionalParameters = . Get-ParameterValue -DefaultExcludeParameter @('id', 'url', 'apiKey', 'Debug', 'Verbose', 'customfields')
        if ($PSBoundParameters.ContainsKey("customfields")) { 
            $optionalParameters += $customfields
            }

        $Parameters = @{
            Uri = "$url/api/v1/statuslabels/$id"
            Method = "patch"
            Body = $optionalParameters | ConvertTo-Json
            Token = $apiKey
            }

        Invoke-SnipeItMethod @Parameters
        }
#endregion


} # End of Set-SnipeItStatusLabel

