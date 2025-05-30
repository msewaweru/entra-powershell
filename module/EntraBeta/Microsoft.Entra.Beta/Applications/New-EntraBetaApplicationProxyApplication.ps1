# ------------------------------------------------------------------------------ 
#  Copyright (c) Microsoft Corporation.  All Rights Reserved.  
#  Licensed under the MIT License.  See License in the project root for license information. 
# ------------------------------------------------------------------------------ 
function New-EntraBetaApplicationProxyApplication {
    [CmdletBinding(DefaultParameterSetName = 'Default')]
    param (
    [Parameter(Mandatory = $true, ValueFromPipeline = $true, ValueFromPipelineByPropertyName = $true)]
    [System.String] $DisplayName,
    [Parameter(Mandatory = $true, ValueFromPipeline = $true, ValueFromPipelineByPropertyName = $true)]
    [System.String] $ExternalUrl,
    [Parameter(Mandatory = $true, ValueFromPipeline = $true, ValueFromPipelineByPropertyName = $true)]
    [System.String] $InternalUrl,
    [Parameter(Mandatory = $false, ValueFromPipeline = $true, ValueFromPipelineByPropertyName = $true)]
    [String] $ExternalAuthenticationType,
    [Parameter(Mandatory = $false, ValueFromPipeline = $true, ValueFromPipelineByPropertyName = $true)]
    [System.Nullable`1[System.Boolean]] $IsTranslateHostHeaderEnabled,
    [Parameter(Mandatory = $false, ValueFromPipeline = $true, ValueFromPipelineByPropertyName = $true)]
    [System.Nullable`1[System.Boolean]] $IsHttpOnlyCookieEnabled,
    [Parameter(Mandatory = $false, ValueFromPipeline = $true, ValueFromPipelineByPropertyName = $true)]
    [System.Nullable`1[System.Boolean]] $IsSecureCookieEnabled,
    [Parameter(Mandatory = $false, ValueFromPipeline = $true, ValueFromPipelineByPropertyName = $true)]
    [System.Nullable`1[System.Boolean]] $IsPersistentCookieEnabled,
    [Parameter(Mandatory = $false, ValueFromPipeline = $true, ValueFromPipelineByPropertyName = $true)]
    [System.Nullable`1[System.Boolean]] $IsTranslateLinksInBodyEnabled,
    [Parameter(Mandatory = $false, ValueFromPipeline = $true, ValueFromPipelineByPropertyName = $true)]
    [System.String] $ApplicationServerTimeout,
    [Parameter(Mandatory = $false, ValueFromPipeline = $true, ValueFromPipelineByPropertyName = $true)]
    [System.String] $ConnectorGroupId

    )

    PROCESS {    
        $params = @{}
        $customHeaders = New-EntraBetaCustomHeaders -Command $MyInvocation.MyCommand
        $onPremisesPublishing = @{}

        $rootUri = (Get-EntraEnvironment -Name (Get-EntraContext).Environment).GraphEndpoint

        if (-not $rootUri) {
            $rootUri = "https://graph.microsoft.com"
            Write-Verbose "Using default Graph endpoint: $rootUri"
        }
        if($null -ne $PSBoundParameters["DisplayName"])
        {
            $DisplayName = $PSBoundParameters["DisplayName"]
        }
        if($null -ne $PSBoundParameters["ExternalUrl"])
        {
            $onPremisesPublishing["externalUrl"] = $PSBoundParameters["ExternalUrl"]
        }
        if($null -ne $PSBoundParameters["InternalUrl"])
        {
            $onPremisesPublishing["internalUrl"] = $PSBoundParameters["InternalUrl"]   
        }
        if($null -ne $PSBoundParameters["ExternalAuthenticationType"])
        {
            $onPremisesPublishing["externalAuthenticationType"] = $PSBoundParameters["ExternalAuthenticationType"]
            $onPremisesPublishing["externalAuthenticationType"] = $onPremisesPublishing.externalAuthenticationType.Substring(0, 1).ToLower() + $onPremisesPublishing.externalAuthenticationType.Substring(1)
        }
        if($null -ne $PSBoundParameters["IsTranslateHostHeaderEnabled"])
        {
            $onPremisesPublishing["isTranslateHostHeaderEnabled"] = $PSBoundParameters["IsTranslateHostHeaderEnabled"]
        }
        if($null -ne $PSBoundParameters["IsHttpOnlyCookieEnabled"])
        {
            $onPremisesPublishing["isHttpOnlyCookieEnabled"] = $PSBoundParameters["IsHttpOnlyCookieEnabled"]
        }
        if($null -ne $PSBoundParameters["IsSecureCookieEnabled"])
        {
            $onPremisesPublishing["isSecureCookieEnabled"] = $PSBoundParameters["IsSecureCookieEnabled"]
        }
        if($null -ne $PSBoundParameters["IsPersistentCookieEnabled"])
        {
            $onPremisesPublishing["isPersistentCookieEnabled"] = $PSBoundParameters["IsPersistentCookieEnabled"]
        }
        if($null -ne $PSBoundParameters["IsTranslateLinksInBodyEnabled"])
        {
            $onPremisesPublishing["isTranslateLinksInBodyEnabled"] = $PSBoundParameters["IsTranslateLinksInBodyEnabled"]
        }
        if($null -ne $PSBoundParameters["ApplicationServerTimeout"])
        {
            $onPremisesPublishing["applicationServerTimeout"] = $PSBoundParameters["ApplicationServerTimeout"]
        }        

        #Create New App
        $newAppBody = @{
            displayName =  $DisplayName
        } | ConvertTo-Json
        try {
            $NewApp = Invoke-GraphRequest -Uri '/beta/applications' -Method POST -Body $newAppBody
            $Id = $NewApp.Id
        } catch {
            Write-Error $_
            return
        }
        
        # Update InternalUrl and ExternalUrl
        if($null -ne $NewApp){
            if ($ExternalUrl.EndsWith("/")) {
                $exUrl = $ExternalUrl.TrimEnd("/")
            }
            else {
                $exUrl = $ExternalUrl
            }
            $UpdateUrlBody = @{ 
                identifierUris = @($exUrl) 
                web = @{ 
                redirectUris = @($ExternalUrl) 
                homePageUrl = $InternalUrl 
                } 
            } 
            try {
                Invoke-GraphRequest -Uri "/beta/applications/$Id" -Method PATCH -Body $updateUrlBody    
            } catch {
                Write-Error $_
                return
            }
        }
        
        # Create ServicePrincipal
        if($null -ne $NewApp){
            $serviceBody = @{
                appId = $NewApp.AppId
            } | ConvertTo-Json
            try {
                $ServicePrincipal = Invoke-GraphRequest -Uri "/beta/servicePrincipals" -Method POST -Body $serviceBody    
            } catch {
                Write-Error $_
                return
            }
        }
        
        # update onpremises
        if($null -ne $ServicePrincipal -and $null -ne $NewApp){
            $onPremisesPublishingBody = @{onPremisesPublishing = $onPremisesPublishing}
            try {
                Invoke-GraphRequest -Uri "/beta/applications/$Id" -Method PATCH -Body $onPremisesPublishingBody
            } catch {
                Write-Error $_
                return
            }
        }
       
        #update connector group
        if($null -ne $PSBoundParameters["ConnectorGroupId"] -and $null -ne $NewApp){
            $ConnectorGroupId = $PSBoundParameters["ConnectorGroupId"]
            $ConnectorGroupBody = @{
                "@odata.id" = "$rootUri/beta/onPremisesPublishingProfiles/applicationproxy/connectorGroups/$ConnectorGroupId"
            } 
            $ConnectorGroupBody = $ConnectorGroupBody | ConvertTo-Json
            $ConnectorGroupUri = "/beta/applications/$Id/connectorGroup/" + '$ref'
            try {
                Invoke-GraphRequest -Method PUT -Uri $ConnectorGroupUri -Body $ConnectorGroupBody -ContentType "application/json" 
            } catch {
                Write-Error $_
                return
            }
           }
        Write-Debug("============================ TRANSFORMATIONS ============================")
        $params.Keys | ForEach-Object {"$_ : $($params[$_])" } | Write-Debug
        Write-Debug("=========================================================================`n")
        $response = (Invoke-GraphRequest -Uri "/beta/applications/$Id/onPremisesPublishing" -Headers $customHeaders -Method GET) | ConvertTo-Json -depth 10 | ConvertFrom-Json
        $response | ForEach-Object {
            if($null -ne $_) {
                Add-Member -InputObject $_ -MemberType NoteProperty -Name ObjectId -Value $Id
            }
        }
        
        $response = $response | Select-Object ObjectId,ExternalAuthenticationType,ApplicationServerTimeout,ExternalUrl,InternalUrl,IsTranslateHostHeaderEnabled,IsTranslateLinksInBodyEnabled,IsOnPremPublishingEnabled,VerifiedCustomDomainCertificatesMetadata,VerifiedCustomDomainKeyCredential,VerifiedCustomDomainPasswordCredential,SingleSignOnSettings,IsHttpOnlyCookieEnabled,IsSecureCookieEnabled,IsPersistentCookieEnabled | ConvertTo-Json -depth 10 | ConvertFrom-Json
            
        $respType = New-Object Microsoft.Graph.Beta.PowerShell.Models.MicrosoftGraphonPremisesPublishing
            $response.PSObject.Properties | ForEach-Object {
                $propertyName = $_.Name
                $propertyValue = $_.Value
                $respType | Add-Member -MemberType NoteProperty -Name $propertyName -Value $propertyValue -Force
        
            }
        
        $respType
        }        
}

