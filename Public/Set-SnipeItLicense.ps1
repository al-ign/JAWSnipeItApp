function Set-SnipeItLicense {
<#
.SYNOPSIS
 Sorry, no description was provided in the API reference

.DESCRIPTION
 Licenses: no description was provided in the API reference

.LINK
 https://snipe-it.readme.io/reference#licensesid-2

#>
[CmdletBinding(DefaultParameterSetName="Licenses")]
param (
    <# ParameterSet Licenses #>
    
    # Name of license being created
    [Parameter(ParameterSetName='Licenses')]
    [string]$name,
    
    # Id number of company license belongs to
    [Parameter(ParameterSetName='Licenses')]
    [int]$company_id,
    
    # Date of license expiration
    [Parameter(ParameterSetName='Licenses')]
    [datetime]$expiration_date,
    
    # Email address associated with license
    [Parameter(ParameterSetName='Licenses')]
    [string]$license_email,
    
    # Name of license contact person
    [Parameter(ParameterSetName='Licenses')]
    [string]$license_name,
    
    # Maintained status of license.
    [Parameter(ParameterSetName='Licenses')]
    [boolean]$maintained,
    
    # ID number of manufacturer of license.
    [Parameter(ParameterSetName='Licenses')]
    [int]$manufacturer_id,
    
    # License Notes
    [Parameter(ParameterSetName='Licenses')]
    [string]$notes,
    
    # Order number of license purchase
    [Parameter(ParameterSetName='Licenses')]
    [string]$order_number,
    
    # Cost of license
    [Parameter(ParameterSetName='Licenses')]
    [float]$purchase_cost,
    
    # Date of license purchase
    [Parameter(ParameterSetName='Licenses')]
    [datetime]$purchase_date,
    
    # Purchase Order #
    [Parameter(ParameterSetName='Licenses')]
    [string]$purchase_order,
    
    # Is license reassignable?
    [Parameter(ParameterSetName='Licenses')]
    [boolean]$reassignable,
    
    # Number of license seats owned.
    [Parameter(ParameterSetName='Licenses')]
    [int]$seats,
    
    # Serial # for license
    [Parameter(ParameterSetName='Licenses')]
    [string]$serial,
    
    # ID number of license supplier
    [Parameter(ParameterSetName='Licenses')]
    [int]$supplier_id,
    
    # Termination date for license.
    [Parameter(ParameterSetName='Licenses')]
    [datetime]$termination_date,
    
    # ID (not name) of license being updated
    [Parameter(ParameterSetName='Licenses', Mandatory=$true, ValueFromPipelineByPropertyName=$true)]
    [int]$id,
    
    # URL of the SnipeItApp
    [Parameter(Mandatory=$True)]
    [string]$Url,
    
    # API Key to use for access
    [Parameter(Mandatory=$True)]
    [string]$ApiKey
    )
    
Write-Debug -Message ( "Function {0}, ParameterSetName is {1}" -f $PSCmdlet.MyInvocation.MyCommand, $PsCmdlet.ParameterSetName)

#region    ParameterSet: Licenses, parameters in body: 17, in query: 0

    if ($PsCmdlet.ParameterSetName -eq "Licenses") {
        $optionalParameters = . Get-ParameterValue -DefaultExcludeParameter @('id', 'url', 'apiKey', 'Debug', 'Verbose', 'customfields')
        if ($PSBoundParameters.ContainsKey("customfields")) { 
            $optionalParameters += $customfields
            }

        $Parameters = @{
            Uri = "$url/api/v1/licenses/$id"
            Method = "patch"
            Body = $optionalParameters | ConvertTo-Json
            Token = $apiKey
            }

        Invoke-SnipeItMethod @Parameters
        }
#endregion


} # End of Set-SnipeItLicense

