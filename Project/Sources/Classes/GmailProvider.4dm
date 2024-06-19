Class constructor()
	var $credential:={}
	var $myCredentials:=ds:C1482.Credentials.get(1)
	
	$credential.name:="Google"
	$credential.permission:="signedIn"
	$credential.clientId:=$myCredentials.ClientID
	$credential.clientSecret:=$myCredentials.ClientSecret
	
	$credential.redirectURI:="http://localhost:50993/authorize/"
	$credential.scope:="https://www.googleapis.com/auth/gmail.modify"
	$credential.timeout:=60
	// The display of the connection interface is managed by the developer.
	$credential.browserAutoOpen:=False:C215
	
	This:C1470.OAuth2:=cs:C1710.NetKit.OAuth2Provider.new($credential)
	
	// Returns the URI to open to Gmail login UI****************************
Function get authenticateURI() : Text
	
	return This:C1470.OAuth2.authenticateURI
	
	// Waits for the token response and returns true if correctly receives**
Function getToken() : Boolean
	
	return Try(This:C1470.OAuth2.getToken()#Null:C1517 ? True:C214 : False:C215)
	
	// Creates the hierarchical list of labels *****************************
Function getLabels() : Object
	Try
		var $labels : Object:=cs:C1710.NetKit.Google.new(This:C1470.OAuth2).mail.getLabelList()
		
		// Creation of the list 
		return cs:C1710.CreateLabelObject.new($labels).createList()
	Catch
		return {}
	End try
	
	// Downloading of the emails *******************************************
Function getMails($labelId) : Collection
	var $google:=cs:C1710.NetKit.Google.new(This:C1470.OAuth2)
	
	// downloads 10 emails
	var $mailIds : Collection:=$google.mail.getMailIds({labelIds: [$labelId]; top: 10}).mailIds
	return $mailIds.length>0 ? $google.mail.getMails($mailIds; {format: "metadata"}) : []
	
	