function Get-SnipeItField {
<#
.SYNOPSIS
 Return all custom fields

.DESCRIPTION
 Fields: Return all custom fields

 FieldsById: Get the specific custom field

#>
[CmdletBinding(DefaultParameterSetName="Fields")]
param (
    <# ParameterSet Fields #>
    
    [Parameter(ParameterSetName='Fields')]
    [switch]$Fields,
    
    <# ParameterSet FieldsById #>
    
    # The id of the custom field
    [Parameter(ParameterSetName='FieldsById', Mandatory=$true, ValueFromPipelineByPropertyName=$true)]
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
            Uri = "$url/api/v1/fields"
            Method = "get"
            Token = $apiKey
            }

        Invoke-SnipeItMethod @Parameters
        }
#endregion

#region    ParameterSet: FieldsById, parameters in body: 0, in query: 0

    if ($PsCmdlet.ParameterSetName -eq "FieldsById") {
        $Parameters = @{
            Uri = "$url/api/v1/fields/$id"
            Method = "get"
            Token = $apiKey
            }

        Invoke-SnipeItMethod @Parameters
        }
#endregion


} # End of Get-SnipeItField

