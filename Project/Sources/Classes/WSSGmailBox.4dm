Class constructor()
	
	
/** Function called each time a new user log in
 In this example, we accept all the connections */
Function onConnection($wss : Object; $param : Object) : Object
	
	// Instanciates WSClientHandler class that manage the user connection behavior
	return cs:C1710.WSGmailBoxHandler.new()
	
Function onTerminate($wss : Object; $param : Object)
	
	KILL WORKER:C1390("WebSocketServer")
	
Function onError()
	ALERT:C41("Websocker server error")
	KILL WORKER:C1390("WebSocketServer")