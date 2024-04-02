---
title: Get-EntraContactDirectReport
description: This article provides details on the Get-EntraContactDirectReport command.

ms.service: active-directory
ms.topic: reference
ms.date: 03/22/2024
ms.author: eunicewaweru
ms.reviewer: stevemutungi
manager: CelesteDG
author: msewaweru

external help file: Microsoft.Graph.Entra-Help.xml
Module Name: Microsoft.Graph.Entra
online version:
schema: 2.0.0
---

# Get-EntraContactDirectReport

## SYNOPSIS
Get the direct reports for a contact.

## SYNTAX

```powershell
Get-EntraContactDirectReport 
    -ObjectId <String> 
    [-All <Boolean>] 
    [-Top <Int32>] 
    [<CommonParameters>]
```

## DESCRIPTION
The **Get-EntraContactDirectReport** cmdlet gets the direct reports for a contact.

## EXAMPLES

### Example 1: Get the direct reports of a contact
```powershell
PS C:\> $Contact = Get-EntraContact -Top 1
PS C:\> Get-EntraContactDirectReport -ObjectId $Contact.ObjectId
```

The first command gets a contact by using the [Get-EntraContact](./Get-EntraContact.md) cmdlet, and then stores it in the $Contact variable.  

The second command gets the direct reports for $Contact.

## PARAMETERS

### -All
If true, return all direct reports.
If false, return the number of objects specified by the Top parameter.

```yaml
Type: Boolean
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: True (ByPropertyName, ByValue)
Accept wildcard characters: False
```

### -ObjectId
Specifies the ID of a contact in Microsoft Entra ID.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: True (ByPropertyName, ByValue)
Accept wildcard characters: False
```

### -Top
Specifies the maximum number of records to return.

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: True (ByPropertyName, ByValue)
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](https://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES

## RELATED LINKS

[Get-EntraContact](Get-EntraContact.md)
