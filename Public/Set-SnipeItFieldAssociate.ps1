function Set-SnipeItFieldAssociate {
<#
.SYNOPSIS
 Associate a custom field to the customfields list

.DESCRIPTION
 FieldsAssociate: Associate a custom field to the customfields list

#>
[CmdletBinding(DefaultParameterSetName="FieldsAssociate")]
param (
    <# ParameterSet FieldsAssociate #>
    
    # The id of the custom field
    [Parameter(ParameterSetName='FieldsAssociate', Mandatory=$true, ValueFromPipelineByPropertyName=$true)]
    [int]$id,
    
    # The id of the custom fieldset
    [Parameter(ParameterSetName='FieldsAssociate', Mandatory=$true)]
    [int]$fieldset_id,
    
    # URL of the SnipeItApp
    [Parameter(Mandatory=$True)]
    [string]$Url,
    
    # API Key to use for access
    [Parameter(Mandatory=$True)]
    [string]$ApiKey
    )
    
Write-Debug -Message ( "Function {0}, ParameterSetName is {1}" -f $PSCmdlet.MyInvocation.MyCommand, $PsCmdlet.ParameterSetName)

#region    ParameterSet: FieldsAssociate, parameters in body: 1, in query: 0

    if ($PsCmdlet.ParameterSetName -eq "FieldsAssociate") {
        $optionalParameters = . Get-ParameterValue -DefaultExcludeParameter @('id', 'url', 'apiKey', 'Debug', 'Verbose', 'customfields')
        if ($PSBoundParameters.ContainsKey("customfields")) { 
            $optionalParameters += $customfields
            }

        $Parameters = @{
            Uri = "$url/api/v1/fields/$id/associate"
            Method = "post"
            Body = $optionalParameters | ConvertTo-Json
            Token = $apiKey
            }

        Invoke-SnipeItMethod @Parameters
        }
#endregion


} # End of Set-SnipeItFieldAssociate

