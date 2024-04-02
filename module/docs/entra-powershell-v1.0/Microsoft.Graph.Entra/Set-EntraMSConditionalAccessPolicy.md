---
external help file: Microsoft.Graph.Entra-Help.xml
Module Name: Microsoft.Graph.Entra
online version:
schema: 2.0.0
---

# Set-EntraMSConditionalAccessPolicy

## SYNOPSIS
Updates a conditional access policy in Microsoft Entra ID by Id.

## SYNTAX

```
Set-EntraMSConditionalAccessPolicy [-Conditions <ConditionalAccessConditionSet>]
 [-GrantControls <ConditionalAccessGrantControls>] [-DisplayName <String>] [-Id <String>] -PolicyId <String>
 [-State <String>] [-SessionControls <ConditionalAccessSessionControls>] [<CommonParameters>]
```

## DESCRIPTION
This cmdlet allows an admin to update a conditional access policy in Microsoft Entra ID by Id.
Conditional access policies are custom rules that define an access scenario.

## EXAMPLES

### Example 1: Updates a conditional access policy in Azure AD by PolicyId.
```
PS C:\> Set-EntraMSConditionalAccessPolicy -PolicyId 6b5e999b-0ba8-4186-a106-e0296c1c4358 -DisplayName "MFA policy 1" -State "Enabled"

          Id                      : 6b5e999b-0ba8-4186-a106-e0296c1c4358
          DisplayName             : MFA policy 1
          CreatedDateTime         : 2019-09-26T23:12:16.0792706Z
          ModifiedDateTime        : 2019-09-27T00:12:12.5986473Z
          State                   : Enabled
```

This command updates a new conditional access policy in Azure AD.

## PARAMETERS

### -PolicyId
Specifies the policy id of a conditional access policy in Microsoft Entra ID.

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

### -DisplayName
Specifies the display name of a conditional access policy in Microsoft Entra ID.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -State
Specifies the enabled or disabled state of the conditional access policy in Microsoft Entra ID.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Conditions
Specifies the conditions for the conditional access policy in Microsoft Entra ID.

```yaml
Type: ConditionalAccessConditionSet
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -GrantControls
Specifies the controls for the conditional access policy in Microsoft Entra ID.

```yaml
Type: ConditionalAccessGrantControls
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Id
{{ Fill Id Description }}

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -SessionControls
{{ Fill SessionControls Description }}

```yaml
Type: ConditionalAccessSessionControls
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](https://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES
## RELATED LINKS

[Get-EntraMSConditionalAccessPolicy]()

[New-EntraMSConditionalAccessPolicy]()

[Remove-EntraMSConditionalAccessPolicy]()
