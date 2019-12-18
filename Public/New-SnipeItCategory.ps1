function New-SnipeItCategory {
<#
.SYNOPSIS
 Create a Category

.DESCRIPTION
 Categories: Create a Category

.LINK
 https://snipe-it.readme.io/reference#categories-2

#>
[CmdletBinding(DefaultParameterSetName="Categories")]
param (
    <# ParameterSet Categories #>
    
    # Model name
    [Parameter(ParameterSetName='Categories', Mandatory=$true)]
    [string]$name,
    
    # (asset, accessory, consumable, component)
    [Parameter(ParameterSetName='Categories', Mandatory=$true)]
    [string]$category_type,
    
    [Parameter(ParameterSetName='Categories')]
    [boolean]$use_default_eula,
    
    [Parameter(ParameterSetName='Categories')]
    [boolean]$require_acceptance,
    
    # Should the user be emailed the EULA and/or an acceptance confirmation email when this item is checked in?
    [Parameter(ParameterSetName='Categories')]
    [boolean]$checkin_email,
    
    # URL of the SnipeItApp
    [Parameter(Mandatory=$True)]
    [string]$Url,
    
    # API Key to use for access
    [Parameter(Mandatory=$True)]
    [string]$ApiKey
    )
    
Write-Debug -Message ( "Function {0}, ParameterSetName is {1}" -f $PSCmdlet.MyInvocation.MyCommand, $PsCmdlet.ParameterSetName)

#region    ParameterSet: Categories, parameters in body: 5, in query: 0

    if ($PsCmdlet.ParameterSetName -eq "Categories") {
        $optionalParameters = . Get-ParameterValue
        $Parameters = @{
            Uri = "$url/api/v1/categories"
            Method = "post"
            Body = $optionalParameters | ConvertTo-Json
            Token = $apiKey
            }

        Invoke-SnipeItMethod @Parameters
        }
#endregion


} # End of New-SnipeItCategory

