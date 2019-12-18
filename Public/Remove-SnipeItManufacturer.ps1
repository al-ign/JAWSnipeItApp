function Remove-SnipeItManufacturer {
<#
.SYNOPSIS
 Delete a manufacturer

.DESCRIPTION
 Manufacturers: Delete a manufacturer

.LINK
 https://snipe-it.readme.io/reference#manufacturersid-2

#>
[CmdletBinding(DefaultParameterSetName="Manufacturers")]
param (
    <# ParameterSet Manufacturers #>
    
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

#region    ParameterSet: Manufacturers, parameters in body: 0, in query: 0

    if ($PsCmdlet.ParameterSetName -eq "Manufacturers") {
        $Parameters = @{
            Uri = "$url/api/v1/manufacturers/$id"
            Method = "delete"
            Token = $apiKey
            }

        Invoke-SnipeItMethod @Parameters
        }
#endregion


} # End of Remove-SnipeItManufacturer

