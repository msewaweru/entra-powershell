# ------------------------------------------------------------------------------
#  Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.
# ------------------------------------------------------------------------------
BeforeAll {  
    if ((Get-Module -Name Microsoft.Entra.Beta.DirectoryManagement) -eq $null) {
        Import-Module Microsoft.Entra.Beta.DirectoryManagement        
    }
    Import-Module (Join-Path $PSScriptRoot "..\..\Common-Functions.ps1") -Force

    Mock -CommandName Get-EntraContext -MockWith { @{
        Environment = "Global"
    }} -ModuleName Microsoft.Entra.Beta.DirectoryManagement
    Mock -CommandName Get-EntraEnvironment -MockWith {return @{
        GraphEndpoint = "https://graph.microsoft.com"
    }} -ModuleName Microsoft.Entra.Beta.DirectoryManagement
    Mock -CommandName New-MgBetaDeviceRegisteredOwnerByRef -MockWith {} -ModuleName Microsoft.Entra.Beta.DirectoryManagement
}

Describe "Add-EntraBetaDeviceRegisteredOwner" {
    Context "Test for Add-EntraBetaDeviceRegisteredOwner" {
        It "Should return empty object" {
            $result = Add-EntraBetaDeviceRegisteredOwner -DeviceId "aaaaaaaa-0000-1111-2222-bbbbbbbbbbbb" -OwnerId "bbbbbbbb-1111-2222-3333-cccccccccccc"
            $result | Should -BeNullOrEmpty

            Should -Invoke -CommandName New-MgBetaDeviceRegisteredOwnerByRef -ModuleName Microsoft.Entra.Beta.DirectoryManagement -Times 1
        }
        It "Should execute successfully with Alias" {
            $result = Add-EntraBetaDeviceRegisteredOwner -DeviceId "aaaaaaaa-0000-1111-2222-bbbbbbbbbbbb" -RefObjectId "bbbbbbbb-1111-2222-3333-cccccccccccc"
            $result | Should -BeNullOrEmpty

            Should -Invoke -CommandName New-MgBetaDeviceRegisteredOwnerByRef -ModuleName Microsoft.Entra.Beta.DirectoryManagement -Times 1
        }
        It "Should fail when DeviceId is empty" {
            { Add-EntraBetaDeviceRegisteredOwner -DeviceId  -OwnerId "bbbbbbbb-1111-2222-3333-cccccccccccc" } | Should -Throw "Missing an argument for parameter 'DeviceId'.*"
        }
        It "Should fail when DeviceId is invalid" {
            { Add-EntraBetaDeviceRegisteredOwner -DeviceId "" -OwnerId "bbbbbbbb-1111-2222-3333-cccccccccccc" } | Should -Throw "Cannot bind argument to parameter 'DeviceId' because it is an empty string."
        }
        It "Should fail when OwnerId is empty" {
            { Add-EntraBetaDeviceRegisteredOwner -DeviceId "aaaaaaaa-0000-1111-2222-bbbbbbbbbbbb" -OwnerId } | Should -Throw "Missing an argument for parameter 'OwnerId'.*"
        }
        It "Should fail when OwnerId is invalid" {
            { Add-EntraBetaDeviceRegisteredOwner -DeviceId "aaaaaaaa-0000-1111-2222-bbbbbbbbbbbb" -OwnerId "" } | Should -Throw "Cannot bind argument to parameter 'OwnerId' because it is an empty string."
        }
        It "Should contain DeviceId in parameters when passed ObjectId to it" {
            Mock -CommandName New-MgBetaDeviceRegisteredOwnerByRef -MockWith { $args } -ModuleName Microsoft.Entra.Beta.DirectoryManagement

            $result = Add-EntraBetaDeviceRegisteredOwner -DeviceId "aaaaaaaa-0000-1111-2222-bbbbbbbbbbbb" -OwnerId "412be9d1-1460-4061-8eed-cca203fcb215"
            $params = Get-Parameters -data $result
            $params.DeviceId | Should -Be "aaaaaaaa-0000-1111-2222-bbbbbbbbbbbb"
        }
        It "Should contain BodyParameter in parameters when passed OwnerId to it" {
            Mock -CommandName New-MgBetaDeviceRegisteredOwnerByRef -MockWith { $args } -ModuleName Microsoft.Entra.Beta.DirectoryManagement

            Add-EntraBetaDeviceRegisteredOwner -DeviceId "aaaaaaaa-0000-1111-2222-bbbbbbbbbbbb" -OwnerId "bbbbbbbb-1111-2222-3333-cccccccccccc"
            $value = @{
                "@odata.id" = "https://graph.microsoft.com/beta/directoryObjects/bbbbbbbb-1111-2222-3333-cccccccccccc"
            }
            Should -Invoke -CommandName New-MgBetaDeviceRegisteredOwnerByRef -ModuleName Microsoft.Entra.Beta.DirectoryManagement -Times 1 -ParameterFilter {
                $BodyParameter.AdditionalProperties.'@odata.id' | Should -Be $value.'@odata.id'
                Write-Host $BodyParameter.AdditionalProperties.'@odata.id'
                $true
            }
        }
        It "Should contain 'User-Agent' header" {
            $userAgentHeaderValue = "PowerShell/$psVersion EntraPowershell/$entraVersion Add-EntraBetaDeviceRegisteredOwner"

            Add-EntraBetaDeviceRegisteredOwner -DeviceId "aaaaaaaa-0000-1111-2222-bbbbbbbbbbbb" -OwnerId "bbbbbbbb-1111-2222-3333-cccccccccccc"
            
            $userAgentHeaderValue = "PowerShell/$psVersion EntraPowershell/$entraVersion Add-EntraBetaDeviceRegisteredOwner"

            Should -Invoke -CommandName New-MgBetaDeviceRegisteredOwnerByRef -ModuleName Microsoft.Entra.Beta.DirectoryManagement -Times 1 -ParameterFilter {
                $Headers.'User-Agent' | Should -Be $userAgentHeaderValue
                $true
            }
        }

        It "Should execute successfully without throwing an error" {
            # Disable confirmation prompts       
            $originalDebugPreference = $DebugPreference
            $DebugPreference = 'Continue'

            try {
                # Act & Assert: Ensure the function doesn't throw an exception
                { Add-EntraBetaDeviceRegisteredOwner -DeviceId "aaaaaaaa-0000-1111-2222-bbbbbbbbbbbb" -OwnerId "bbbbbbbb-1111-2222-3333-cccccccccccc" -Debug } | Should -Not -Throw
            }
            finally {
                # Restore original confirmation preference            
                $DebugPreference = $originalDebugPreference        
            }
        }  
    }
}        

