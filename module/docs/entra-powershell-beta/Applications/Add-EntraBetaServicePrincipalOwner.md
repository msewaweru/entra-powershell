---
description: This article provides details on the Add-EntraBetaServicePrincipalOwner command.
external help file: Microsoft.Entra.Beta.Applications-Help.xml
Locale: en-US
manager: CelesteDG
Module Name: Microsoft.Entra.Beta
ms.author: eunicewaweru
ms.date: 02/08/2025
ms.reviewer: stevemutungi
ms.topic: reference
online version: https://learn.microsoft.com/powershell/module/Microsoft.Entra.Beta/Add-EntraBetaServicePrincipalOwner
schema: 2.0.0
title: Add-EntraBetaServicePrincipalOwner
---

# Add-EntraBetaServicePrincipalOwner

## SYNOPSIS

Add an owner (user or service principal) to a service principal.

## SYNTAX

### ByServicePrincipalIdAndOwnerId

```powershell
Add-EntraBetaServicePrincipalOwner
 -ServicePrincipalId <String>
 -OwnerId <String>
 [<CommonParameters>]
```

## DESCRIPTION

The `Add-EntraBetaServicePrincipalOwner` cmdlet adds an owner to a service principal in Microsoft Entra ID. The owner can be a user, the service principal itself, or another service principal.

## EXAMPLES

### Example 1: Add a user as an owner to a service principal

```powershell
Connect-Entra -Scopes 'Application.ReadWrite.All', 'Application.ReadWrite.OwnedBy'
$servicePrincipal = Get-EntraBetaServicePrincipal -Filter "displayName eq 'Helpdesk Application'"
$owner = Get-EntraBetaUser -UserId 'SawyerM@contoso.com'
Add-EntraBetaServicePrincipalOwner -ServicePrincipalId $servicePrincipal.Id -OwnerId $owner.Id
```

This example demonstrates how to add an owner to a service principal.

- `-ServicePrincipalId` parameter specifies the service principal Id.
- `-OwnerId` parameter specifies the unique ID of the owner, which can be a user, the service principal itself, or another service principal.

### Example 2: Add a service principal as an owner

```powershell
Connect-Entra -Scopes 'Application.ReadWrite.All', 'Application.ReadWrite.OwnedBy'
$servicePrincipal = Get-EntraBetaServicePrincipal -Filter "displayName eq 'Helpdesk Application'"
$owner = Get-EntraBetaServicePrincipal -Filter "displayName eq 'IT Department'"
Add-EntraBetaServicePrincipalOwner -ServicePrincipalId $servicePrincipal.Id -OwnerId $owner.Id
```

This example demonstrates how to add an owner to a service principal.

- `-ServicePrincipalId` parameter specifies the service principal ID.
- `-OwnerId` parameter specifies the unique ID of the owner, which can be a user, the service principal itself, or another service principal.

## PARAMETERS

### -ServicePrincipalId

Specifies the ID of a service principal in Microsoft Entra ID.

```yaml
Type: System.String
Parameter Sets: (All)
Aliases: ObjectId

Required: True
Position: Named
Default value: None
Accept pipeline input: True (ByPropertyName, ByValue)
Accept wildcard characters: False
```

### -OwnerId

Specifies the unique ID of the owner, which can be a user, the service principal itself, or another service principal.

```yaml
Type: System.String
Parameter Sets: (All)
Aliases: RefObjectId

Required: True
Position: Named
Default value: None
Accept pipeline input: True (ByPropertyName, ByValue)
Accept wildcard characters: False
```

### CommonParameters

This cmdlet supports the common parameters: `-Debug`, `-ErrorAction`, `-ErrorVariable`, `-InformationAction`, `-InformationVariable`, `-OutVariable`, `-OutBuffer`, `-PipelineVariable`, `-Verbose`, `-WarningAction`, and `-WarningVariable`. For more information, see [about_CommonParameters](https://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES

## RELATED LINKS

[Get-EntraBetaServicePrincipal](Get-EntraBetaServicePrincipal.md)

[Get-EntraBetaServicePrincipalOwner](Get-EntraBetaServicePrincipalOwner.md)

[Get-EntraBetaUser](../Users/Get-EntraBetaUser.md)

[Remove-EntraBetaServicePrincipalOwner](Remove-EntraBetaServicePrincipalOwner.md)
