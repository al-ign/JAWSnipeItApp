function New-SnipeItConsumable {
<#
.SYNOPSIS
 Create a new consumable

.DESCRIPTION
 Consumables: Create a new consumable

.LINK
 https://snipe-it.readme.io/reference#consumables-1

#>
[CmdletBinding(DefaultParameterSetName="Consumables")]
param (
    <# ParameterSet Consumables #>
    
    [Parameter(ParameterSetName='Consumables', Mandatory=$true)]
    [string]$name,
    
    # URL of the SnipeItApp
    [Parameter(Mandatory=$True)]
    [string]$Url,
    
    # API Key to use for access
    [Parameter(Mandatory=$True)]
    [string]$ApiKey
    )
    
Write-Debug -Message ( "Function {0}, ParameterSetName is {1}" -f $PSCmdlet.MyInvocation.MyCommand, $PsCmdlet.ParameterSetName)

#region    ParameterSet: Consumables, parameters in body: 1, in query: 0

    if ($PsCmdlet.ParameterSetName -eq "Consumables") {
        $optionalParameters = . Get-ParameterValue
        $Parameters = @{
            Uri = "$url/api/v1/consumables"
            Method = "post"
            Body = $optionalParameters | ConvertTo-Json
            Token = $apiKey
            }

        Invoke-SnipeItMethod @Parameters
        }
#endregion


} # End of New-SnipeItConsumable

