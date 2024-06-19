//%attributes = {}
// callback called after the reception of the token
If (Form:C1466.OAuth2Provider.token#Null:C1517)
	
	OBJECT SET VISIBLE:C603(*; "Spinner1"; True:C214)
	
	// Starts the creation of the folder list
	Form:C1466.OfficeAsync.getFolders()
	
	ShowBoxInfo(True:C214)
	
Else 
	// close the connection web area if token not receive correctly
	OBJECT SET VISIBLE:C603(*; "WAConnection"; False:C215)
	
End if 