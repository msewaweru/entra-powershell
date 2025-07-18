---
author: msewaweru
description: This article provides details on the Remove-EntraGroupMember command.
external help file: Microsoft.Entra.Groups-Help.xml
Locale: en-US
manager: CelesteDG
Module Name: Microsoft.Entra
ms.author: eunicewaweru
ms.date: 06/26/2024
ms.reviewer: stevemutungi
ms.topic: reference
online version: https://learn.microsoft.com/powershell/module/Microsoft.Entra/Remove-EntraGroupMember
schema: 2.0.0
title: Remove-EntraGroupMember
---

# Remove-EntraGroupMember

## SYNOPSIS

Removes a member from a group.

## SYNTAX

```powershell
Remove-EntraGroupMember
 -GroupId <String>
 -MemberId <String>
 [<CommonParameters>]
```

## DESCRIPTION

The `Remove-EntraGroupMember` cmdlet removes a member from a group in Microsoft Entra ID. Specify the `ObjectId` and `MemberId` parameters to remove a member from a group.

## EXAMPLES

### Example 1: Remove a member

```powershell
Connect-Entra -Scopes 'GroupMember.ReadWrite.All'
$group = Get-EntraGroup -Filter "DisplayName eq 'HelpDesk Team Leaders'"
$groupMember = Get-EntraGroup -GroupId $group.Id | Get-EntraGroupMember | Where-Object {$_.displayName -eq 'Adele Vance'}
Remove-EntraGroupMember -GroupId $group.Id -MemberId $groupMember.Id
```

This command removes the specified member from the specified group.  

- `GroupId` - Specifies the object ID of a group in Microsoft Entra ID.

- `MemberId` - Specifies the ID of the member to remove.

## PARAMETERS

### -MemberId

Specifies the ID of the member to remove.

```yaml
Type: System.String
Parameter Sets: (All)
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: True (ByPropertyName, ByValue)
Accept wildcard characters: False
```

### -GroupId

Specifies the object ID of a group in Microsoft Entra ID.

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

### CommonParameters

This cmdlet supports the common parameters: `-Debug`, `-ErrorAction`, `-ErrorVariable`, `-InformationAction`, `-InformationVariable`, `-OutVariable`, `-OutBuffer`, `-PipelineVariable`, `-Verbose`, `-WarningAction`, and `-WarningVariable`. For more information, see [about_CommonParameters](https://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES

## RELATED LINKS

[Add-EntraGroupMember](Add-EntraGroupMember.md)

[Get-EntraGroupMember](Get-EntraGroupMember.md)
