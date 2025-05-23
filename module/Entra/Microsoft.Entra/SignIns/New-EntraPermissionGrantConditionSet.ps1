# ------------------------------------------------------------------------------ 
#  Copyright (c) Microsoft Corporation.  All Rights Reserved.  
#  Licensed under the MIT License.  See License in the project root for license information. 
# ------------------------------------------------------------------------------ 
function New-EntraPermissionGrantConditionSet {
    [CmdletBinding(DefaultParameterSetName = 'ByPolicyIdAndConditionSetType')]
    param (                
        [Parameter(ParameterSetName = "ByPolicyIdAndConditionSetType")]
        [System.Nullable`1[System.Boolean]] $ClientApplicationsFromVerifiedPublisherOnly,
                
        [Parameter(Mandatory = $true, ValueFromPipeline = $true, ValueFromPipelineByPropertyName = $true)]
        [System.String] $PolicyId,
                
        [Parameter(ParameterSetName = "ByPolicyIdAndConditionSetType")]
        [System.String] $PermissionType,
                
        [Parameter(ParameterSetName = "ByPolicyIdAndConditionSetType")]
        [System.Collections.Generic.List`1[System.String]] $ClientApplicationTenantIds,
                
        [Parameter(Mandatory = $true, ValueFromPipeline = $true, ValueFromPipelineByPropertyName = $true)]
        [System.String] $ConditionSetType,
                
        [Parameter(ParameterSetName = "ByPolicyIdAndConditionSetType")]
        [System.Collections.Generic.List`1[System.String]] $ClientApplicationIds,
                
        [Parameter(ParameterSetName = "ByPolicyIdAndConditionSetType")]
        [System.Collections.Generic.List`1[System.String]] $ClientApplicationPublisherIds,
                
        [Parameter(ParameterSetName = "ByPolicyIdAndConditionSetType")]
        [System.Collections.Generic.List`1[System.String]] $Permissions,
                
        [Parameter(ParameterSetName = "ByPolicyIdAndConditionSetType")]
        [System.String] $ResourceApplication,
                
        [Parameter(ParameterSetName = "ByPolicyIdAndConditionSetType")]
        [System.String] $PermissionClassification
    )

    PROCESS {    
        $params = @{}
        $customHeaders = New-EntraCustomHeaders -Command $MyInvocation.MyCommand
        
        if ($null -ne $PSBoundParameters["PermissionType"]) {
            $params["PermissionType"] = $PSBoundParameters["PermissionType"]
        }
        if ($null -ne $PSBoundParameters["PermissionClassification"]) {
            $params["PermissionClassification"] = $PSBoundParameters["PermissionClassification"]
        }
        if ($null -ne $PSBoundParameters["ResourceApplication"]) {
            $params["ResourceApplication"] = $PSBoundParameters["ResourceApplication"]
        }
        if ($null -ne $PSBoundParameters["Permissions"]) {
            $params["Permissions"] = $PSBoundParameters["Permissions"]
        }
        if ($PSBoundParameters.ContainsKey("Verbose")) {
            $params["Verbose"] = $PSBoundParameters["Verbose"]
        }
        if ($null -ne $PSBoundParameters["ClientApplicationTenantIds"]) {
            $params["ClientApplicationTenantIds"] = $PSBoundParameters["ClientApplicationTenantIds"]
        }
        if ($PSBoundParameters.ContainsKey("Debug")) {
            $params["Debug"] = $PSBoundParameters["Debug"]
        }
        if ($null -ne $PSBoundParameters["PolicyId"]) {
            $params["PermissionGrantPolicyId"] = $PSBoundParameters["PolicyId"]
        }
        if ($null -ne $PSBoundParameters["ConditionSetType"]) {
            $conditionalSet = $PSBoundParameters["ConditionSetType"]
        }
        if ($null -ne $PSBoundParameters["ClientApplicationsFromVerifiedPublisherOnly"]) {
            $params["ClientApplicationsFromVerifiedPublisherOnly"] = $PSBoundParameters["ClientApplicationsFromVerifiedPublisherOnly"]
        }
        if ($null -ne $PSBoundParameters["ClientApplicationPublisherIds"]) {
            $params["ClientApplicationPublisherIds"] = $PSBoundParameters["ClientApplicationPublisherIds"]
        }
        if ($null -ne $PSBoundParameters["ClientApplicationIds"]) {
            $params["ClientApplicationIds"] = $PSBoundParameters["ClientApplicationIds"]
        }
        if ($null -ne $PSBoundParameters["WarningVariable"]) {
            $params["WarningVariable"] = $PSBoundParameters["WarningVariable"]
        }
        if ($null -ne $PSBoundParameters["InformationVariable"]) {
            $params["InformationVariable"] = $PSBoundParameters["InformationVariable"]
        }
        if ($null -ne $PSBoundParameters["InformationAction"]) {
            $params["InformationAction"] = $PSBoundParameters["InformationAction"]
        }
        if ($null -ne $PSBoundParameters["OutVariable"]) {
            $params["OutVariable"] = $PSBoundParameters["OutVariable"]
        }
        if ($null -ne $PSBoundParameters["OutBuffer"]) {
            $params["OutBuffer"] = $PSBoundParameters["OutBuffer"]
        }
        if ($null -ne $PSBoundParameters["ErrorVariable"]) {
            $params["ErrorVariable"] = $PSBoundParameters["ErrorVariable"]
        }
        if ($null -ne $PSBoundParameters["PipelineVariable"]) {
            $params["PipelineVariable"] = $PSBoundParameters["PipelineVariable"]
        }
        if ($null -ne $PSBoundParameters["ErrorAction"]) {
            $params["ErrorAction"] = $PSBoundParameters["ErrorAction"]
        }
        if ($null -ne $PSBoundParameters["WarningAction"]) {
            $params["WarningAction"] = $PSBoundParameters["WarningAction"]
        }
    
        Write-Debug("============================ TRANSFORMATIONS ============================")
        $params.Keys | ForEach-Object { "$_ : $($params[$_])" } | Write-Debug
        Write-Debug("=========================================================================`n")
        

        if ("$conditionalSet" -eq "includes") {
            $response = New-MgPolicyPermissionGrantPolicyInclude @params -Headers $customHeaders
        }
        elseif ("$conditionalSet" -eq "excludes") {
            $response = New-MgPolicyPermissionGrantPolicyExclude @params -Headers $customHeaders
        }
        else {
            Write-Error("Message: Resource not found for the segment '$conditionalSet'.")
            return
        }
        
        
        $response
    }     
}

