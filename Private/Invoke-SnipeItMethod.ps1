function Invoke-SnipeItMethod {
    <#
    .SYNOPSIS
    Function to invoke SnipeIt queries against the API
    #>
    [OutputType(
        [PSObject]
    )]
    param (
        # REST API to invoke
        [Parameter(Mandatory = $true)]
        [Uri]$Uri,

        # Method of the invokation
        [ValidateSet("GET", "POST", "PUT", "PATCH", "DELETE")]
        [string]$Method = "GET",

        # Optional parameters in the URI used in the GET requests
        $UriQuery,

        # Optional parameters passed in the body of request
        [ValidateNotNullOrEmpty()]
        [string]$Body,

        # ApiKey to authenticate
        [string]$Token
    )

    BEGIN {

    function ConvertTo-UriParameters {
    <#
    .SYNOPSIS
    Generate the GET parameter string for an URL from a hashtable
    #>
    [CmdletBinding()]
    param (
        [Parameter( Position = 0, Mandatory = $true, ValueFromPipeline = $true )]
        [hashtable]$InputObject
    )

        BEGIN {
            [string]$parameters = "?"
            }

        PROCESS {
            Add-Type -AssemblyName System.Web

            Write-Verbose "[$($MyInvocation.MyCommand.Name)] Making HTTP get parameter string out of a hashtable"
            foreach ($key in $InputObject.Keys) {
                $parameters += "$key=$([System.Web.HttpUtility]::UrlEncode($InputObject[$key]))&"
                }
            }

        END {
            $parameters -replace ".$"
            }
        } # End of ConvertTo-UriParameters



        # Validation of parameters
        if (($Method -in ("POST", "PUT", "PATCH")) -and (!($Body))) {
            $message = "The following parameters are required when using the ${Method} parameter: Body."
            $exception = New-Object -TypeName System.ArgumentException -ArgumentList $message
            Throw $exception
        }

        $_headers = @{
            "Authorization" = "Bearer $($token)"
            'Content-Type'  = 'application/json; charset=utf-8'
            "Accept" = "application/json"
        }
    }

    Process {
        if ($UriQuery -and ($URi -notlike "*\?*"))
        {
            Write-Debug "Using `$GetParameters: $($UriQuery | Out-String)"
            [string]$URI += (ConvertTo-UriParameters $UriQuery)
            # Prevent recursive appends
            $UriQuery = $null
        }

        # set mandatory parameters
        $splatParameters = @{
            Uri             = $URi
            Method          = $Method
            Headers         = $_headers
            UseBasicParsing = $true
            ErrorAction     = 'SilentlyContinue'
        }

        if ($Body) {
            Write-Debug 'Adding Body to splat parameter'
            $splatParameters["Body"] = [System.Text.Encoding]::UTF8.GetBytes($Body)
            }

        $script:PSDefaultParameterValues = $global:PSDefaultParameterValues

        Write-Debug $Body

        # Invoke the API
        try {
            Write-Verbose "[$($MyInvocation.MyCommand.Name)] Invoking method $Method to URI $URi"
            Write-Debug "[$($MyInvocation.MyCommand.Name)] Invoke-WebRequest with: $($splatParameters | Out-String)"
            $webResponse = Invoke-WebRequest @splatParameters
        }
        catch {
            Write-Verbose "[$($MyInvocation.MyCommand.Name)] Failed to get an answer from the server"
            $webResponse = $_.Exception.Response
        }

        Write-Debug "[$($MyInvocation.MyCommand.Name)] Executed WebRequest. Access $webResponse to see details"

        if ($webResponse) {
            Write-Verbose "[$($MyInvocation.MyCommand.Name)] Status code: $($webResponse.StatusCode)"

            if ($webResponse.Content) {
                 Write-Verbose $webResponse.Content

                # API returned a Content: lets work wit it
                $response = ConvertFrom-Json -InputObject $webResponse.Content

                if ($response.status -eq "error") {
                    Write-Verbose "[$($MyInvocation.MyCommand.Name)] An error response was received from; resolving"
                    # This could be handled nicely in an function such as:
                    # ResolveError $response -WriteError
                    Write-Error $($response.messages | Out-String)
                }
                else {
                    $result = $response
                    if (($response) -and ($response | Get-Member -Name payload))
                    {
                        $result = $response.payload
                    }
                    elseif (($response) -and ($response | Get-Member -Name rows)) {
                        $result = $response.rows
                    }

                    $result
                }
            }
            elseif ($webResponse.StatusCode -eq "Unauthorized") {
                Write-Error "[$($MyInvocation.MyCommand.Name)] You are not Authorized to access the resource, check your token is correct"
            }
            else {
                # No content, although statusCode < 400
                # This could be wanted behavior of the API
                Write-Verbose "[$($MyInvocation.MyCommand.Name)] No content was returned from."
            }

        }
        else {
            Write-Verbose "[$($MyInvocation.MyCommand.Name)] No Web result object was returned from. This is unusual!"
        }
    }

    END {
        Write-Verbose "[$($MyInvocation.MyCommand.Name)] Function ended"
    }
}
