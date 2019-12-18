function Remove-SnipeItField {
<#
.SYNOPSIS
 Remove the specific custom field

.DESCRIPTION
 Fields: Remove the specific custom field

#>
[CmdletBinding(DefaultParameterSetName="Fields")]
param (
    <# ParameterSet Fields #>
    
    # The id of the custom field
    [Parameter(ParameterSetName='Fields', Mandatory=$true, ValueFromPipelineByPropertyName=$true)]
    [int]$id,
    
    # URL of the SnipeItApp
    [Parameter(Mandatory=$True)]
    [string]$Url,
    
    # API Key to use for access
    [Parameter(Mandatory=$True)]
    [string]$ApiKey
    )
    
Write-Debug -Message ( "Function {0}, ParameterSetName is {1}" -f $PSCmdlet.MyInvocation.MyCommand, $PsCmdlet.ParameterSetName)

#region    ParameterSet: Fields, parameters in body: 0, in query: 0

    if ($PsCmdlet.ParameterSetName -eq "Fields") {
        $Parameters = @{
            Uri = "$url/api/v1/fields/$id"
            Method = "delete"
            Token = $apiKey
            }

        Invoke-SnipeItMethod @Parameters
        }
#endregion


} # End of Remove-SnipeItField

