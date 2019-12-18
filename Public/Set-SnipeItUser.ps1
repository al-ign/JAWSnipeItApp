function Set-SnipeItUser {
<#
.SYNOPSIS
 Partially update a user, passing only the fields you want to modify

.DESCRIPTION
 Users: Partially update a user, passing only the fields you want to modify

.LINK
 https://snipe-it.readme.io/reference#users-3

#>
[CmdletBinding(DefaultParameterSetName="Users")]
param (
    <# ParameterSet Users #>
    
    # User ID
    [Parameter(ParameterSetName='Users', Mandatory=$true, ValueFromPipelineByPropertyName=$true)]
    [string]$id,
    
    [Parameter(ParameterSetName='Users')]
    [string]$first_name,
    
    [Parameter(ParameterSetName='Users')]
    [string]$last_name,
    
    [Parameter(ParameterSetName='Users')]
    [string]$username,
    
    [Parameter(ParameterSetName='Users')]
    [string]$password,
    
    # Required if password field is passed, and it must match the password field.
    [Parameter(ParameterSetName='Users')]
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
        $optionalParameters = . Get-ParameterValue -DefaultExcludeParameter @('id', 'url', 'apiKey', 'Debug', 'Verbose', 'customfields')
        if ($PSBoundParameters.ContainsKey("customfields")) { 
            $optionalParameters += $customfields
            }

        $Parameters = @{
            Uri = "$url/api/v1/users/$id"
            Method = "patch"
            Body = $optionalParameters | ConvertTo-Json
            Token = $apiKey
            }

        Invoke-SnipeItMethod @Parameters
        }
#endregion


} # End of Set-SnipeItUser

