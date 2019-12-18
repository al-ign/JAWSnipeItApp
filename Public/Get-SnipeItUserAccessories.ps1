function Get-SnipeItUserAccessories {
<#
.SYNOPSIS
 Get a list of assets checked out to the user

.DESCRIPTION
 UsersAccessories: Get a list of assets checked out to the user

.LINK
 https://snipe-it.readme.io/reference#usersidaccessories

#>
[CmdletBinding(DefaultParameterSetName="UsersAccessories")]
param (
    <# ParameterSet UsersAccessories #>
    
    # User id
    [Parameter(ParameterSetName='UsersAccessories', Mandatory=$true, ValueFromPipelineByPropertyName=$true)]
    [int]$id,
    
    # URL of the SnipeItApp
    [Parameter(Mandatory=$True)]
    [string]$Url,
    
    # API Key to use for access
    [Parameter(Mandatory=$True)]
    [string]$ApiKey
    )
    
Write-Debug -Message ( "Function {0}, ParameterSetName is {1}" -f $PSCmdlet.MyInvocation.MyCommand, $PsCmdlet.ParameterSetName)

#region    ParameterSet: UsersAccessories, parameters in body: 0, in query: 0

    if ($PsCmdlet.ParameterSetName -eq "UsersAccessories") {
        $Parameters = @{
            Uri = "$url/api/v1/users/$id/accessories"
            Method = "get"
            Token = $apiKey
            }

        Invoke-SnipeItMethod @Parameters
        }
#endregion


} # End of Get-SnipeItUserAccessories

