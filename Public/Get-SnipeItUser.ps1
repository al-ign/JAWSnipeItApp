function Get-SnipeItUser {
<#
.SYNOPSIS
 List users

.DESCRIPTION
 Users: List users

 UsersById: View user details

.LINK
 https://snipe-it.readme.io/reference#users

.LINK
 https://snipe-it.readme.io/reference#usersid

#>
[CmdletBinding(DefaultParameterSetName="Users")]
param (
    <# ParameterSet Users #>
    
    [Parameter(ParameterSetName='Users')]
    [switch]$Users,
    
    # String to search on
    [Parameter(ParameterSetName='Users')]
    [string]$search,
    
    # Number of records to return
    [Parameter(ParameterSetName='Users')]
    [int]$limit,
    
    # Offset to use when retrieving results (useful in pagination)
    [Parameter(ParameterSetName='Users')]
    [int]$offset,
    
    # Field to order by
    [Parameter(ParameterSetName='Users')]
    [string]$sort,
    
    # Sort order (asc or desc)
    [Parameter(ParameterSetName='Users')]
    [ValidateSet($null, "asc", "desc")]
    [string]$order,
    
    # Pass a group ID to return only users within that group
    [Parameter(ParameterSetName='Users')]
    [int]$group_id,
    
    # Pass a company ID to return only users within that company
    [Parameter(ParameterSetName='Users')]
    [int]$company_id,
    
    # Pass a department ID to return only users within that department
    [Parameter(ParameterSetName='Users')]
    [int]$department_id,
    
    # Pass `true` to return a list of deleted users
    [Parameter(ParameterSetName='Users')]
    [boolean]$deleted,
    
    <# ParameterSet UsersById #>
    
    # User id
    [Parameter(ParameterSetName='UsersById', Mandatory=$true, ValueFromPipelineByPropertyName=$true)]
    [int]$id,
    
    # URL of the SnipeItApp
    [Parameter(Mandatory=$True)]
    [string]$Url,
    
    # API Key to use for access
    [Parameter(Mandatory=$True)]
    [string]$ApiKey
    )
    
Write-Debug -Message ( "Function {0}, ParameterSetName is {1}" -f $PSCmdlet.MyInvocation.MyCommand, $PsCmdlet.ParameterSetName)

#region    ParameterSet: Users, parameters in body: 0, in query: 9

    if ($PsCmdlet.ParameterSetName -eq "Users") {
        $optionalParameters = . Get-ParameterValue
        $Parameters = @{
            Uri = "$url/api/v1/users"
            Method = "get"
            UriQuery = $optionalParameters
            Token = $apiKey
            }

        Invoke-SnipeItMethod @Parameters
        }
#endregion

#region    ParameterSet: UsersById, parameters in body: 0, in query: 0

    if ($PsCmdlet.ParameterSetName -eq "UsersById") {
        $Parameters = @{
            Uri = "$url/api/v1/users/$id"
            Method = "get"
            Token = $apiKey
            }

        Invoke-SnipeItMethod @Parameters
        }
#endregion


} # End of Get-SnipeItUser

