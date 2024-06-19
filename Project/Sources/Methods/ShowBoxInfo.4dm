//%attributes = {}
#DECLARE($enable : Boolean)


OBJECT SET ENABLED:C1123(*; "Hierarchical List"; $enable)
OBJECT SET ENABLED:C1123(*; "List Box"; $enable)
OBJECT SET ENABLED:C1123(*; "Variable4"; $enable)
OBJECT SET ENABLED:C1123(*; "Variable5"; $enable)
OBJECT SET ENABLED:C1123(*; "Variable6"; $enable)
OBJECT SET ENABLED:C1123(*; "Variable9"; $enable)
OBJECT SET ENABLED:C1123(*; "Button"; $enable)
OBJECT SET ENABLED:C1123(*; "Variable3"; $enable)
OBJECT SET ENABLED:C1123(*; "Input1"; $enable)

OBJECT SET VISIBLE:C603(*; "web area"; $enable)

OBJECT SET VISIBLE:C603(*; "WAConnection"; Not:C34($enable))

If ($enable)
	OBJECT SET TITLE:C194(*; "ConnectBt"; "Sign out  ")
Else 
	OBJECT SET TITLE:C194(*; "ConnectBt"; "Sign in   ")
End if 