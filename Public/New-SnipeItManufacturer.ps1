function New-SnipeItManufacturer {
<#
.SYNOPSIS
 Create a manufacturer

.DESCRIPTION
 Manufacturers: Create a manufacturer

.LINK
 https://snipe-it.readme.io/reference#manufacturers-1

#>
[CmdletBinding(DefaultParameterSetName="Manufacturers")]
param (
    <# ParameterSet Manufacturers #>
    
    # Manufacturer name
    [Parameter(ParameterSetName='Manufacturers', Mandatory=$true)]
    [string]$name,
    
    # URL of the SnipeItApp
    [Parameter(Mandatory=$True)]
    [string]$Url,
    
    # API Key to use for access
    [Parameter(Mandatory=$True)]
    [string]$ApiKey
    )
    
Write-Debug -Message ( "Function {0}, ParameterSetName is {1}" -f $PSCmdlet.MyInvocation.MyCommand, $PsCmdlet.ParameterSetName)

#region    ParameterSet: Manufacturers, parameters in body: 1, in query: 0

    if ($PsCmdlet.ParameterSetName -eq "Manufacturers") {
        $optionalParameters = . Get-ParameterValue
        $Parameters = @{
            Uri = "$url/api/v1/manufacturers"
            Method = "post"
            Body = $optionalParameters | ConvertTo-Json
            Token = $apiKey
            }

        Invoke-SnipeItMethod @Parameters
        }
#endregion


} # End of New-SnipeItManufacturer

