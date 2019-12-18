function New-SnipeItField {
<#
.SYNOPSIS
 Create new custom field

.DESCRIPTION
 Fields: Create new custom field

#>
[CmdletBinding(DefaultParameterSetName="Fields")]
param (
    <# ParameterSet Fields #>
    
    # name of the custom field
    [Parameter(ParameterSetName='Fields', Mandatory=$true)]
    [string]$name,
    
    # element type - text or listbox
    [Parameter(ParameterSetName='Fields', Mandatory=$true)]
    [string]$element,
    
    # format type: ANY, CUSTOM, ALPHA, ALPHA, NUMERIC, ALPHA, EMAIL, DATE, URL, IP, IPV4, IPV6, MAC, BOOLEAN
    [Parameter(ParameterSetName='Fields', Mandatory=$true)]
    [string]$format,
    
    # URL of the SnipeItApp
    [Parameter(Mandatory=$True)]
    [string]$Url,
    
    # API Key to use for access
    [Parameter(Mandatory=$True)]
    [string]$ApiKey
    )
    
Write-Debug -Message ( "Function {0}, ParameterSetName is {1}" -f $PSCmdlet.MyInvocation.MyCommand, $PsCmdlet.ParameterSetName)

#region    ParameterSet: Fields, parameters in body: 3, in query: 0

    if ($PsCmdlet.ParameterSetName -eq "Fields") {
        $optionalParameters = . Get-ParameterValue
        $Parameters = @{
            Uri = "$url/api/v1/fields"
            Method = "post"
            Body = $optionalParameters | ConvertTo-Json
            Token = $apiKey
            }

        Invoke-SnipeItMethod @Parameters
        }
#endregion


} # End of New-SnipeItField

