function Remove-SnipeItCategory {
<#
.SYNOPSIS
 Delete a Category

.DESCRIPTION
 Categories: Delete a Category

.LINK
 https://snipe-it.readme.io/reference#categoriesid-2

#>
[CmdletBinding(DefaultParameterSetName="Categories")]
param (
    <# ParameterSet Categories #>
    
    # Category ID
    [Parameter(ParameterSetName='Categories', Mandatory=$true, ValueFromPipelineByPropertyName=$true)]
    [string]$id,
    
    # URL of the SnipeItApp
    [Parameter(Mandatory=$True)]
    [string]$Url,
    
    # API Key to use for access
    [Parameter(Mandatory=$True)]
    [string]$ApiKey
    )
    
Write-Debug -Message ( "Function {0}, ParameterSetName is {1}" -f $PSCmdlet.MyInvocation.MyCommand, $PsCmdlet.ParameterSetName)

#region    ParameterSet: Categories, parameters in body: 0, in query: 0

    if ($PsCmdlet.ParameterSetName -eq "Categories") {
        $Parameters = @{
            Uri = "$url/api/v1/categories/$id"
            Method = "delete"
            Token = $apiKey
            }

        Invoke-SnipeItMethod @Parameters
        }
#endregion


} # End of Remove-SnipeItCategory

