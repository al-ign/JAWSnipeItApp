function Set-SnipeItManufacturer {
<#
.SYNOPSIS
 Partially update a Manufacturer

.DESCRIPTION
 Manufacturers: Partially update a Manufacturer

.LINK
 https://snipe-it.readme.io/reference#manufacturersid

#>
[CmdletBinding(DefaultParameterSetName="Manufacturers")]
param (
    <# ParameterSet Manufacturers #>
    
    # Model name
    [Parameter(ParameterSetName='Manufacturers', Mandatory=$true)]
    [string]$name,
    
    # Manufacturer ID
    [Parameter(ParameterSetName='Manufacturers', Mandatory=$true, ValueFromPipelineByPropertyName=$true)]
    [int]$id,
    
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
        $optionalParameters = . Get-ParameterValue -DefaultExcludeParameter @('id', 'url', 'apiKey', 'Debug', 'Verbose', 'customfields')
        if ($PSBoundParameters.ContainsKey("customfields")) { 
            $optionalParameters += $customfields
            }

        $Parameters = @{
            Uri = "$url/api/v1/manufacturers/$id"
            Method = "patch"
            Body = $optionalParameters | ConvertTo-Json
            Token = $apiKey
            }

        Invoke-SnipeItMethod @Parameters
        }
#endregion


} # End of Set-SnipeItManufacturer

