function Set-SnipeItCompany {
<#
.SYNOPSIS
 Updates a part of a company's details

.DESCRIPTION
 Companies: Updates a part of a company's details

.LINK
 https://snipe-it.readme.io/reference#companiesid-2

#>
[CmdletBinding(DefaultParameterSetName="Companies")]
param (
    <# ParameterSet Companies #>
    
    # company id
    [Parameter(ParameterSetName='Companies', Mandatory=$true, ValueFromPipelineByPropertyName=$true)]
    [int]$id,
    
    [Parameter(ParameterSetName='Companies', Mandatory=$true)]
    [string]$name,
    
    # URL of the SnipeItApp
    [Parameter(Mandatory=$True)]
    [string]$Url,
    
    # API Key to use for access
    [Parameter(Mandatory=$True)]
    [string]$ApiKey
    )
    
Write-Debug -Message ( "Function {0}, ParameterSetName is {1}" -f $PSCmdlet.MyInvocation.MyCommand, $PsCmdlet.ParameterSetName)

#region    ParameterSet: Companies, parameters in body: 1, in query: 0

    if ($PsCmdlet.ParameterSetName -eq "Companies") {
        $optionalParameters = . Get-ParameterValue -DefaultExcludeParameter @('id', 'url', 'apiKey', 'Debug', 'Verbose', 'customfields')
        if ($PSBoundParameters.ContainsKey("customfields")) { 
            $optionalParameters += $customfields
            }

        $Parameters = @{
            Uri = "$url/api/v1/companies/$id"
            Method = "patch"
            Body = $optionalParameters | ConvertTo-Json
            Token = $apiKey
            }

        Invoke-SnipeItMethod @Parameters
        }
#endregion


} # End of Set-SnipeItCompany

