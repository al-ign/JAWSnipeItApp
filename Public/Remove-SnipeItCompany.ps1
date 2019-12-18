function Remove-SnipeItCompany {
<#
.SYNOPSIS
 Delete's a company

.DESCRIPTION
 Companies: Delete's a company

.LINK
 https://snipe-it.readme.io/reference#companiesid-3

#>
[CmdletBinding(DefaultParameterSetName="Companies")]
param (
    <# ParameterSet Companies #>
    
    # company id
    [Parameter(ParameterSetName='Companies', Mandatory=$true, ValueFromPipelineByPropertyName=$true)]
    [int]$id,
    
    # URL of the SnipeItApp
    [Parameter(Mandatory=$True)]
    [string]$Url,
    
    # API Key to use for access
    [Parameter(Mandatory=$True)]
    [string]$ApiKey
    )
    
Write-Debug -Message ( "Function {0}, ParameterSetName is {1}" -f $PSCmdlet.MyInvocation.MyCommand, $PsCmdlet.ParameterSetName)

#region    ParameterSet: Companies, parameters in body: 0, in query: 0

    if ($PsCmdlet.ParameterSetName -eq "Companies") {
        $Parameters = @{
            Uri = "$url/api/v1/companies/$id"
            Method = "delete"
            Token = $apiKey
            }

        Invoke-SnipeItMethod @Parameters
        }
#endregion


} # End of Remove-SnipeItCompany

