function Get-SnipeItStatusLabel {
<#
.SYNOPSIS
 Retrieve a list of status labels

.DESCRIPTION
 Statuslabels: Retrieve a list of status labels

 StatuslabelsById: View a status label

.LINK
 https://snipe-it.readme.io/reference#statuslabels

.LINK
 https://snipe-it.readme.io/reference#statuslabelsid

#>
[CmdletBinding(DefaultParameterSetName="Statuslabels")]
param (
    <# ParameterSet Statuslabels #>
    
    [Parameter(ParameterSetName='Statuslabels')]
    [switch]$Statuslabels,
    
    # Number of records to return
    [Parameter(ParameterSetName='Statuslabels')]
    [int]$limit,
    
    # Offset to use when retrieving results (useful in pagination)
    [Parameter(ParameterSetName='Statuslabels')]
    [int]$offset,
    
    # String to search on
    [Parameter(ParameterSetName='Statuslabels')]
    [string]$search,
    
    # Field to order by
    [Parameter(ParameterSetName='Statuslabels')]
    [string]$sort,
    
    # Sort order (asc or desc)
    [Parameter(ParameterSetName='Statuslabels')]
    [ValidateSet($null, "asc", "desc")]
    [string]$order,
    
    <# ParameterSet StatuslabelsById #>
    
    [Parameter(ParameterSetName='StatuslabelsById', Mandatory=$true, ValueFromPipelineByPropertyName=$true)]
    [int]$id,
    
    # URL of the SnipeItApp
    [Parameter(Mandatory=$True)]
    [string]$Url,
    
    # API Key to use for access
    [Parameter(Mandatory=$True)]
    [string]$ApiKey
    )
    
Write-Debug -Message ( "Function {0}, ParameterSetName is {1}" -f $PSCmdlet.MyInvocation.MyCommand, $PsCmdlet.ParameterSetName)

#region    ParameterSet: Statuslabels, parameters in body: 0, in query: 5

    if ($PsCmdlet.ParameterSetName -eq "Statuslabels") {
        $optionalParameters = . Get-ParameterValue
        $Parameters = @{
            Uri = "$url/api/v1/statuslabels"
            Method = "get"
            UriQuery = $optionalParameters
            Token = $apiKey
            }

        Invoke-SnipeItMethod @Parameters
        }
#endregion

#region    ParameterSet: StatuslabelsById, parameters in body: 0, in query: 0

    if ($PsCmdlet.ParameterSetName -eq "StatuslabelsById") {
        $Parameters = @{
            Uri = "$url/api/v1/statuslabels/$id"
            Method = "get"
            Token = $apiKey
            }

        Invoke-SnipeItMethod @Parameters
        }
#endregion


} # End of Get-SnipeItStatusLabel

