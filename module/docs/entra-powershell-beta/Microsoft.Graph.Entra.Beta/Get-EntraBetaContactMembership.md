---
external help file: Microsoft.Graph.Entra.Beta-Help.xml
Module Name: Microsoft.Graph.Entra.Beta
online version:
schema: 2.0.0
---

# Get-EntraBetaContactMembership

## SYNOPSIS
Get a contact membership.

## SYNTAX

```
Get-EntraBetaContactMembership -ObjectId <String> [-All <Boolean>] [-Top <Int32>] [<CommonParameters>]
```

## DESCRIPTION
The Get-EntraBetaContactMembership cmdlet gets a contact membership in Azure Active Directory.

## EXAMPLES

### Example 1: Get the memberships of a contact
```
PS C:\> $Contact = Get-EntraBetaContact -Top 1
PS C:\> Get-EntraBetaContactMembership -ObjectId $Contact.ObjectId

ObjectId                             ObjectType
--------                             ----------
0015df25-808e-4715-9c24-a6929c25c201 Group
```

The first command gets a contact by using the Get-EntraBetaContact (./Get-EntraBetaContact.md)cmdlet, and then stores it in the $Contact variable.

The second command gets the memberships for $Contact.

## PARAMETERS

### -All
If true, return all memberships.
If false, return the number of objects specified by the Top parameter

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
Specifies the ID of a contact in Azure Active Directory.

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

[Get-EntraBetaContact]()
