function Set-SnipeItCategory {
<#
.SYNOPSIS
 Update a Category

.DESCRIPTION
 Categories: Update a Category

.LINK
 https://snipe-it.readme.io/reference#categoriesid-1

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
    
    # Category ID
    [Parameter(ParameterSetName='Categories', Mandatory=$true, ValueFromPipelineByPropertyName=$true)]
    [int]$id,
    
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
        $optionalParameters = . Get-ParameterValue -DefaultExcludeParameter @('id', 'url', 'apiKey', 'Debug', 'Verbose', 'customfields')
        if ($PSBoundParameters.ContainsKey("customfields")) { 
            $optionalParameters += $customfields
            }

        $Parameters = @{
            Uri = "$url/api/v1/categories/$id"
            Method = "patch"
            Body = $optionalParameters | ConvertTo-Json
            Token = $apiKey
            }

        Invoke-SnipeItMethod @Parameters
        }
#endregion


} # End of Set-SnipeItCategory

