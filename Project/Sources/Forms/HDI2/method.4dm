Case of 
		
	: (FORM Event:C1606.code=On Load:K2:1)
		
		InitInfo
		
		Init
		
		InitOfficeManager()
		
	: (FORM Event:C1606.code=On Unload:K2:2)
		
		Try(Form:C1466.OfficeAsync.kill())
		KILL WORKER:C1390("WebSocketServer")
		
End case 

