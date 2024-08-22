---
title: Get-EntraDirSyncFeature
description: This article provides details on the Get-EntraDirSyncFeature command.


ms.topic: reference
ms.date: 06/26/2024
ms.author: eunicewaweru
ms.reviewer: stevemutungi
manager: CelesteDG
author: msewaweru

external help file: Microsoft.Graph.Entra-help.xml
Module Name: Microsoft.Graph.Entra
online version: https://learn.microsoft.com/powershell/module/Microsoft.Graph.Entra/Get-EntraDirSyncFeature

schema: 2.0.0
---

# Get-EntraDirSyncFeature

## Synopsis

Checks the status of directory synchronization features for a tenant.

## Syntax

```powershell
Get-EntraDirSyncFeature 
 [-TenantId <Guid>] 
 [-Feature <String>] 
 [<CommonParameters>]
```

## Description

The `Get-EntraDirSyncFeature` cmdlet checks the status of directory synchronization features for a tenant.

Some of the features that can be used with this cmdlet include:

- **DeviceWriteback**
- **DirectoryExtensions**
- **DuplicateProxyAddressResiliency**
- **DuplicateUPNResiliency**
- **EnableSoftMatchOnUpn**
- **PasswordSync**
- **SynchronizeUpnForManagedUsers**
- **UnifiedGroupWriteback**
- **UserWriteback**

The cmdlet can be run without specifying any features, in which case it returns a list of all features and their enabled or disabled status.

## Examples

### EXAMPLE 1: Return a list of all directory synchronization features

```powershell
Connect-Entra -Scopes 'OnPremDirectorySynchronization.Read.All'
Get-EntraDirSyncFeature
```

```Output
Enabled DirSyncFeature
------- --------------
  False BlockCloudObjectTakeoverThroughHardMatch
  False BlockSoftMatch
  False BypassDirSyncOverrides
  False CloudPasswordPolicyForPasswordSyncedUsers
  False ConcurrentCredentialUpdate
   True ConcurrentOrgIdProvisioning
  False DeviceWriteback
  False DirectoryExtensions
  False FopeConflictResolution
  False GroupWriteBack
  False PasswordSync
  False PasswordWriteback
   True QuarantineUponProxyAddressesConflict
   True QuarantineUponUpnConflict
   True SoftMatchOnUpn
   True SynchronizeUpnForManagedUsers
  False UnifiedGroupWriteback
  False UserForcePasswordChangeOnLogon
  False UserWriteback
```

This example gets a list of all directory synchronization features and shows if they are enabled (True) or disabled (False).

### EXAMPLE 2: Return PasswordSync feature status

```powershell
Connect-Entra -Scopes 'OnPremDirectorySynchronization.Read.All'
Get-EntraDirSyncFeature -Feature PasswordSync
```

```Output
Enabled DirSyncFeature
------- --------------
  False PasswordSync
```

This example shows if PasswordSync is enabled (True) or disabled (False) for the tenant.

- `Feature` specifies the directory synchronization feature to check the status of.

## Parameters

### -TenantId

The unique ID of the tenant on which to perform the operation. If not provided, the operation defaults to the tenant of the current user. This parameter is applicable only to partner users.

```yaml
Type: System.String
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: True (ByPropertyName, ByValue)
Accept wildcard characters: False
```

### -Feature

The directory synchronization feature to check the status of.

```yaml
Type: System.String
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: True (ByPropertyName, ByValue)
Accept wildcard characters: False
```

### CommonParameters

This cmdlet supports the common parameters: `-Debug`, `-ErrorAction`, `-ErrorVariable`, `-InformationAction`, `-InformationVariable`, `-OutVariable`, `-OutBuffer`, `-PipelineVariable`, `-Verbose`, `-WarningAction`, and `-WarningVariable`. For more information, see [about_CommonParameters](https://go.microsoft.com/fwlink/?LinkID=113216).

## Inputs

## Outputs

## Notes

## Related Links

[Set-EntraDirSyncFeature](Set-EntraDirSyncFeature.md)