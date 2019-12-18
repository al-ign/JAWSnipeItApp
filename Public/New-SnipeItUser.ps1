function New-SnipeItUser {
<#
.SYNOPSIS
 Create a new user

.DESCRIPTION
 Users: Create a new user

.LINK
 https://snipe-it.readme.io/reference#users-2

#>
[CmdletBinding(DefaultParameterSetName="Users")]
param (
    <# ParameterSet Users #>
    
    [Parameter(ParameterSetName='Users', Mandatory=$true)]
    [string]$first_name,
    
    [Parameter(ParameterSetName='Users')]
    [string]$last_name,
    
    [Parameter(ParameterSetName='Users', Mandatory=$true)]
    [string]$username,
    
    [Parameter(ParameterSetName='Users', Mandatory=$true)]
    [string]$password,
    
    # Must match the password field
    [Parameter(ParameterSetName='Users', Mandatory=$true)]
    [string]$password_confirmation,
    
    [Parameter(ParameterSetName='Users')]
    [string]$email,
    
    [Parameter(ParameterSetName='Users')]
    [string]$permissions,
    
    [Parameter(ParameterSetName='Users')]
    [boolean]$activated,
    
    [Parameter(ParameterSetName='Users')]
    [string]$phone,
    
    [Parameter(ParameterSetName='Users')]
    [string]$jobtitle,
    
    [Parameter(ParameterSetName='Users')]
    [int]$manager_id,
    
    [Parameter(ParameterSetName='Users')]
    [string]$employee_num,
    
    [Parameter(ParameterSetName='Users')]
    [string]$notes,
    
    [Parameter(ParameterSetName='Users')]
    [int]$company_id,
    
    [Parameter(ParameterSetName='Users')]
    [boolean]$two_factor_enrolled,
    
    [Parameter(ParameterSetName='Users')]
    [boolean]$two_factor_optin,
    
    [Parameter(ParameterSetName='Users')]
    [int]$department_id,
    
    # URL of the SnipeItApp
    [Parameter(Mandatory=$True)]
    [string]$Url,
    
    # API Key to use for access
    [Parameter(Mandatory=$True)]
    [string]$ApiKey
    )
    
Write-Debug -Message ( "Function {0}, ParameterSetName is {1}" -f $PSCmdlet.MyInvocation.MyCommand, $PsCmdlet.ParameterSetName)

#region    ParameterSet: Users, parameters in body: 17, in query: 0

    if ($PsCmdlet.ParameterSetName -eq "Users") {
        $optionalParameters = . Get-ParameterValue
        $Parameters = @{
            Uri = "$url/api/v1/users"
            Method = "post"
            Body = $optionalParameters | ConvertTo-Json
            Token = $apiKey
            }

        Invoke-SnipeItMethod @Parameters
        }
#endregion


} # End of New-SnipeItUser

