function New-SnipeItCompany {
<#
.SYNOPSIS
 Create a new company

.DESCRIPTION
 Companies: Create a new company

.LINK
 https://snipe-it.readme.io/reference#companies-1

#>
[CmdletBinding(DefaultParameterSetName="Companies")]
param (
    <# ParameterSet Companies #>
    
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
        $optionalParameters = . Get-ParameterValue
        $Parameters = @{
            Uri = "$url/api/v1/companies"
            Method = "post"
            Body = $optionalParameters | ConvertTo-Json
            Token = $apiKey
            }

        Invoke-SnipeItMethod @Parameters
        }
#endregion


} # End of New-SnipeItCompany

