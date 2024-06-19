Class constructor($windowRef : Integer)
	
	This:C1470.windowRef:=$windowRef
	
	var $credential : Object
	var $myCredentials:=ds:C1482.Credentials.get(2)
	
	$credential:=New object:C1471()
	$credential.name:="Microsoft"
	$credential.permission:="signedIn"
	$credential.clientId:=$myCredentials.ClientID
	$credential.redirectURI:="http://127.0.0.1:50993/authorize/"
	$credential.scope:="https://graph.microsoft.com/.default"
	$credential.authenticationPage:=Folder:C1567(fk web root folder:K87:15).file("authenticate/authentication.htm")
	
	$credential.prompt:="select_account"
	
	$credential.timeout:=120
	// The display of the connection interface is managed by the developer.
	$credential.browserAutoOpen:=False:C215
	
	This:C1470._OAuth2:=cs:C1710.NetKit.OAuth2Provider.new($credential)
	
	This:C1470._UpdateFormContext()
	
	CALL FORM:C1391(This:C1470.windowRef; Formula:C1597(WA OPEN URL:C1020(*; "WAConnection"; $1)); This:C1470._OAuth2.authenticateURI)
	
	// *******************************************************************
Function getToken()
	
	If (Try(This:C1470._OAuth2.getToken())#Null:C1517)
		This:C1470._UpdateFormContext()
	End if 
	
	// Call a method to manage the display
	CALL FORM:C1391(This:C1470.windowRef; Formula:C1597(OnTokenReceived()))
	
	// Creates the hierarchical list of folders **************************
Function getFolders()
	
	// Creation of the list 
	var $listObject:=cs:C1710.CreateFolderObject.new(This:C1470._OAuth2).createList()
	var $list:=cs:C1710.ListManager.new($listObject)
	
	This:C1470._UpdateFormContext()
	
	// Call a method to manage the display
	CALL FORM:C1391(This:C1470.windowRef; Formula:C1597(OnFolderListCreated($1)); $list)
	
	// Downloading of the emails *****************************************
Function getMails($param : Object)
	var $mails : Collection
	
	// Downloads the emails
	$mails:=cs:C1710.NetKit.Office365.new(This:C1470._OAuth2).mail.getMails($param).mails
	
	This:C1470._UpdateFormContext()
	
	// Call a method to manage the display
	CALL FORM:C1391(This:C1470.windowRef; Formula:C1597(OnMailListcreated($1)); $mails)
	
	// Save the OAuth2Provider with the updated token in the main process
Function _UpdateFormContext()
	
	CALL FORM:C1391(This:C1470.windowRef; Formula:C1597(Form:C1466.OAuth2Provider:=$1); This:C1470._OAuth2)
	