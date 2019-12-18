function Remove-SnipeItLocation {
<#
.SYNOPSIS
 Deletes a location

.DESCRIPTION
 Locations: Deletes a location

.LINK
 https://snipe-it.readme.io/reference#locationsid-2

#>
[CmdletBinding(DefaultParameterSetName="Locations")]
param (
    <# ParameterSet Locations #>
    
    [Parameter(ParameterSetName='Locations', Mandatory=$true, ValueFromPipelineByPropertyName=$true)]
    [int]$id,
    
    # URL of the SnipeItApp
    [Parameter(Mandatory=$True)]
    [string]$Url,
    
    # API Key to use for access
    [Parameter(Mandatory=$True)]
    [string]$ApiKey
    )
    
Write-Debug -Message ( "Function {0}, ParameterSetName is {1}" -f $PSCmdlet.MyInvocation.MyCommand, $PsCmdlet.ParameterSetName)

#region    ParameterSet: Locations, parameters in body: 0, in query: 0

    if ($PsCmdlet.ParameterSetName -eq "Locations") {
        $Parameters = @{
            Uri = "$url/api/v1/locations/$id"
            Method = "delete"
            Token = $apiKey
            }

        Invoke-SnipeItMethod @Parameters
        }
#endregion


} # End of Remove-SnipeItLocation

