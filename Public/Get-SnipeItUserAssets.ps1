function Get-SnipeItUserAssets {
<#
.SYNOPSIS
 Get a list of assets checked out to the user

.DESCRIPTION
 UsersAssets: Get a list of assets checked out to the user

.LINK
 https://snipe-it.readme.io/reference#usersidassets

#>
[CmdletBinding(DefaultParameterSetName="UsersAssets")]
param (
    <# ParameterSet UsersAssets #>
    
    # User id
    [Parameter(ParameterSetName='UsersAssets', Mandatory=$true, ValueFromPipelineByPropertyName=$true)]
    [int]$id,
    
    # URL of the SnipeItApp
    [Parameter(Mandatory=$True)]
    [string]$Url,
    
    # API Key to use for access
    [Parameter(Mandatory=$True)]
    [string]$ApiKey
    )
    
Write-Debug -Message ( "Function {0}, ParameterSetName is {1}" -f $PSCmdlet.MyInvocation.MyCommand, $PsCmdlet.ParameterSetName)

#region    ParameterSet: UsersAssets, parameters in body: 0, in query: 0

    if ($PsCmdlet.ParameterSetName -eq "UsersAssets") {
        $Parameters = @{
            Uri = "$url/api/v1/users/$id/assets"
            Method = "get"
            Token = $apiKey
            }

        Invoke-SnipeItMethod @Parameters
        }
#endregion


} # End of Get-SnipeItUserAssets

