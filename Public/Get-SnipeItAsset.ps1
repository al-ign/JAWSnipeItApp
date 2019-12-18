function Get-SnipeItAsset {
<#
.SYNOPSIS
 Return a listing of assets

.DESCRIPTION
 Hardware: Return a listing of assets

 HardwareById: Get the details of a specific asset

 HardwareBytag: Get the details of a specific asset by asset tag

 HardwareByserial: Get the details of a specific asset by asset tag

 HardwareAuditDue: Return a list of assets that are due for audit soon

 HardwareAuditOverdue: Return a list of assets that are due for audit soon

.LINK
 https://snipe-it.readme.io/reference#hardware-list

.LINK
 https://snipe-it.readme.io/reference#hardware-by-id

.LINK
 https://snipe-it.readme.io/reference#hardware-by-asset-tag

.LINK
 https://snipe-it.readme.io/reference#hardware-by-serial

.LINK
 https://snipe-it.readme.io/reference#hardwareauditdue

.LINK
 https://snipe-it.readme.io/reference#hardwareauditoverdue

#>
[CmdletBinding(DefaultParameterSetName="Hardware")]
param (
    <# ParameterSet Hardware #>
    
    [Parameter(ParameterSetName='Hardware')]
    [switch]$Hardware,
    
    # Specify the number of results you wish to return. Defaults to 50, but we have it set to 2 by default so the API explorer doesn't scroll forever.
    [Parameter(ParameterSetName='Hardware')]
    [int]$limit,
    
    # Offset to use
    [Parameter(ParameterSetName='Hardware')]
    [int]$offset,
    
    # A text string to search the assets data for
    [Parameter(ParameterSetName='Hardware')]
    [string]$search,
    
    # Return only assets associated with a specific order number
    [Parameter(ParameterSetName='Hardware')]
    [string]$order_number,
    
    # Specify the column name you wish to sort by
    [Parameter(ParameterSetName='Hardware')]
    [string]$sort,
    
    # Specify the order (asc or desc) you wish to order by on your sort column
    [Parameter(ParameterSetName='Hardware')]
    [ValidateSet($null, "asc", "desc")]
    [string]$order,
    
    # Optionally restrict asset results to this asset model ID
    [Parameter(ParameterSetName='Hardware')]
    [int]$model_id,
    
    # Optionally restrict asset results to this status label ID
    [Parameter(ParameterSetName='Hardware')]
    [int]$category_id,
    
    # Optionally restrict asset results to this asset model ID
    [Parameter(ParameterSetName='Hardware')]
    [int]$manufacturer_id,
    
    # Optionally restrict asset results to this company ID
    [Parameter(ParameterSetName='Hardware')]
    [int]$company_id,
    
    # Optionally restrict asset results to this location ID
    [Parameter(ParameterSetName='Hardware')]
    [int]$location_id,
    
    # Optionally restrict asset results to one of these status types: RTD, Deployed, Undeployable, Deleted, Archived, Requestable
    [Parameter(ParameterSetName='Hardware')]
    [string]$status,
    
    # Optionally restrict asset results to this status label ID
    [Parameter(ParameterSetName='Hardware')]
    [string]$status_id,
    
    <# ParameterSet HardwareById #>
    
    # The id (not the asset tag) of the asset you'd like to query
    [Parameter(ParameterSetName='HardwareById', Mandatory=$true, ValueFromPipelineByPropertyName=$true)]
    [int]$id,
    
    <# ParameterSet HardwareBytag #>
    
    # The asset_tag (not the ID) of the asset you'd like to query
    [Parameter(ParameterSetName='HardwareBytag', Mandatory=$true)]
    [string]$asset_tag,
    
    <# ParameterSet HardwareByserial #>
    
    # The serial number (not the ID) of the asset you'd like to query
    [Parameter(ParameterSetName='HardwareByserial', Mandatory=$true)]
    [string]$serial,
    
    <# ParameterSet HardwareAuditDue #>
    
    [Parameter(ParameterSetName='HardwareAuditDue')]
    [switch]$HardwareAuditDue,
    
    <# ParameterSet HardwareAuditOverdue #>
    
    [Parameter(ParameterSetName='HardwareAuditOverdue')]
    [switch]$HardwareAuditOverdue,
    
    # URL of the SnipeItApp
    [Parameter(Mandatory=$True)]
    [string]$Url,
    
    # API Key to use for access
    [Parameter(Mandatory=$True)]
    [string]$ApiKey
    )
    
Write-Debug -Message ( "Function {0}, ParameterSetName is {1}" -f $PSCmdlet.MyInvocation.MyCommand, $PsCmdlet.ParameterSetName)

#region    ParameterSet: Hardware, parameters in body: 0, in query: 13

    if ($PsCmdlet.ParameterSetName -eq "Hardware") {
        $optionalParameters = . Get-ParameterValue
        $Parameters = @{
            Uri = "$url/api/v1/hardware"
            Method = "get"
            UriQuery = $optionalParameters
            Token = $apiKey
            }

        Invoke-SnipeItMethod @Parameters
        }
#endregion

#region    ParameterSet: HardwareById, parameters in body: 0, in query: 0

    if ($PsCmdlet.ParameterSetName -eq "HardwareById") {
        $Parameters = @{
            Uri = "$url/api/v1/hardware/$id"
            Method = "get"
            Token = $apiKey
            }

        Invoke-SnipeItMethod @Parameters
        }
#endregion

#region    ParameterSet: HardwareBytag, parameters in body: 0, in query: 0

    if ($PsCmdlet.ParameterSetName -eq "HardwareBytag") {
        $Parameters = @{
            Uri = "$url/api/v1/hardware/bytag/$asset_tag"
            Method = "get"
            Token = $apiKey
            }

        Invoke-SnipeItMethod @Parameters
        }
#endregion

#region    ParameterSet: HardwareByserial, parameters in body: 0, in query: 0

    if ($PsCmdlet.ParameterSetName -eq "HardwareByserial") {
        $Parameters = @{
            Uri = "$url/api/v1/hardware/byserial/$serial"
            Method = "get"
            Token = $apiKey
            }

        Invoke-SnipeItMethod @Parameters
        }
#endregion

#region    ParameterSet: HardwareAuditDue, parameters in body: 0, in query: 0

    if ($PsCmdlet.ParameterSetName -eq "HardwareAuditDue") {
        $Parameters = @{
            Uri = "$url/api/v1/hardware/audit/due"
            Method = "get"
            Token = $apiKey
            }

        Invoke-SnipeItMethod @Parameters
        }
#endregion

#region    ParameterSet: HardwareAuditOverdue, parameters in body: 0, in query: 0

    if ($PsCmdlet.ParameterSetName -eq "HardwareAuditOverdue") {
        $Parameters = @{
            Uri = "$url/api/v1/hardware/audit/overdue"
            Method = "get"
            Token = $apiKey
            }

        Invoke-SnipeItMethod @Parameters
        }
#endregion


} # End of Get-SnipeItAsset

