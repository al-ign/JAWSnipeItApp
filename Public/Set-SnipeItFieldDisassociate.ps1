function Set-SnipeItFieldDisassociate {
<#
.SYNOPSIS
 Deassociate a custom field from the customfields list

.DESCRIPTION
 FieldsDisassociate: Deassociate a custom field from the customfields list

#>
[CmdletBinding(DefaultParameterSetName="FieldsDisassociate")]
param (
    <# ParameterSet FieldsDisassociate #>
    
    # The id of the custom field
    [Parameter(ParameterSetName='FieldsDisassociate', Mandatory=$true, ValueFromPipelineByPropertyName=$true)]
    [int]$id,
    
    # The id of the custom fieldset
    [Parameter(ParameterSetName='FieldsDisassociate', Mandatory=$true)]
    [int]$fieldset_id,
    
    # URL of the SnipeItApp
    [Parameter(Mandatory=$True)]
    [string]$Url,
    
    # API Key to use for access
    [Parameter(Mandatory=$True)]
    [string]$ApiKey
    )
    
Write-Debug -Message ( "Function {0}, ParameterSetName is {1}" -f $PSCmdlet.MyInvocation.MyCommand, $PsCmdlet.ParameterSetName)

#region    ParameterSet: FieldsDisassociate, parameters in body: 1, in query: 0

    if ($PsCmdlet.ParameterSetName -eq "FieldsDisassociate") {
        $optionalParameters = . Get-ParameterValue -DefaultExcludeParameter @('id', 'url', 'apiKey', 'Debug', 'Verbose', 'customfields')
        if ($PSBoundParameters.ContainsKey("customfields")) { 
            $optionalParameters += $customfields
            }

        $Parameters = @{
            Uri = "$url/api/v1/fields/$id/disassociate"
            Method = "post"
            Body = $optionalParameters | ConvertTo-Json
            Token = $apiKey
            }

        Invoke-SnipeItMethod @Parameters
        }
#endregion


} # End of Set-SnipeItFieldDisassociate

