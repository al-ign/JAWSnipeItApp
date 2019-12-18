function Get-SnipeItCompany {
<#
.SYNOPSIS
 Sorry, no description was provided in the API reference

.DESCRIPTION
 Companies: no description was provided in the API reference

 CompaniesById: Retrieve the specific details of a company by id

.LINK
 https://snipe-it.readme.io/reference#companies

.LINK
 https://snipe-it.readme.io/reference#companiesid

#>
[CmdletBinding(DefaultParameterSetName="Companies")]
param (
    <# ParameterSet Companies #>
    
    [Parameter(ParameterSetName='Companies')]
    [switch]$Companies,
    
    [Parameter(ParameterSetName='Companies')]
    [string]$search,
    
    <# ParameterSet CompaniesById #>
    
    # company id
    [Parameter(ParameterSetName='CompaniesById', Mandatory=$true, ValueFromPipelineByPropertyName=$true)]
    [int]$id,
    
    # URL of the SnipeItApp
    [Parameter(Mandatory=$True)]
    [string]$Url,
    
    # API Key to use for access
    [Parameter(Mandatory=$True)]
    [string]$ApiKey
    )
    
Write-Debug -Message ( "Function {0}, ParameterSetName is {1}" -f $PSCmdlet.MyInvocation.MyCommand, $PsCmdlet.ParameterSetName)

#region    ParameterSet: Companies, parameters in body: 0, in query: 1

    if ($PsCmdlet.ParameterSetName -eq "Companies") {
        $optionalParameters = . Get-ParameterValue
        $Parameters = @{
            Uri = "$url/api/v1/companies"
            Method = "get"
            UriQuery = $optionalParameters
            Token = $apiKey
            }

        Invoke-SnipeItMethod @Parameters
        }
#endregion

#region    ParameterSet: CompaniesById, parameters in body: 0, in query: 0

    if ($PsCmdlet.ParameterSetName -eq "CompaniesById") {
        $Parameters = @{
            Uri = "$url/api/v1/companies/$id"
            Method = "get"
            Token = $apiKey
            }

        Invoke-SnipeItMethod @Parameters
        }
#endregion


} # End of Get-SnipeItCompany

