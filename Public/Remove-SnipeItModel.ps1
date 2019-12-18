function Remove-SnipeItModel {
<#
.SYNOPSIS
 Delete a model

.DESCRIPTION
 Models: Delete a model

.LINK
 https://snipe-it.readme.io/reference#modelsid-3

#>
[CmdletBinding(DefaultParameterSetName="Models")]
param (
    <# ParameterSet Models #>
    
    # company id
    [Parameter(ParameterSetName='Models', Mandatory=$true, ValueFromPipelineByPropertyName=$true)]
    [int]$id,
    
    # URL of the SnipeItApp
    [Parameter(Mandatory=$True)]
    [string]$Url,
    
    # API Key to use for access
    [Parameter(Mandatory=$True)]
    [string]$ApiKey
    )
    
Write-Debug -Message ( "Function {0}, ParameterSetName is {1}" -f $PSCmdlet.MyInvocation.MyCommand, $PsCmdlet.ParameterSetName)

#region    ParameterSet: Models, parameters in body: 0, in query: 0

    if ($PsCmdlet.ParameterSetName -eq "Models") {
        $Parameters = @{
            Uri = "$url/api/v1/models/$id"
            Method = "delete"
            Token = $apiKey
            }

        Invoke-SnipeItMethod @Parameters
        }
#endregion


} # End of Remove-SnipeItModel

