function New-SnipeItFieldset {
<#
.SYNOPSIS
 Create a Fieldset

.DESCRIPTION
 Fieldsets: Create a Fieldset

.LINK
 https://snipe-it.readme.io/reference#fieldsets

#>
[CmdletBinding(DefaultParameterSetName="Fieldsets")]
param (
    <# ParameterSet Fieldsets #>
    
    # Fieldset name
    [Parameter(ParameterSetName='Fieldsets', Mandatory=$true)]
    [string]$name,
    
    # URL of the SnipeItApp
    [Parameter(Mandatory=$True)]
    [string]$Url,
    
    # API Key to use for access
    [Parameter(Mandatory=$True)]
    [string]$ApiKey
    )
    
Write-Debug -Message ( "Function {0}, ParameterSetName is {1}" -f $PSCmdlet.MyInvocation.MyCommand, $PsCmdlet.ParameterSetName)

#region    ParameterSet: Fieldsets, parameters in body: 1, in query: 0

    if ($PsCmdlet.ParameterSetName -eq "Fieldsets") {
        $optionalParameters = . Get-ParameterValue
        $Parameters = @{
            Uri = "$url/api/v1/fieldsets"
            Method = "post"
            Body = $optionalParameters | ConvertTo-Json
            Token = $apiKey
            }

        Invoke-SnipeItMethod @Parameters
        }
#endregion


} # End of New-SnipeItFieldset

