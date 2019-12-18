function New-SnipeItModel {
<#
.SYNOPSIS
 Create a model

.DESCRIPTION
 Models: Create a model

.LINK
 https://snipe-it.readme.io/reference#models-1

#>
[CmdletBinding(DefaultParameterSetName="Models")]
param (
    <# ParameterSet Models #>
    
    # Model name
    [Parameter(ParameterSetName='Models', Mandatory=$true)]
    [string]$name,
    
    # Part or model number of the model
    [Parameter(ParameterSetName='Models')]
    [string]$model_number,
    
    [Parameter(ParameterSetName='Models', Mandatory=$true)]
    [int]$category_id,
    
    [Parameter(ParameterSetName='Models', Mandatory=$true)]
    [int]$manufacturer_id,
    
    # Number of months until this model's assets are considered EOL
    [Parameter(ParameterSetName='Models')]
    [int]$eol,
    
    # The ID of an EXISTING custom fieldset
    [Parameter(ParameterSetName='Models')]
    [int]$fieldset_id,
    
    # URL of the SnipeItApp
    [Parameter(Mandatory=$True)]
    [string]$Url,
    
    # API Key to use for access
    [Parameter(Mandatory=$True)]
    [string]$ApiKey
    )
    
Write-Debug -Message ( "Function {0}, ParameterSetName is {1}" -f $PSCmdlet.MyInvocation.MyCommand, $PsCmdlet.ParameterSetName)

#region    ParameterSet: Models, parameters in body: 6, in query: 0

    if ($PsCmdlet.ParameterSetName -eq "Models") {
        $optionalParameters = . Get-ParameterValue
        $Parameters = @{
            Uri = "$url/api/v1/models"
            Method = "post"
            Body = $optionalParameters | ConvertTo-Json
            Token = $apiKey
            }

        Invoke-SnipeItMethod @Parameters
        }
#endregion


} # End of New-SnipeItModel

