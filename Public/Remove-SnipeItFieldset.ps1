function Remove-SnipeItFieldset {
<#
.SYNOPSIS
 Delete a Fieldset

.DESCRIPTION
 Fieldsets: Delete a Fieldset

.LINK
 https://snipe-it.readme.io/reference#fieldsetsid-2

#>
[CmdletBinding(DefaultParameterSetName="Fieldsets")]
param (
    <# ParameterSet Fieldsets #>
    
    # Custom field ID
    [Parameter(ParameterSetName='Fieldsets', Mandatory=$true, ValueFromPipelineByPropertyName=$true)]
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
            Uri = "$url/api/v1/fieldsets/$id"
            Method = "delete"
            Token = $apiKey
            }

        Invoke-SnipeItMethod @Parameters
        }
#endregion


} # End of Remove-SnipeItFieldset

