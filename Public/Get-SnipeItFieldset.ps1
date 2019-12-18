function Get-SnipeItFieldset {
<#
.SYNOPSIS
 List all custom fieldsets

.DESCRIPTION
 Fieldsets: List all custom fieldsets

 FieldsetsById: Return fieldset info by id

.LINK
 https://snipe-it.readme.io/reference#fields

.LINK
 https://snipe-it.readme.io/reference#fieldsetsid

#>
[CmdletBinding(DefaultParameterSetName="Fieldsets")]
param (
    <# ParameterSet Fieldsets #>
    
    [Parameter(ParameterSetName='Fieldsets')]
    [switch]$Fieldsets,
    
    <# ParameterSet FieldsetsById #>
    
    [Parameter(ParameterSetName='FieldsetsById', Mandatory=$true, ValueFromPipelineByPropertyName=$true)]
    [int]$id,
    
    # URL of the SnipeItApp
    [Parameter(Mandatory=$True)]
    [string]$Url,
    
    # API Key to use for access
    [Parameter(Mandatory=$True)]
    [string]$ApiKey
    )
    
Write-Debug -Message ( "Function {0}, ParameterSetName is {1}" -f $PSCmdlet.MyInvocation.MyCommand, $PsCmdlet.ParameterSetName)

#region    ParameterSet: Fieldsets, parameters in body: 0, in query: 0

    if ($PsCmdlet.ParameterSetName -eq "Fieldsets") {
        $Parameters = @{
            Uri = "$url/api/v1/fieldsets"
            Method = "get"
            Token = $apiKey
            }

        Invoke-SnipeItMethod @Parameters
        }
#endregion

#region    ParameterSet: FieldsetsById, parameters in body: 0, in query: 0

    if ($PsCmdlet.ParameterSetName -eq "FieldsetsById") {
        $Parameters = @{
            Uri = "$url/api/v1/fieldsets/$id"
            Method = "get"
            Token = $apiKey
            }

        Invoke-SnipeItMethod @Parameters
        }
#endregion


} # End of Get-SnipeItFieldset

