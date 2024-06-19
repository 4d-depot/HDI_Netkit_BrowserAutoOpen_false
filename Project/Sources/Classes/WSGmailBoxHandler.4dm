Class constructor()
	
	/// Defines a connection behavior
Function onOpen($ws : 4D:C1709.WebSocketConnection; $event : Object)
	
	This:C1470.Mailbox:=cs:C1710.GmailProvider.new()
	
	
	// Called each time the user sends a message
Function onMessage($ws : Object; $event : Object)
	
	Case of 
			// Sends the redirect URI to the client to display the Gmail connection UI
		: ($event.data.type="redirectURI")
			This:C1470.Mailbox:=cs:C1710.GmailProvider.new()
			This:C1470._sendMessage($ws; $event.data.type; This:C1470.Mailbox.authenticateURI)
			
			// Sends the label list to the client
		: ($event.data.type="getLabels")
			This:C1470._sendMessage($ws; $event.data.type; This:C1470.Mailbox.getLabels())
			
			// Sends the mail list to the client according to the labelId received
		: ($event.data.type="getMails")
			This:C1470._sendMessage($ws; $event.data.type; This:C1470.Mailbox.getMails($event.data.data))
			
			// Waits for the token reception and returns true if the token is correctly received, false otherwise
		: ($event.data.type="getToken")
			This:C1470._sendMessage($ws; $event.data.type; This:C1470.Mailbox.getToken())
			
	End case 
	
Function _sendMessage($ws : Object; $type : Text; $data : Variant)
	
	$ws.send({type: $type; data: $data})
	