function Remove-SnipeItUser {
<#
.SYNOPSIS
 Delete a user

.DESCRIPTION
 Users: Delete a user

.LINK
 https://snipe-it.readme.io/reference#usersid-1

#>
[CmdletBinding(DefaultParameterSetName="Users")]
param (
    <# ParameterSet Users #>
    
    # User id
    [Parameter(ParameterSetName='Users', Mandatory=$true, ValueFromPipelineByPropertyName=$true)]
    [int]$id,
    
    # URL of the SnipeItApp
    [Parameter(Mandatory=$True)]
    [string]$Url,
    
    # API Key to use for access
    [Parameter(Mandatory=$True)]
    [string]$ApiKey
    )
    
Write-Debug -Message ( "Function {0}, ParameterSetName is {1}" -f $PSCmdlet.MyInvocation.MyCommand, $PsCmdlet.ParameterSetName)

#region    ParameterSet: Users, parameters in body: 0, in query: 0

    if ($PsCmdlet.ParameterSetName -eq "Users") {
        $Parameters = @{
            Uri = "$url/api/v1/users/$id"
            Method = "delete"
            Token = $apiKey
            }

        Invoke-SnipeItMethod @Parameters
        }
#endregion


} # End of Remove-SnipeItUser

