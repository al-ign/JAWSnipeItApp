function Get-SnipeItModel {
<#
.SYNOPSIS
 Returns a list of models

.DESCRIPTION
 Models: Returns a list of models

 ModelsById: Retrieve the specific details of a model by id

.LINK
 https://snipe-it.readme.io/reference#models

.LINK
 https://snipe-it.readme.io/reference#modelsid

#>
[CmdletBinding(DefaultParameterSetName="Models")]
param (
    <# ParameterSet Models #>
    
    [Parameter(ParameterSetName='Models')]
    [switch]$Models,
    
    # Number of records to return
    [Parameter(ParameterSetName='Models')]
    [int]$limit,
    
    # Offset to use when retrieving results (useful in pagination)
    [Parameter(ParameterSetName='Models')]
    [int]$offset,
    
    # Search string
    [Parameter(ParameterSetName='Models')]
    [string]$search,
    
    # Field to order by
    [Parameter(ParameterSetName='Models')]
    [string]$sort,
    
    # Sort order (asc or desc)
    [Parameter(ParameterSetName='Models')]
    [ValidateSet($null, "asc", "desc")]
    [string]$order,
    
    <# ParameterSet ModelsById #>
    
    # company id
    [Parameter(ParameterSetName='ModelsById', Mandatory=$true, ValueFromPipelineByPropertyName=$true)]
    [int]$id,
    
    # URL of the SnipeItApp
    [Parameter(Mandatory=$True)]
    [string]$Url,
    
    # API Key to use for access
    [Parameter(Mandatory=$True)]
    [string]$ApiKey
    )
    
Write-Debug -Message ( "Function {0}, ParameterSetName is {1}" -f $PSCmdlet.MyInvocation.MyCommand, $PsCmdlet.ParameterSetName)

#region    ParameterSet: Models, parameters in body: 0, in query: 5

    if ($PsCmdlet.ParameterSetName -eq "Models") {
        $optionalParameters = . Get-ParameterValue
        $Parameters = @{
            Uri = "$url/api/v1/models"
            Method = "get"
            UriQuery = $optionalParameters
            Token = $apiKey
            }

        Invoke-SnipeItMethod @Parameters
        }
#endregion

#region    ParameterSet: ModelsById, parameters in body: 0, in query: 0

    if ($PsCmdlet.ParameterSetName -eq "ModelsById") {
        $Parameters = @{
            Uri = "$url/api/v1/models/$id"
            Method = "get"
            Token = $apiKey
            }

        Invoke-SnipeItMethod @Parameters
        }
#endregion


} # End of Get-SnipeItModel

