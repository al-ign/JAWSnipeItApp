function New-SnipeItComponent {
<#
.SYNOPSIS
 Get the details on a component

.DESCRIPTION
 Components: Get the details on a component

.LINK
 https://snipe-it.readme.io/reference#components-1

#>
[CmdletBinding(DefaultParameterSetName="Components")]
param (
    <# ParameterSet Components #>
    
    [Parameter(ParameterSetName='Components', Mandatory=$true)]
    [string]$name,
    
    # URL of the SnipeItApp
    [Parameter(Mandatory=$True)]
    [string]$Url,
    
    # API Key to use for access
    [Parameter(Mandatory=$True)]
    [string]$ApiKey
    )
    
Write-Debug -Message ( "Function {0}, ParameterSetName is {1}" -f $PSCmdlet.MyInvocation.MyCommand, $PsCmdlet.ParameterSetName)

#region    ParameterSet: Components, parameters in body: 1, in query: 0

    if ($PsCmdlet.ParameterSetName -eq "Components") {
        $optionalParameters = . Get-ParameterValue
        $Parameters = @{
            Uri = "$url/api/v1/components"
            Method = "post"
            Body = $optionalParameters | ConvertTo-Json
            Token = $apiKey
            }

        Invoke-SnipeItMethod @Parameters
        }
#endregion


} # End of New-SnipeItComponent

