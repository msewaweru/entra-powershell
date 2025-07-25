---
description: This article provides details on the Remove-EntraApplication command.
external help file: Microsoft.Entra.Applications-Help.xml
Locale: en-US
manager: CelesteDG
Module Name: Microsoft.Entra
ms.author: eunicewaweru
ms.date: 06/26/2024
ms.reviewer: stevemutungi
ms.topic: reference
online version: https://learn.microsoft.com/powershell/module/Microsoft.Entra/Remove-EntraApplication
schema: 2.0.0
title: Remove-EntraApplication
---

# Remove-EntraApplication

## SYNOPSIS

Deletes an application object.

## SYNTAX

```powershell
Remove-EntraApplication
 -ApplicationId <String>
 [<CommonParameters>]
```

## DESCRIPTION

The `Remove-EntraApplication` cmdlet deletes an application object identified by ApplicationId. Specify the `ApplicationId` parameter to delete an application object.

## EXAMPLES

### Example 1: Remove an application

```powershell
Connect-Entra -Scopes 'Application.ReadWrite.All'
$application = Get-EntraApplication -Filter "DisplayName eq 'Contoso Helpdesk Application'"
Remove-EntraApplication -ApplicationId $application.Id
```

This example demonstrates how to delete an application object.

### Example 2: Remove an application using pipelining

```powershell
Connect-Entra -Scopes 'Application.ReadWrite.All'
Get-EntraApplication -Filter "DisplayName eq 'Contoso Helpdesk Application'" | Remove-EntraApplication
```

This example demonstrates how to delete an application object using pipelining.

## PARAMETERS

### -ApplicationId

Specifies the ID of an application in Microsoft Entra ID.

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

### System.String

## OUTPUTS

## NOTES

## RELATED LINKS

[Get-EntraApplication](Get-EntraApplication.md)

[New-EntraApplication](New-EntraApplication.md)

[Set-EntraApplication](Set-EntraApplication.md)
